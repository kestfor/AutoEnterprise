// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.5.1
// - protoc             v5.28.2
// source: proto/transport_service.proto

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
	TransportService_CreateRoute_FullMethodName              = "/main.TransportService/CreateRoute"
	TransportService_AlterRoute_FullMethodName               = "/main.TransportService/AlterRoute"
	TransportService_GetAllRoutes_FullMethodName             = "/main.TransportService/GetAllRoutes"
	TransportService_GetRouteByTransportId_FullMethodName    = "/main.TransportService/GetRouteByTransportId"
	TransportService_AddTransportToRoute_FullMethodName      = "/main.TransportService/AddTransportToRoute"
	TransportService_RemoveTransportFromRoute_FullMethodName = "/main.TransportService/RemoveTransportFromRoute"
	TransportService_GetAllOperations_FullMethodName         = "/main.TransportService/GetAllOperations"
	TransportService_CreateOperation_FullMethodName          = "/main.TransportService/CreateOperation"
	TransportService_AlterOperation_FullMethodName           = "/main.TransportService/AlterOperation"
	TransportService_GetFilteredOperations_FullMethodName    = "/main.TransportService/GetFilteredOperations"
	TransportService_GetAllGarages_FullMethodName            = "/main.TransportService/GetAllGarages"
	TransportService_AlterGarage_FullMethodName              = "/main.TransportService/AlterGarage"
	TransportService_CreateGarage_FullMethodName             = "/main.TransportService/CreateGarage"
	TransportService_GetFilteredTransport_FullMethodName     = "/main.TransportService/GetFilteredTransport"
	TransportService_CreateTransport_FullMethodName          = "/main.TransportService/CreateTransport"
	TransportService_AlterTransport_FullMethodName           = "/main.TransportService/AlterTransport"
	TransportService_GetAllTransports_FullMethodName         = "/main.TransportService/GetAllTransports"
)

// TransportServiceClient is the client API for TransportService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type TransportServiceClient interface {
	// rpc DeleteRoutes(DeleteRequest) returns (google.protobuf.Empty);
	CreateRoute(ctx context.Context, in *Route, opts ...grpc.CallOption) (*Route, error)
	AlterRoute(ctx context.Context, in *Route, opts ...grpc.CallOption) (*Route, error)
	GetAllRoutes(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*RouteList, error)
	GetRouteByTransportId(ctx context.Context, in *GetRouteByTransportIdRequest, opts ...grpc.CallOption) (*Route, error)
	AddTransportToRoute(ctx context.Context, in *ModifyRouteRequest, opts ...grpc.CallOption) (*emptypb.Empty, error)
	RemoveTransportFromRoute(ctx context.Context, in *ModifyRouteRequest, opts ...grpc.CallOption) (*emptypb.Empty, error)
	GetAllOperations(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*TransportOperationList, error)
	CreateOperation(ctx context.Context, in *TransportOperation, opts ...grpc.CallOption) (*TransportOperation, error)
	AlterOperation(ctx context.Context, in *TransportOperation, opts ...grpc.CallOption) (*TransportOperation, error)
	GetFilteredOperations(ctx context.Context, in *OperationFilter, opts ...grpc.CallOption) (*TransportOperationList, error)
	// rpc DeleteGarages(DeleteRequest) returns (google.protobuf.Empty);
	GetAllGarages(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*GarageFacilityList, error)
	AlterGarage(ctx context.Context, in *GarageFacility, opts ...grpc.CallOption) (*GarageFacility, error)
	CreateGarage(ctx context.Context, in *GarageFacility, opts ...grpc.CallOption) (*GarageFacility, error)
	GetFilteredTransport(ctx context.Context, in *TransportFilter, opts ...grpc.CallOption) (*TransportList, error)
	CreateTransport(ctx context.Context, in *Transport, opts ...grpc.CallOption) (*Transport, error)
	AlterTransport(ctx context.Context, in *Transport, opts ...grpc.CallOption) (*Transport, error)
	GetAllTransports(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*TransportList, error)
}

type transportServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewTransportServiceClient(cc grpc.ClientConnInterface) TransportServiceClient {
	return &transportServiceClient{cc}
}

func (c *transportServiceClient) CreateRoute(ctx context.Context, in *Route, opts ...grpc.CallOption) (*Route, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(Route)
	err := c.cc.Invoke(ctx, TransportService_CreateRoute_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) AlterRoute(ctx context.Context, in *Route, opts ...grpc.CallOption) (*Route, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(Route)
	err := c.cc.Invoke(ctx, TransportService_AlterRoute_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) GetAllRoutes(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*RouteList, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(RouteList)
	err := c.cc.Invoke(ctx, TransportService_GetAllRoutes_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) GetRouteByTransportId(ctx context.Context, in *GetRouteByTransportIdRequest, opts ...grpc.CallOption) (*Route, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(Route)
	err := c.cc.Invoke(ctx, TransportService_GetRouteByTransportId_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) AddTransportToRoute(ctx context.Context, in *ModifyRouteRequest, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, TransportService_AddTransportToRoute_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) RemoveTransportFromRoute(ctx context.Context, in *ModifyRouteRequest, opts ...grpc.CallOption) (*emptypb.Empty, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(emptypb.Empty)
	err := c.cc.Invoke(ctx, TransportService_RemoveTransportFromRoute_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) GetAllOperations(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*TransportOperationList, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(TransportOperationList)
	err := c.cc.Invoke(ctx, TransportService_GetAllOperations_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) CreateOperation(ctx context.Context, in *TransportOperation, opts ...grpc.CallOption) (*TransportOperation, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(TransportOperation)
	err := c.cc.Invoke(ctx, TransportService_CreateOperation_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) AlterOperation(ctx context.Context, in *TransportOperation, opts ...grpc.CallOption) (*TransportOperation, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(TransportOperation)
	err := c.cc.Invoke(ctx, TransportService_AlterOperation_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) GetFilteredOperations(ctx context.Context, in *OperationFilter, opts ...grpc.CallOption) (*TransportOperationList, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(TransportOperationList)
	err := c.cc.Invoke(ctx, TransportService_GetFilteredOperations_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) GetAllGarages(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*GarageFacilityList, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(GarageFacilityList)
	err := c.cc.Invoke(ctx, TransportService_GetAllGarages_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) AlterGarage(ctx context.Context, in *GarageFacility, opts ...grpc.CallOption) (*GarageFacility, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(GarageFacility)
	err := c.cc.Invoke(ctx, TransportService_AlterGarage_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) CreateGarage(ctx context.Context, in *GarageFacility, opts ...grpc.CallOption) (*GarageFacility, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(GarageFacility)
	err := c.cc.Invoke(ctx, TransportService_CreateGarage_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) GetFilteredTransport(ctx context.Context, in *TransportFilter, opts ...grpc.CallOption) (*TransportList, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(TransportList)
	err := c.cc.Invoke(ctx, TransportService_GetFilteredTransport_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) CreateTransport(ctx context.Context, in *Transport, opts ...grpc.CallOption) (*Transport, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(Transport)
	err := c.cc.Invoke(ctx, TransportService_CreateTransport_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) AlterTransport(ctx context.Context, in *Transport, opts ...grpc.CallOption) (*Transport, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(Transport)
	err := c.cc.Invoke(ctx, TransportService_AlterTransport_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *transportServiceClient) GetAllTransports(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*TransportList, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(TransportList)
	err := c.cc.Invoke(ctx, TransportService_GetAllTransports_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// TransportServiceServer is the server API for TransportService service.
// All implementations must embed UnimplementedTransportServiceServer
// for forward compatibility.
type TransportServiceServer interface {
	// rpc DeleteRoutes(DeleteRequest) returns (google.protobuf.Empty);
	CreateRoute(context.Context, *Route) (*Route, error)
	AlterRoute(context.Context, *Route) (*Route, error)
	GetAllRoutes(context.Context, *emptypb.Empty) (*RouteList, error)
	GetRouteByTransportId(context.Context, *GetRouteByTransportIdRequest) (*Route, error)
	AddTransportToRoute(context.Context, *ModifyRouteRequest) (*emptypb.Empty, error)
	RemoveTransportFromRoute(context.Context, *ModifyRouteRequest) (*emptypb.Empty, error)
	GetAllOperations(context.Context, *emptypb.Empty) (*TransportOperationList, error)
	CreateOperation(context.Context, *TransportOperation) (*TransportOperation, error)
	AlterOperation(context.Context, *TransportOperation) (*TransportOperation, error)
	GetFilteredOperations(context.Context, *OperationFilter) (*TransportOperationList, error)
	// rpc DeleteGarages(DeleteRequest) returns (google.protobuf.Empty);
	GetAllGarages(context.Context, *emptypb.Empty) (*GarageFacilityList, error)
	AlterGarage(context.Context, *GarageFacility) (*GarageFacility, error)
	CreateGarage(context.Context, *GarageFacility) (*GarageFacility, error)
	GetFilteredTransport(context.Context, *TransportFilter) (*TransportList, error)
	CreateTransport(context.Context, *Transport) (*Transport, error)
	AlterTransport(context.Context, *Transport) (*Transport, error)
	GetAllTransports(context.Context, *emptypb.Empty) (*TransportList, error)
	mustEmbedUnimplementedTransportServiceServer()
}

// UnimplementedTransportServiceServer must be embedded to have
// forward compatible implementations.
//
// NOTE: this should be embedded by value instead of pointer to avoid a nil
// pointer dereference when methods are called.
type UnimplementedTransportServiceServer struct{}

func (UnimplementedTransportServiceServer) CreateRoute(context.Context, *Route) (*Route, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateRoute not implemented")
}
func (UnimplementedTransportServiceServer) AlterRoute(context.Context, *Route) (*Route, error) {
	return nil, status.Errorf(codes.Unimplemented, "method AlterRoute not implemented")
}
func (UnimplementedTransportServiceServer) GetAllRoutes(context.Context, *emptypb.Empty) (*RouteList, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetAllRoutes not implemented")
}
func (UnimplementedTransportServiceServer) GetRouteByTransportId(context.Context, *GetRouteByTransportIdRequest) (*Route, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetRouteByTransportId not implemented")
}
func (UnimplementedTransportServiceServer) AddTransportToRoute(context.Context, *ModifyRouteRequest) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method AddTransportToRoute not implemented")
}
func (UnimplementedTransportServiceServer) RemoveTransportFromRoute(context.Context, *ModifyRouteRequest) (*emptypb.Empty, error) {
	return nil, status.Errorf(codes.Unimplemented, "method RemoveTransportFromRoute not implemented")
}
func (UnimplementedTransportServiceServer) GetAllOperations(context.Context, *emptypb.Empty) (*TransportOperationList, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetAllOperations not implemented")
}
func (UnimplementedTransportServiceServer) CreateOperation(context.Context, *TransportOperation) (*TransportOperation, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateOperation not implemented")
}
func (UnimplementedTransportServiceServer) AlterOperation(context.Context, *TransportOperation) (*TransportOperation, error) {
	return nil, status.Errorf(codes.Unimplemented, "method AlterOperation not implemented")
}
func (UnimplementedTransportServiceServer) GetFilteredOperations(context.Context, *OperationFilter) (*TransportOperationList, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetFilteredOperations not implemented")
}
func (UnimplementedTransportServiceServer) GetAllGarages(context.Context, *emptypb.Empty) (*GarageFacilityList, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetAllGarages not implemented")
}
func (UnimplementedTransportServiceServer) AlterGarage(context.Context, *GarageFacility) (*GarageFacility, error) {
	return nil, status.Errorf(codes.Unimplemented, "method AlterGarage not implemented")
}
func (UnimplementedTransportServiceServer) CreateGarage(context.Context, *GarageFacility) (*GarageFacility, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateGarage not implemented")
}
func (UnimplementedTransportServiceServer) GetFilteredTransport(context.Context, *TransportFilter) (*TransportList, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetFilteredTransport not implemented")
}
func (UnimplementedTransportServiceServer) CreateTransport(context.Context, *Transport) (*Transport, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateTransport not implemented")
}
func (UnimplementedTransportServiceServer) AlterTransport(context.Context, *Transport) (*Transport, error) {
	return nil, status.Errorf(codes.Unimplemented, "method AlterTransport not implemented")
}
func (UnimplementedTransportServiceServer) GetAllTransports(context.Context, *emptypb.Empty) (*TransportList, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetAllTransports not implemented")
}
func (UnimplementedTransportServiceServer) mustEmbedUnimplementedTransportServiceServer() {}
func (UnimplementedTransportServiceServer) testEmbeddedByValue()                          {}

// UnsafeTransportServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to TransportServiceServer will
// result in compilation errors.
type UnsafeTransportServiceServer interface {
	mustEmbedUnimplementedTransportServiceServer()
}

func RegisterTransportServiceServer(s grpc.ServiceRegistrar, srv TransportServiceServer) {
	// If the following call pancis, it indicates UnimplementedTransportServiceServer was
	// embedded by pointer and is nil.  This will cause panics if an
	// unimplemented method is ever invoked, so we test this at initialization
	// time to prevent it from happening at runtime later due to I/O.
	if t, ok := srv.(interface{ testEmbeddedByValue() }); ok {
		t.testEmbeddedByValue()
	}
	s.RegisterService(&TransportService_ServiceDesc, srv)
}

func _TransportService_CreateRoute_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Route)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).CreateRoute(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_CreateRoute_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).CreateRoute(ctx, req.(*Route))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_AlterRoute_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Route)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).AlterRoute(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_AlterRoute_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).AlterRoute(ctx, req.(*Route))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_GetAllRoutes_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).GetAllRoutes(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_GetAllRoutes_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).GetAllRoutes(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_GetRouteByTransportId_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetRouteByTransportIdRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).GetRouteByTransportId(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_GetRouteByTransportId_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).GetRouteByTransportId(ctx, req.(*GetRouteByTransportIdRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_AddTransportToRoute_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ModifyRouteRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).AddTransportToRoute(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_AddTransportToRoute_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).AddTransportToRoute(ctx, req.(*ModifyRouteRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_RemoveTransportFromRoute_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ModifyRouteRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).RemoveTransportFromRoute(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_RemoveTransportFromRoute_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).RemoveTransportFromRoute(ctx, req.(*ModifyRouteRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_GetAllOperations_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).GetAllOperations(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_GetAllOperations_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).GetAllOperations(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_CreateOperation_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(TransportOperation)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).CreateOperation(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_CreateOperation_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).CreateOperation(ctx, req.(*TransportOperation))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_AlterOperation_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(TransportOperation)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).AlterOperation(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_AlterOperation_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).AlterOperation(ctx, req.(*TransportOperation))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_GetFilteredOperations_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(OperationFilter)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).GetFilteredOperations(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_GetFilteredOperations_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).GetFilteredOperations(ctx, req.(*OperationFilter))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_GetAllGarages_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).GetAllGarages(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_GetAllGarages_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).GetAllGarages(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_AlterGarage_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GarageFacility)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).AlterGarage(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_AlterGarage_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).AlterGarage(ctx, req.(*GarageFacility))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_CreateGarage_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GarageFacility)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).CreateGarage(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_CreateGarage_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).CreateGarage(ctx, req.(*GarageFacility))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_GetFilteredTransport_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(TransportFilter)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).GetFilteredTransport(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_GetFilteredTransport_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).GetFilteredTransport(ctx, req.(*TransportFilter))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_CreateTransport_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Transport)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).CreateTransport(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_CreateTransport_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).CreateTransport(ctx, req.(*Transport))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_AlterTransport_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Transport)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).AlterTransport(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_AlterTransport_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).AlterTransport(ctx, req.(*Transport))
	}
	return interceptor(ctx, in, info, handler)
}

func _TransportService_GetAllTransports_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(TransportServiceServer).GetAllTransports(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: TransportService_GetAllTransports_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(TransportServiceServer).GetAllTransports(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

// TransportService_ServiceDesc is the grpc.ServiceDesc for TransportService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var TransportService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "main.TransportService",
	HandlerType: (*TransportServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "CreateRoute",
			Handler:    _TransportService_CreateRoute_Handler,
		},
		{
			MethodName: "AlterRoute",
			Handler:    _TransportService_AlterRoute_Handler,
		},
		{
			MethodName: "GetAllRoutes",
			Handler:    _TransportService_GetAllRoutes_Handler,
		},
		{
			MethodName: "GetRouteByTransportId",
			Handler:    _TransportService_GetRouteByTransportId_Handler,
		},
		{
			MethodName: "AddTransportToRoute",
			Handler:    _TransportService_AddTransportToRoute_Handler,
		},
		{
			MethodName: "RemoveTransportFromRoute",
			Handler:    _TransportService_RemoveTransportFromRoute_Handler,
		},
		{
			MethodName: "GetAllOperations",
			Handler:    _TransportService_GetAllOperations_Handler,
		},
		{
			MethodName: "CreateOperation",
			Handler:    _TransportService_CreateOperation_Handler,
		},
		{
			MethodName: "AlterOperation",
			Handler:    _TransportService_AlterOperation_Handler,
		},
		{
			MethodName: "GetFilteredOperations",
			Handler:    _TransportService_GetFilteredOperations_Handler,
		},
		{
			MethodName: "GetAllGarages",
			Handler:    _TransportService_GetAllGarages_Handler,
		},
		{
			MethodName: "AlterGarage",
			Handler:    _TransportService_AlterGarage_Handler,
		},
		{
			MethodName: "CreateGarage",
			Handler:    _TransportService_CreateGarage_Handler,
		},
		{
			MethodName: "GetFilteredTransport",
			Handler:    _TransportService_GetFilteredTransport_Handler,
		},
		{
			MethodName: "CreateTransport",
			Handler:    _TransportService_CreateTransport_Handler,
		},
		{
			MethodName: "AlterTransport",
			Handler:    _TransportService_AlterTransport_Handler,
		},
		{
			MethodName: "GetAllTransports",
			Handler:    _TransportService_GetAllTransports_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "proto/transport_service.proto",
}
