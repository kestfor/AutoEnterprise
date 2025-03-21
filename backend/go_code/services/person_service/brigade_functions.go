package person_service

import (
	pb "AutoEnterpise/go_code/generated/person"
	br "AutoEnterpise/go_code/services/person_service/controllers/brigade"
	"context"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
)

func (t *PersonService) GetAllBrigades(ctx context.Context, _ *emptypb.Empty) (*pb.BrigadeList, error) {
	cnt := br.NewBrigadeController(t.Dbpool)
	brigades, err := cnt.All(ctx)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		return &pb.BrigadeList{Brigades: brigades}, nil
	}
}

//
//func (t *PersonService) DeleteBrigades(ctx context.Context, req *pb.DeleteRequest) (*emptypb.Empty, error) {
//	cnt := br.NewBrigadeController(t.Dbpool)
//	err := cnt.DeleteBrigades(ctx, req.Ids)
//	return &emptypb.Empty{}, err
//}

func (t *PersonService) CreateBrigade(ctx context.Context, brigade *pb.Brigade) (*pb.Brigade, error) {
	cnt := br.NewBrigadeController(t.Dbpool)
	err := cnt.Create(ctx, brigade)
	if err != nil {
		log.Println(err)
	}
	return brigade, err
}

func (t *PersonService) AlterBrigade(ctx context.Context, brigade *pb.Brigade) (*pb.Brigade, error) {
	cnt := br.NewBrigadeController(t.Dbpool)
	err := cnt.Alter(ctx, brigade)
	if err != nil {
		log.Println(err)
	}
	return brigade, err
}
