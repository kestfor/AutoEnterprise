package person_service

import (
	pb "AutoEnterpise/go_code/generated/person"
	. "AutoEnterpise/go_code/services/person_service/controllers/repairs"
	"context"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
)

func (t *PersonService) GetAllRepairWorks(ctx context.Context, _ *emptypb.Empty) (*pb.RepairWorkList, error) {
	cnt := NewRepairWorkController(t.Dbpool)
	rep, err := cnt.All(ctx)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d rep", len(rep))
		return &pb.RepairWorkList{RepairWorks: rep}, nil
	}
}

func (t *PersonService) CreateRepairWork(ctx context.Context, repair *pb.RepairWork) (*pb.RepairWork, error) {
	cnt := NewRepairWorkController(t.Dbpool)
	err := cnt.Create(ctx, repair)
	if err != nil {
		log.Println(err)
	}
	return repair, err
}

func (t *PersonService) AlterRepairWork(ctx context.Context, repair *pb.RepairWork) (*pb.RepairWork, error) {
	cnt := NewRepairWorkController(t.Dbpool)
	err := cnt.Alter(ctx, repair)
	if err != nil {
		log.Println(err)
	}
	return repair, err
}
