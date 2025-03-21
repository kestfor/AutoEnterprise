package transport_service

import (
	pb "AutoEnterpise/go_code/generated/transport"
	. "AutoEnterpise/go_code/services/transport_service/controllers/transport_operation"
	"context"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
)

func (t *TransportService) GetAllOperations(ctx context.Context, _ *emptypb.Empty) (*pb.TransportOperationList, error) {
	cnt := NewTransportOperationController(t.Dbpool)
	ops, err := cnt.All(ctx)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d ops", len(ops))
		return &pb.TransportOperationList{Operations: ops}, nil
	}
}

func (t *TransportService) GetFilteredOperations(ctx context.Context, filter *pb.OperationFilter) (*pb.TransportOperationList, error) {
	cnt := NewTransportOperationController(t.Dbpool)
	ops, err := cnt.Filtered(ctx, filter)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d ops", len(ops))
		return &pb.TransportOperationList{Operations: ops}, nil
	}
}

func (t *TransportService) CreateOperation(ctx context.Context, operation *pb.TransportOperation) (*pb.TransportOperation, error) {
	cnt := NewTransportOperationController(t.Dbpool)
	err := cnt.Create(ctx, operation)
	if err != nil {
		log.Println(err)
	}
	return operation, err
}

func (t *TransportService) AlterOperation(ctx context.Context, operation *pb.TransportOperation) (*pb.TransportOperation, error) {
	cnt := NewTransportOperationController(t.Dbpool)
	err := cnt.Alter(ctx, operation)
	if err != nil {
		log.Println(err)
	}
	return operation, err
}
