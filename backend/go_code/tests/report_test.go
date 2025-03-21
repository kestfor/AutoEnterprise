package tests

import (
	pb "AutoEnterpise/go_code/generated/report"
	"context"
	"fmt"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
	"testing"
	"time"
)

func getConnection() pb.ReportServiceClient {
	conn, err := grpc.NewClient("127.0.0.1:12345", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	client := pb.NewReportServiceClient(conn)
	return client
}

func TestDriversDist(t *testing.T) {
	client := getConnection()
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	resp, err := client.GetDriversDistribution(ctx, &emptypb.Empty{})
	defer cancel()
	if err != nil {
		log.Fatalf("Ошибка при вызове GetDriversDistribution: %v", err)
	} else {
		log.Println(resp.DriversDistribution)
	}
}

func TestPassengerTrDist(t *testing.T) {
	client := getConnection()
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	resp, err := client.GetPassengerTransportDistribution(ctx, &emptypb.Empty{})
	defer cancel()
	if err != nil {
		log.Fatalf("Ошибка при вызове PassengerTransportDistribution: %v", err)
	} else {
		log.Println(resp.PassengerTransportDistribution)
	}
}

func TestSubordination(t *testing.T) {
	client := getConnection()
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	resp, err := client.GetSubordination(ctx, &emptypb.Empty{})
	defer cancel()
	if err != nil {
		log.Fatalf("Ошибка при вызове GetSubordination: %v", err)
	} else {
		printSub(resp.Subordinations[0], "")
	}
}

func TestTransport2GarageMapping(t *testing.T) {
	client := getConnection()
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	resp, err := client.GetTransportByGarageDistribution(ctx, &emptypb.Empty{})
	defer cancel()
	if err != nil {
		log.Fatalf("Ошибка при вызове GetTransportByGarageDistribution: %v", err)
	} else {
		for k, v := range resp.Mapping {
			fmt.Printf("Transport: %s, Garage: %v\n", k, v)
		}
	}
}

func printSub(sub *pb.Subordination, shift string) {
	id, name := sub.PersonId, sub.PersonName
	fmt.Printf(shift+"<ID: %d, Name: %s, Role: %s>\n", id, name, sub.Role)
	if len(sub.Subordinates) > 0 {
		fmt.Println(shift + "Subordinates: ")
		for _, s := range sub.Subordinates {
			printSub(s, shift+"\t")
		}
	}
}
