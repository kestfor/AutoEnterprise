// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.5.1
// - protoc             v5.28.2
// source: proto/trip_service.proto

package __

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	emptypb "google.golang.org/protobuf/types/known/emptypb"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.64.0 or later.
const _ = grpc.SupportPackageIsVersion9

const (
	TripsService_CreateTrip_FullMethodName       = "/main.TripsService/CreateTrip"
	TripsService_GetAllTrips_FullMethodName      = "/main.TripsService/GetAllTrips"
	TripsService_AlterTrip_FullMethodName        = "/main.TripsService/AlterTrip"
	TripsService_GetFilteredTrips_FullMethodName = "/main.TripsService/GetFilteredTrips"
)

// TripsServiceClient is the client API for TripsService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type TripsServiceClient interface {
	CreateTrip(ctx context.Context, in *Trip, opts ...grpc.CallOption) (*Trip, error)
	GetAllTrips(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*TripList, error)
	AlterTrip(ctx context.Context, in *Trip, opts ...grpc.CallOption) (*Trip, error)
	GetFilteredTrips(ctx context.Context, in *TripFilter, opts ...grpc.CallOption) (*TripList, error)
}

type tripsServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewTripsServiceClient(cc grpc.ClientConnInterface) TripsServiceClient {
	return &tripsServiceClient{cc}
}

func (c *tripsServiceClient) CreateTrip(ctx context.Context, in *Trip, opts ...grpc.CallOption) (*Trip, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(Trip)
	err := c.cc.Invoke(ctx, TripsService_CreateTrip_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *tripsServiceClient) GetAllTrips(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*TripList, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(TripList)
	err := c.cc.Invoke(ctx, TripsService_GetAllTrips_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *tripsServiceClient) AlterTrip(ctx context.Context, in *Trip, opts ...grpc.CallOption) (*Trip, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(Trip)
	err := c.cc.Invoke(ctx, TripsService_AlterTrip_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *tripsServiceClient) GetFilteredTrips(ctx context.Context, in *TripFilter, opts ...grpc.CallOption) (*TripList, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(TripList)
	err := c.cc.Invoke(ctx, TripsService_GetFilteredTrips_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// TripsServiceServer is the server API for TripsService service.
// All implementations must embed UnimplementedTripsServiceServer
// for forward compatibility.
type TripsServiceServer interface {
	CreateTrip(context.Context, *Trip) (*Trip, error)
	GetAllTrips(context.Context, *emptypb.Empty) (*TripList, error)
	AlterTrip(context.Context, *Trip) (*Trip, error)
	GetFilteredTrips(context.Context, *TripFilter) (*TripList, error)
	mustEmbedUnimplementedTripsServiceServer()
}

// UnimplementedTripsServiceServer must be embedded to have
// forward compatible implementations.
//
// NOTE: this should be embedded by value instead of pointer to avoid a nil
// pointer dereference when methods are called.
type UnimplementedTripsServiceServer struct{}

func (UnimplementedTripsServiceServer) CreateTrip(context.Context, *Trip) (*Trip, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateTrip not implemented")
}
func (UnimplementedTripsServiceServer) GetAllTrips(context.Context, *emptypb.Empty) (*TripList, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetAllTrips not implemented")
}
func (UnimplementedTripsServiceServer) AlterTrip(context.Context, *Trip) (*Trip, error) {
	return nil, status.Errorf(codes.Unimplemented, "method AlterTrip not implemented")
}
func (UnimplementedTripsServiceServer) GetFilteredTrips(context.Context, *TripFilter) (*TripList, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetFilteredTrips not implemented")
}
func (UnimplementedTripsServiceServer) mustEmbedUnimplementedTripsServiceServer() {}
func (UnimplementedTripsServiceServer) testEmbeddedByValue()                      {}

// UnsafeTripsServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to TripsServiceServer will
// result in compilation errors.
type UnsafeTripsServiceServer interface {
	mustEmbedUnimplementedTripsServiceServer()
}

func RegisterTripsServiceServer(s grpc.ServiceRegistrar, srv TripsServiceServer) {
	// If the following call pancis, it indicates UnimplementedTripsServiceServer was
	// embedded by pointer and is nil.  This will cause panics if an
	// unimplemented method is ever invoked, so we test this at initialization
	// time to prevent it from happening at runtime later due to I/O.
	if t, ok := srv.(interface{ testEmbeddedByValue() }); ok {
		t.testEmbeddedByValue()
	}
	s.RegisterService(&TripsService_ServiceDesc, srv)
}

func _TripsService_CreateTrip_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Trip)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TripsServiceServer).CreateTrip(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TripsService_CreateTrip_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TripsServiceServer).CreateTrip(ctx, req.(*Trip))
	}
	return interceptor(ctx, in, info, handler)
}

func _TripsService_GetAllTrips_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TripsServiceServer).GetAllTrips(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TripsService_GetAllTrips_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TripsServiceServer).GetAllTrips(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _TripsService_AlterTrip_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Trip)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TripsServiceServer).AlterTrip(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TripsService_AlterTrip_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TripsServiceServer).AlterTrip(ctx, req.(*Trip))
	}
	return interceptor(ctx, in, info, handler)
}

func _TripsService_GetFilteredTrips_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(TripFilter)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TripsServiceServer).GetFilteredTrips(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TripsService_GetFilteredTrips_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TripsServiceServer).GetFilteredTrips(ctx, req.(*TripFilter))
	}
	return interceptor(ctx, in, info, handler)
}

// TripsService_ServiceDesc is the grpc.ServiceDesc for TripsService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var TripsService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "main.TripsService",
	HandlerType: (*TripsServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "CreateTrip",
			Handler:    _TripsService_CreateTrip_Handler,
		},
		{
			MethodName: "GetAllTrips",
			Handler:    _TripsService_GetAllTrips_Handler,
		},
		{
			MethodName: "AlterTrip",
			Handler:    _TripsService_AlterTrip_Handler,
		},
		{
			MethodName: "GetFilteredTrips",
			Handler:    _TripsService_GetFilteredTrips_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "proto/trip_service.proto",
}
