// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.5.1
// - protoc             v5.28.2
// source: proto/report_service.proto

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
	ReportService_GetTransportByGarageDistribution_FullMethodName  = "/main.ReportService/GetTransportByGarageDistribution"
	ReportService_GetSubordination_FullMethodName                  = "/main.ReportService/GetSubordination"
	ReportService_GetCarMileage_FullMethodName                     = "/main.ReportService/GetCarMileage"
	ReportService_GetRepairCost_FullMethodName                     = "/main.ReportService/GetRepairCost"
	ReportService_GetDriversDistribution_FullMethodName            = "/main.ReportService/GetDriversDistribution"
	ReportService_GetPassengerTransportDistribution_FullMethodName = "/main.ReportService/GetPassengerTransportDistribution"
)

// ReportServiceClient is the client API for ReportService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type ReportServiceClient interface {
	GetTransportByGarageDistribution(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*TransportByGarageDistributionResponse, error)
	GetSubordination(ctx context.Context, in *SubordinationRequest, opts ...grpc.CallOption) (*SubordinationResponse, error)
	GetCarMileage(ctx context.Context, in *CarMileageRequest, opts ...grpc.CallOption) (*CarMileageResponse, error)
	GetRepairCost(ctx context.Context, in *RepairCostRequest, opts ...grpc.CallOption) (*RepairCostResponse, error)
	GetDriversDistribution(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*DriversDistributionResponse, error)
	GetPassengerTransportDistribution(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*PassengerTransportDistributionResponse, error)
}

type reportServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewReportServiceClient(cc grpc.ClientConnInterface) ReportServiceClient {
	return &reportServiceClient{cc}
}

func (c *reportServiceClient) GetTransportByGarageDistribution(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*TransportByGarageDistributionResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(TransportByGarageDistributionResponse)
	err := c.cc.Invoke(ctx, ReportService_GetTransportByGarageDistribution_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *reportServiceClient) GetSubordination(ctx context.Context, in *SubordinationRequest, opts ...grpc.CallOption) (*SubordinationResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(SubordinationResponse)
	err := c.cc.Invoke(ctx, ReportService_GetSubordination_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *reportServiceClient) GetCarMileage(ctx context.Context, in *CarMileageRequest, opts ...grpc.CallOption) (*CarMileageResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(CarMileageResponse)
	err := c.cc.Invoke(ctx, ReportService_GetCarMileage_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *reportServiceClient) GetRepairCost(ctx context.Context, in *RepairCostRequest, opts ...grpc.CallOption) (*RepairCostResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(RepairCostResponse)
	err := c.cc.Invoke(ctx, ReportService_GetRepairCost_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *reportServiceClient) GetDriversDistribution(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*DriversDistributionResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(DriversDistributionResponse)
	err := c.cc.Invoke(ctx, ReportService_GetDriversDistribution_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *reportServiceClient) GetPassengerTransportDistribution(ctx context.Context, in *emptypb.Empty, opts ...grpc.CallOption) (*PassengerTransportDistributionResponse, error) {
	cOpts := append([]grpc.CallOption{grpc.StaticMethod()}, opts...)
	out := new(PassengerTransportDistributionResponse)
	err := c.cc.Invoke(ctx, ReportService_GetPassengerTransportDistribution_FullMethodName, in, out, cOpts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// ReportServiceServer is the server API for ReportService service.
// All implementations must embed UnimplementedReportServiceServer
// for forward compatibility.
type ReportServiceServer interface {
	GetTransportByGarageDistribution(context.Context, *emptypb.Empty) (*TransportByGarageDistributionResponse, error)
	GetSubordination(context.Context, *SubordinationRequest) (*SubordinationResponse, error)
	GetCarMileage(context.Context, *CarMileageRequest) (*CarMileageResponse, error)
	GetRepairCost(context.Context, *RepairCostRequest) (*RepairCostResponse, error)
	GetDriversDistribution(context.Context, *emptypb.Empty) (*DriversDistributionResponse, error)
	GetPassengerTransportDistribution(context.Context, *emptypb.Empty) (*PassengerTransportDistributionResponse, error)
	mustEmbedUnimplementedReportServiceServer()
}

// UnimplementedReportServiceServer must be embedded to have
// forward compatible implementations.
//
// NOTE: this should be embedded by value instead of pointer to avoid a nil
// pointer dereference when methods are called.
type UnimplementedReportServiceServer struct{}

func (UnimplementedReportServiceServer) GetTransportByGarageDistribution(context.Context, *emptypb.Empty) (*TransportByGarageDistributionResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetTransportByGarageDistribution not implemented")
}
func (UnimplementedReportServiceServer) GetSubordination(context.Context, *SubordinationRequest) (*SubordinationResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetSubordination not implemented")
}
func (UnimplementedReportServiceServer) GetCarMileage(context.Context, *CarMileageRequest) (*CarMileageResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetCarMileage not implemented")
}
func (UnimplementedReportServiceServer) GetRepairCost(context.Context, *RepairCostRequest) (*RepairCostResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetRepairCost not implemented")
}
func (UnimplementedReportServiceServer) GetDriversDistribution(context.Context, *emptypb.Empty) (*DriversDistributionResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetDriversDistribution not implemented")
}
func (UnimplementedReportServiceServer) GetPassengerTransportDistribution(context.Context, *emptypb.Empty) (*PassengerTransportDistributionResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetPassengerTransportDistribution not implemented")
}
func (UnimplementedReportServiceServer) mustEmbedUnimplementedReportServiceServer() {}
func (UnimplementedReportServiceServer) testEmbeddedByValue()                       {}

// UnsafeReportServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to ReportServiceServer will
// result in compilation errors.
type UnsafeReportServiceServer interface {
	mustEmbedUnimplementedReportServiceServer()
}

func RegisterReportServiceServer(s grpc.ServiceRegistrar, srv ReportServiceServer) {
	// If the following call pancis, it indicates UnimplementedReportServiceServer was
	// embedded by pointer and is nil.  This will cause panics if an
	// unimplemented method is ever invoked, so we test this at initialization
	// time to prevent it from happening at runtime later due to I/O.
	if t, ok := srv.(interface{ testEmbeddedByValue() }); ok {
		t.testEmbeddedByValue()
	}
	s.RegisterService(&ReportService_ServiceDesc, srv)
}

func _ReportService_GetTransportByGarageDistribution_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ReportServiceServer).GetTransportByGarageDistribution(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ReportService_GetTransportByGarageDistribution_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ReportServiceServer).GetTransportByGarageDistribution(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _ReportService_GetSubordination_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(SubordinationRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ReportServiceServer).GetSubordination(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ReportService_GetSubordination_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ReportServiceServer).GetSubordination(ctx, req.(*SubordinationRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ReportService_GetCarMileage_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CarMileageRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ReportServiceServer).GetCarMileage(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ReportService_GetCarMileage_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ReportServiceServer).GetCarMileage(ctx, req.(*CarMileageRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ReportService_GetRepairCost_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(RepairCostRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ReportServiceServer).GetRepairCost(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ReportService_GetRepairCost_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ReportServiceServer).GetRepairCost(ctx, req.(*RepairCostRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ReportService_GetDriversDistribution_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ReportServiceServer).GetDriversDistribution(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ReportService_GetDriversDistribution_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ReportServiceServer).GetDriversDistribution(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _ReportService_GetPassengerTransportDistribution_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(emptypb.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ReportServiceServer).GetPassengerTransportDistribution(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ReportService_GetPassengerTransportDistribution_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ReportServiceServer).GetPassengerTransportDistribution(ctx, req.(*emptypb.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

// ReportService_ServiceDesc is the grpc.ServiceDesc for ReportService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var ReportService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "main.ReportService",
	HandlerType: (*ReportServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "GetTransportByGarageDistribution",
			Handler:    _ReportService_GetTransportByGarageDistribution_Handler,
		},
		{
			MethodName: "GetSubordination",
			Handler:    _ReportService_GetSubordination_Handler,
		},
		{
			MethodName: "GetCarMileage",
			Handler:    _ReportService_GetCarMileage_Handler,
		},
		{
			MethodName: "GetRepairCost",
			Handler:    _ReportService_GetRepairCost_Handler,
		},
		{
			MethodName: "GetDriversDistribution",
			Handler:    _ReportService_GetDriversDistribution_Handler,
		},
		{
			MethodName: "GetPassengerTransportDistribution",
			Handler:    _ReportService_GetPassengerTransportDistribution_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "proto/report_service.proto",
}
