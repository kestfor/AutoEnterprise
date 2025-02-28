package main

import (
	pb "AutoEnterpise/code/generated/person"
	br "AutoEnterpise/code/services/person_service/controllers/brigade"
	"context"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
)

func (t *PersonService) GetAllBrigades(ctx context.Context, _ *emptypb.Empty) (*pb.BrigadeList, error) {
	cnt := br.NewBrigadeController(t.dbpool)
	brigades, err := cnt.All(ctx)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		return &pb.BrigadeList{Brigades: brigades}, nil
	}
}

func (t *PersonService) CreateBrigade(ctx context.Context, brigade *pb.Brigade) (*pb.Brigade, error) {
	cnt := br.NewBrigadeController(t.dbpool)
	err := cnt.Create(ctx, brigade)
	if err != nil {
		log.Println(err)
	}
	return brigade, err
}

func (t *PersonService) AlterBrigade(ctx context.Context, brigade *pb.Brigade) (*pb.Brigade, error) {
	cnt := br.NewBrigadeController(t.dbpool)
	err := cnt.Alter(ctx, brigade)
	if err != nil {
		log.Println(err)
	}
	return brigade, err
}
