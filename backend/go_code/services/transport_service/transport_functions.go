package transport_service

import (
	pb "AutoEnterpise/go_code/generated/transport"
	"AutoEnterpise/go_code/services/transport_service/fabric"
	"context"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
)

func (t *TransportService) GetFilteredTransport(ctx context.Context, filter *pb.TransportFilter) (*pb.TransportList, error) {
	cnt := fabric.NewTransportControllerFabric(t.Dbpool)
	transports, err := cnt.Filtered(ctx, filter)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d transports", len(transports))
		return &pb.TransportList{Transports: transports}, nil
	}
}

func (t *TransportService) GetAllTransports(ctx context.Context, _ *emptypb.Empty) (*pb.TransportList, error) {
	cnt := fabric.NewTransportControllerFabric(t.Dbpool)
	transports, err := cnt.All(ctx)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d transports", len(transports))
		return &pb.TransportList{Transports: transports}, nil
	}
}

func (t *TransportService) CreateTransport(ctx context.Context, transport *pb.Transport) (*pb.Transport, error) {
	cnt := fabric.NewTransportControllerFabric(t.Dbpool)
	err := cnt.Create(ctx, transport)
	if err != nil {
		log.Println(err)
	}
	return transport, err
}

func (t *TransportService) AlterTransport(ctx context.Context, transport *pb.Transport) (*pb.Transport, error) {
	cnt := fabric.NewTransportControllerFabric(t.Dbpool)
	err := cnt.Alter(ctx, transport)
	if err != nil {
		log.Println(err)
	}
	return transport, err
}
