package tests

import (
	pb "AutoEnterpise/go_code/generated/person"
	"context"
	"fmt"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
	"testing"
	"time"
)

func createPerson(ctx context.Context, client pb.PersonServiceClient, person *pb.Person) *pb.Person {

	res, err := client.CreatePerson(ctx, person)
	if err != nil {
		log.Fatalf("Ошибка при вызове CreatePerson: %v", err)
	}
	return res
}

func createMaster(ctx context.Context, client pb.PersonServiceClient) *pb.Person {
	return createPerson(ctx, client, &master)
}

func createManager(ctx context.Context, client pb.PersonServiceClient) *pb.Person {
	return createPerson(ctx, client, &manager)
}

func createDriver(ctx context.Context, client pb.PersonServiceClient) *pb.Person {
	return createPerson(ctx, client, &driver)
}

func createForeman(ctx context.Context, client pb.PersonServiceClient) *pb.Person {
	return createPerson(ctx, client, &foreman)
}

func TestGetAllPersons(t *testing.T) {
	conn, err := grpc.NewClient("127.0.0.1:12345", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	defer conn.Close()
	client := pb.NewPersonServiceClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	defer cancel()
	persons, err := client.GetAllPersons(ctx, &emptypb.Empty{})
	if err != nil {
		log.Fatalf("Ошибка при вызове GetAllPersons: %v", err)
	}
	log.Printf("Ответ сервера: %s", persons)
}

func TestGetFilteredPersons(t *testing.T) {
	conn, err := grpc.NewClient("127.0.0.1:12345", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	defer conn.Close()
	client := pb.NewPersonServiceClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	defer cancel()
	persons, err := client.GetFilteredPersons(ctx, &pb.PersonFilter{Roles: []pb.Role{pb.Role_assembler}})
	if err != nil {
		log.Fatalf("Ошибка при вызове GetAllPersons: %v", err)
	}
	log.Printf("Ответ сервера: %s", persons)
}

func TestCreatePerson(t *testing.T) {
	conn, err := grpc.NewClient("127.0.0.1:12345", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	defer conn.Close()
	client := pb.NewPersonServiceClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	defer cancel()
	createForeman(ctx, client)
	createDriver(ctx, client)
	createManager(ctx, client)
	createMaster(ctx, client)
	createPerson(ctx, client, &assembler)
}

func TestAlterPerson(t *testing.T) {
	conn, err := grpc.NewClient("127.0.0.1:12345", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatalf("Не удалось подключиться: %v", err)
	}
	defer conn.Close()
	client := pb.NewPersonServiceClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*100)
	defer cancel()
	persons, err := client.GetAllPersons(ctx, &emptypb.Empty{})

	if err != nil {
		log.Fatalf("Ошибка при вызове GetAllPersons: %v", err)
	}

	if len(persons.GetPersons()) == 0 {
		log.Printf("Нет персон для изменения")
		return
	}

	person := persons.GetPersons()[0]
	fmt.Println(person)
	person.Email = "new@mail.com"
	_, err = client.AlterPerson(ctx, person)
	if err != nil {
		log.Fatalf("Ошибка при вызове AlterPerson: %v", err)
	}

}

func TestRoleChanging(t *testing.T) {
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
		log.Printf("Нет персон для изменения")
		return
	}

	person := resp.GetPersons()[0]
	for _, p := range resp.GetPersons() {
		if p.GetRole() != "foreman" {
			person = p
			break
		}
	}
	fmt.Println(person)
	person.Role = "foreman"
	person.PersonInfo = &pb.Person_ForemanInfo{ForemanInfo: &pb.ForemanInfo{}}
	_, err = client.AlterPerson(ctx, person)
	if err != nil {
		log.Fatalf("Ошибка при вызове AlterPerson: %v", err)
	}
}
