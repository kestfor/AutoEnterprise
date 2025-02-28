package tests

import (
	pb "AutoEnterpise/code/generated/person"
	"context"
	"fmt"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
	"testing"
	"time"
)

func TestAlterBrigade(t *testing.T) {
	conn, err := grpc.NewClient("127.0.0.1:12345", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	defer conn.Close()
	client := pb.NewPersonServiceClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	defer cancel()
	resp, err := client.GetAllBrigades(ctx, &emptypb.Empty{})

	if err != nil {
		log.Fatalf("Ошибка при вызове GetAllBrigades: %v", err)
	}

	if len(resp.GetBrigades()) == 0 {
		log.Printf("Нет бригад для изменения")
		return
	}

	brigade := resp.GetBrigades()[0]
	brigade.Name = "Бригада 3"
	_, err = client.AlterBrigade(ctx, brigade)
	if err != nil {
		log.Fatalf("Ошибка при вызове AlterBrigade: %v", err)

	}
}

func TestCreateBrigade(t *testing.T) {
	conn, err := grpc.NewClient("127.0.0.1:12345", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	defer conn.Close()
	client := pb.NewPersonServiceClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	defer cancel()

	resp, err := client.GetAllPersons(ctx, &emptypb.Empty{})
	if err != nil {
		log.Fatalf("Ошибка при вызове GetAllPersons: %v", err)
	} else {
		log.Printf("Ответ сервера 1: %s", resp)
	}

	if len(resp.GetPersons()) == 0 {
		log.Printf("Нет персон для создания бригады")
		return
	}

	person := resp.GetPersons()[0]

	for _, p := range resp.GetPersons() {
		if p.GetRole() == "foreman" {
			person = p
			break
		}
	}
	fmt.Println(person)
	brigade := pb.Brigade{ForemanId: person.Id, Name: "Бригада 1"}
	res, err := client.CreateBrigade(ctx, &brigade)
	if err != nil {
		log.Fatalf("Ошибка при вызове CreateBrigade: %v", err)
	} else {
		log.Printf("Ответ сервера 2: %s", res)
	}
}

func TestGetAllBrigades(t *testing.T) {
	conn, err := grpc.NewClient("127.0.0.1:12345", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	defer conn.Close()
	client := pb.NewPersonServiceClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	defer cancel()
	resp, err := client.GetAllBrigades(ctx, &emptypb.Empty{})
	if err != nil {
		log.Fatalf("Ошибка при вызове GetAllBrigades: %v", err)
	} else {
		log.Printf("Ответ сервера: %s", resp)
	}
}
