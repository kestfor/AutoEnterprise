package trip_service

import (
	pb "AutoEnterpise/go_code/generated/trips"
	trips2 "AutoEnterpise/go_code/services/trip_service/trips"
	"AutoEnterpise/go_code/utils"
	"context"
	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/jackc/pgx/v5/tracelog"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
	"net"
)

type TripService struct {
	pb.UnimplementedTripsServiceServer
	Dbpool *pgxpool.Pool
}

func NewTripService(dbpool *pgxpool.Pool) *TripService {
	return &TripService{Dbpool: dbpool}
}

type MyLogger struct {
}

func (l *MyLogger) Log(ctx context.Context, level tracelog.LogLevel, msg string, data map[string]any) {

	if msg == "Query" {
		err, ok := data["err"]
		if ok {
			log.Printf("LOG.%v, SQL: %v, %v", level, data["sql"], err)
		} else {
			log.Printf("LOG.%v, SQL: %v", level, data["sql"])
		}
	}
}

func (t *TripService) GetFilteredTrips(ctx context.Context, filter *pb.TripFilter) (*pb.TripList, error) {
	cnt := trips2.NewTripControllerFabric(t.Dbpool)
	trips, err := cnt.Filtered(ctx, filter)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d trips", len(trips))
		return &pb.TripList{Trips: trips}, nil
	}
}

func (t *TripService) GetAllTrips(ctx context.Context, _ *emptypb.Empty) (*pb.TripList, error) {
	cnt := trips2.NewTripControllerFabric(t.Dbpool)
	trips, err := cnt.All(ctx)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d trips", len(trips))
		return &pb.TripList{Trips: trips}, nil
	}
}

func (t *TripService) CreateTrip(ctx context.Context, trip *pb.Trip) (*pb.Trip, error) {
	cnt := trips2.NewTripControllerFabric(t.Dbpool)
	err := cnt.Create(ctx, trip)
	if err != nil {
		log.Println(err)
	}
	return trip, err
}

//func (t *TripService) DeleteTrips(ctx context.Context, req *pb.DeleteRequest) (*emptypb.Empty, error) {
//	cnt := trips2.NewTripControllerFabric(t.Dbpool)
//	err := cnt.Delete(ctx, req.Ids)
//	return &emptypb.Empty{}, err
//}

func (t *TripService) AlterTrip(ctx context.Context, trip *pb.Trip) (*pb.Trip, error) {
	cnt := trips2.NewTripControllerFabric(t.Dbpool)
	err := cnt.Alter(ctx, trip)
	if err != nil {
		log.Println(err)
	}
	return trip, err
}

func main() {
	config := utils.GetConfig(".env")
	dsn := config.DSN()
	pgxConf, err := pgxpool.ParseConfig(dsn)
	if err != nil {
		log.Fatal(err)
		return
	}
	pgxConf.ConnConfig.Tracer = &tracelog.TraceLog{Logger: &MyLogger{}, LogLevel: tracelog.LogLevelInfo}

	dbpool, err := pgxpool.NewWithConfig(context.Background(), pgxConf)
	lis, err := net.Listen("tcp", ":12347")
	if err != nil {
		log.Fatal(err)
		return
	}

	grpcServer := grpc.NewServer(grpc.Creds(insecure.NewCredentials()))

	pb.RegisterTripsServiceServer(grpcServer, &TripService{Dbpool: dbpool})

	log.Println("gRPC сервер запущен на :12347")

	if err := grpcServer.Serve(lis); err != nil {
		log.Fatal(err)
		return
	}
}
