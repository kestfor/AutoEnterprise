package main

import (
	pb "AutoEnterpise/code/generated/transport"
	. "AutoEnterpise/code/services/transport_service/controllers/garage"
	"context"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
)

func (t *TransportService) GetAllGarages(ctx context.Context, _ *emptypb.Empty) (*pb.GarageFacilityList, error) {
	cnt := NewGarageFacilityController(t.dbpool)
	garages, err := cnt.All(ctx)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d garages", len(garages))
		return &pb.GarageFacilityList{Garages: garages}, nil
	}
}

func (t *TransportService) CreateGarage(ctx context.Context, garage *pb.GarageFacility) (*pb.GarageFacility, error) {
	cnt := NewGarageFacilityController(t.dbpool)
	err := cnt.Create(ctx, garage)
	if err != nil {
		log.Println(err)
	}
	return garage, err
}

func (t *TransportService) AlterGarage(ctx context.Context, garage *pb.GarageFacility) (*pb.GarageFacility, error) {
	cnt := NewGarageFacilityController(t.dbpool)
	err := cnt.Alter(ctx, garage)
	if err != nil {
		log.Println(err)
	}
	return garage, err
}
