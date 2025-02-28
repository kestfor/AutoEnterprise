package main

import (
	pb "AutoEnterpise/code/generated/transport"
	. "AutoEnterpise/code/services/transport_service/controllers/transport_operation"
	"context"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
)

func (t *TransportService) GetAllOperations(ctx context.Context, _ *emptypb.Empty) (*pb.TransportOperationList, error) {
	cnt := NewTransportOperationController(t.dbpool)
	ops, err := cnt.All(ctx)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d ops", len(ops))
		return &pb.TransportOperationList{Operations: ops}, nil
	}
}

func (t *TransportService) CreateOperation(ctx context.Context, operation *pb.TransportOperation) (*pb.TransportOperation, error) {
	cnt := NewTransportOperationController(t.dbpool)
	err := cnt.Create(ctx, operation)
	if err != nil {
		log.Println(err)
	}
	return operation, err
}

func (t *TransportService) AlterOperation(ctx context.Context, operation *pb.TransportOperation) (*pb.TransportOperation, error) {
	cnt := NewTransportOperationController(t.dbpool)
	err := cnt.Alter(ctx, operation)
	if err != nil {
		log.Println(err)
	}
	return operation, err
}
