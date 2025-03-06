package person_service

import (
	pb "AutoEnterpise/go_code/generated/person"
	"AutoEnterpise/go_code/services/person_service/controllers/main_persons"
	"AutoEnterpise/go_code/services/person_service/fabric"
	"context"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
)

func (t *PersonService) GetDriversByTransport(ctx context.Context, req *pb.DriversRequest) (*pb.PersonList, error) {
	cnt := main_persons.NewDriverController(t.Dbpool)
	drivers, err := cnt.GetByTransportId(ctx, req.TransportId)
	if err != nil {
		log.Println(err)
	}
	return &pb.PersonList{Persons: drivers}, err
}

func (t *PersonService) GetFilteredPersons(ctx context.Context, filter *pb.PersonFilter) (*pb.PersonList, error) {
	cnt := fabric.NewPersonControllerFabric(t.Dbpool)
	persons, err := cnt.Filtered(ctx, filter)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d persons", len(persons))
		return &pb.PersonList{Persons: persons}, nil
	}
}

func (t *PersonService) GetAllPersons(ctx context.Context, _ *emptypb.Empty) (*pb.PersonList, error) {
	cnt := fabric.NewPersonControllerFabric(t.Dbpool)
	persons, err := cnt.All(ctx)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d persons", len(persons))
		return &pb.PersonList{Persons: persons}, nil
	}
}

func (t *PersonService) CreatePerson(ctx context.Context, person *pb.Person) (*pb.Person, error) {
	cnt := fabric.NewPersonControllerFabric(t.Dbpool)
	err := cnt.Create(ctx, person)
	if err != nil {
		log.Println(err)
	}
	return person, err
}

func (t *PersonService) AlterPerson(ctx context.Context, person *pb.Person) (*pb.Person, error) {
	cnt := fabric.NewPersonControllerFabric(t.Dbpool)
	err := cnt.Alter(ctx, person)
	if err != nil {
		log.Println(err)
	}
	return person, err
}
