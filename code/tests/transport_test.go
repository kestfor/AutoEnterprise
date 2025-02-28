package tests

import (
	pb "AutoEnterpise/code/generated/transport"
	"context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"log"
	"testing"
	"time"
)

func createTransport(ctx context.Context, client pb.TransportServiceClient, transport *pb.Transport) *pb.Transport {
	res, err := client.CreateTransport(ctx, transport)
	if err != nil {
		log.Fatal(err)
	}
	return res
}

func TestTransportCreate(t *testing.T) {
	conn, err := grpc.NewClient("127.0.0.1:12346", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	defer conn.Close()
	client := pb.NewTransportServiceClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	defer cancel()
	createTransport(ctx, client, &bus)
	createTransport(ctx, client, &tram)
	createTransport(ctx, client, &trolleybus)
	createTransport(ctx, client, &truck)
	createTransport(ctx, client, &taxi)
}
