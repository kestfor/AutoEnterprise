package transport_service

import (
	pb "AutoEnterpise/go_code/generated/transport"
	r "AutoEnterpise/go_code/services/transport_service/controllers/routes"
	"context"
	"google.golang.org/protobuf/types/known/emptypb"
	"log"
)

func (t *TransportService) GetAllRoutes(ctx context.Context, _ *emptypb.Empty) (*pb.RouteList, error) {
	cnt := r.NewRoutesController(t.Dbpool)
	routes, err := cnt.GetAllRoutes(ctx)
	if err != nil {
		log.Println(err)
		return nil, err
	} else {
		log.Printf("got %d routes", len(routes))
		return &pb.RouteList{Routes: routes}, nil
	}
}

func (t *TransportService) CreateRoute(ctx context.Context, route *pb.Route) (*pb.Route, error) {
	cnt := r.NewRoutesController(t.Dbpool)
	route, err := cnt.Create(ctx, route)
	if err != nil {
		log.Println(err)
	}
	return route, err
}

func (t *TransportService) AlterRoute(ctx context.Context, route *pb.Route) (*pb.Route, error) {
	cnt := r.NewRoutesController(t.Dbpool)
	route, err := cnt.Alter(ctx, route)
	if err != nil {
		log.Println(err)
	}
	return route, err
}

func (t *TransportService) AddTransportToRoute(ctx context.Context, mr *pb.ModifyRouteRequest) (*emptypb.Empty, error) {
	cnt := r.NewRoutesController(t.Dbpool)
	err := cnt.AddTransportToRoute(ctx, mr)
	if err != nil {
		log.Println(err)
	}
	return &emptypb.Empty{}, err
}

func (t *TransportService) RemoveTransportFromRoute(ctx context.Context, mr *pb.ModifyRouteRequest) (*emptypb.Empty, error) {
	cnt := r.NewRoutesController(t.Dbpool)
	err := cnt.RemoveTransportFromRoute(ctx, mr)
	if err != nil {
		log.Println(err)
	}
	return &emptypb.Empty{}, err
}

func (t *TransportService) GetRouteByTransportId(ctx context.Context, request *pb.GetRouteByTransportIdRequest) (*pb.Route, error) {
	cnt := r.NewRoutesController(t.Dbpool)
	route, err := cnt.GetRouteByTransportId(ctx, request.TransportId)
	if err != nil {
		log.Println(err)
		return nil, err
	}
	return route, err
}
