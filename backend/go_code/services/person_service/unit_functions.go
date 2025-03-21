package person_service

import (
	pb "AutoEnterpise/go_code/generated/person"
	"AutoEnterpise/go_code/services/person_service/controllers/transport_unit"
	"context"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
)

func (t *PersonService) GetAllTransportUnits(ctx context.Context, _ *emptypb.Empty) (*pb.TransportUnitList, error) {
	cnt := transport_unit.NewTransportUnitController(t.Dbpool)
	units, err := cnt.All(ctx)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d units", len(units))
		return &pb.TransportUnitList{Units: units}, nil
	}
}

func (t *PersonService) CreateTransportUnit(ctx context.Context, unit *pb.TransportUnit) (*pb.TransportUnit, error) {
	cnt := transport_unit.NewTransportUnitController(t.Dbpool)
	err := cnt.Create(ctx, unit)
	if err != nil {
		log.Println(err)
	}
	return unit, err
}

func (t *PersonService) AlterTransportUnit(ctx context.Context, unit *pb.TransportUnit) (*pb.TransportUnit, error) {
	cnt := transport_unit.NewTransportUnitController(t.Dbpool)
	err := cnt.Alter(ctx, unit)
	if err != nil {
		log.Println(err)
	}
	return unit, err
}
