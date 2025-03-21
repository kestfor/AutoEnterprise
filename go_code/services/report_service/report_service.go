package report_service

import (
	pb "AutoEnterpise/go_code/generated/report"
	"context"
	"fmt"
	"github.com/jackc/pgx/v5/pgxpool"
	"google.golang.org/protobuf/types/known/emptypb"
)

type ReportService struct {
	pb.UnimplementedReportServiceServer
	Dbpool *pgxpool.Pool
}

func (rs *ReportService) GetCarMileage(ctx context.Context, in *pb.CarMileageRequest) (*pb.CarMileageResponse, error) {
	cnt := NewReportController(rs.Dbpool)
	mileage, err := cnt.GetCarMileage(ctx, in)
	form := make(map[string]float32)
	for k, v := range mileage {
		form[k] = float32(v)
	}
	return &pb.CarMileageResponse{CarMileage: form}, err
}

func (rs *ReportService) GetRepairCost(ctx context.Context, in *pb.RepairCostRequest) (*pb.RepairCostResponse, error) {
	cnt := NewReportController(rs.Dbpool)
	costs, err := cnt.GetRepairCosts(ctx, in)
	form := make([]*pb.RepairCost, 0)
	for k, v := range costs {
		form = append(form, &pb.RepairCost{Name: k, Sum: float32(v.Second), RepairNum: int32(v.First)})
	}
	return &pb.RepairCostResponse{Costs: form}, err
}

func (rs *ReportService) GetDriversDistribution(ctx context.Context, _ *emptypb.Empty) (*pb.DriversDistributionResponse, error) {
	cnt := NewReportController(rs.Dbpool)
	drivers, err := cnt.GetDriversDistribution(ctx)
	return &pb.DriversDistributionResponse{DriversDistribution: drivers}, err
}

func (rs *ReportService) GetPassengerTransportDistribution(ctx context.Context, _ *emptypb.Empty) (*pb.PassengerTransportDistributionResponse, error) {
	cnt := NewReportController(rs.Dbpool)
	transports, err := cnt.GetPassengerTransportDistribution(ctx)
	return &pb.PassengerTransportDistributionResponse{PassengerTransportDistribution: transports}, err
}

func (rs *ReportService) GetSubordination(ctx context.Context, in *pb.SubordinationRequest) (*pb.SubordinationResponse, error) {
	cnt := NewReportController(rs.Dbpool)
	subs, err := cnt.GetSubordination(ctx, in.GetFilter())
	fmt.Println(subs)
	return &pb.SubordinationResponse{Subordinations: subs}, err
}

func (rs *ReportService) GetTransportByGarageDistribution(ctx context.Context, _ *emptypb.Empty) (*pb.TransportByGarageDistributionResponse, error) {
	cnt := NewReportController(rs.Dbpool)
	mapping, err := cnt.Transport2GarageMapping(ctx)
	return &pb.TransportByGarageDistributionResponse{Mapping: mapping}, err
}
