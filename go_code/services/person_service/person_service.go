package person_service

import (
	pb "AutoEnterpise/go_code/generated/person"
	"AutoEnterpise/go_code/utils"
	"context"
	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/jackc/pgx/v5/tracelog"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"log"
	"net"
)

type PersonService struct {
	pb.UnimplementedPersonServiceServer
	Dbpool *pgxpool.Pool
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

	pb.RegisterPersonServiceServer(grpcServer, &PersonService{Dbpool: dbpool})

	log.Println("gRPC сервер запущен на :12345")

	if err := grpcServer.Serve(lis); err != nil {
		log.Fatal(err)
		return
	}
}
