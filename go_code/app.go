package main

import (
	pb_person "AutoEnterpise/go_code/generated/person"
	pb_transport "AutoEnterpise/go_code/generated/transport"
	pb_trip "AutoEnterpise/go_code/generated/trips"
	"AutoEnterpise/go_code/services/person_service"
	"AutoEnterpise/go_code/services/transport_service"
	"AutoEnterpise/go_code/services/trip_service"
	"AutoEnterpise/go_code/utils"
	"context"
	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/jackc/pgx/v5/tracelog"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"log"
	"net"
)

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
	lis, err := net.Listen("tcp", ":12345")
	if err != nil {
		log.Fatal(err)
		return
	}

	grpcServer := grpc.NewServer(grpc.Creds(insecure.NewCredentials()))

	pb_person.RegisterPersonServiceServer(grpcServer, &person_service.PersonService{Dbpool: dbpool})
	pb_transport.RegisterTransportServiceServer(grpcServer, &transport_service.TransportService{Dbpool: dbpool})
	pb_trip.RegisterTripsServiceServer(grpcServer, &trip_service.TripService{Dbpool: dbpool})

	log.Println("gRPC сервер запущен на :12345")

	if err := grpcServer.Serve(lis); err != nil {
		log.Fatal(err)
		return
	}
}
