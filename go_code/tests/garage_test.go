package tests

import (
	pb "AutoEnterpise/go_code/generated/transport"
	"context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
	"testing"
	"time"
)

func createGarage(ctx context.Context, client pb.TransportServiceClient, garage *pb.GarageFacility) *pb.GarageFacility {
	res, err := client.CreateGarage(ctx, garage)
	if err != nil {
		log.Fatal(err)
	}
	return res
}

func alterGarage(ctx context.Context, client pb.TransportServiceClient, garage *pb.GarageFacility) *pb.GarageFacility {
	res, err := client.AlterGarage(ctx, garage)
	if err != nil {
		log.Fatal(err)
	}
	return res
}

func TestGarageCreate(t *testing.T) {
	conn, err := grpc.NewClient("127.0.0.1:12346", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	defer conn.Close()
	client := pb.NewTransportServiceClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	defer cancel()
	createGarage(ctx, client, &garage)
}

func TestGarageAlter(t *testing.T) {
	conn, err := grpc.NewClient("127.0.0.1:12346", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	defer conn.Close()
	client := pb.NewTransportServiceClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	defer cancel()
	var id int32 = 1
	garage.Id = &id
	garage.Name = "Гараж 1"
	res := alterGarage(ctx, client, &garage)
	log.Printf("Ответ сервера: %s", res)
}

func TestGettAllGarages(t *testing.T) {
	conn, err := grpc.NewClient("127.0.0.1:12346", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	defer conn.Close()
	client := pb.NewTransportServiceClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	defer cancel()
	garages, err := client.GetAllGarages(ctx, &emptypb.Empty{})
	if err != nil {
		log.Fatalf("Ошибка при вызове GetAllGarages: %v", err)
	}
	log.Printf("Ответ сервера: %s", garages)
}
