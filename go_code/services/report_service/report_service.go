package report_service

import (
	pb "AutoEnterpise/go_code/generated/report"
	"context"
	"github.com/jackc/pgx/v5/pgxpool"
)

type ReportService struct {
	pb.UnimplementedReportServiceServer
	Dbpool *pgxpool.Pool
}

func (rs *ReportService) GetCarMileage(ctx context.Context, in *pb.CarMileageRequest) (*pb.CarMileageResponse, error) {
	cnt := NewReportController(rs.Dbpool)
	mileage, err := cnt.GetCarMileage(ctx, in)
	return &pb.CarMileageResponse{Mileage: float32(mileage)}, err
}

func (rs *ReportService) GetRepairCost(ctx context.Context, in *pb.RepairCostRequest) (*pb.RepairCostResponse, error) {
	cnt := NewReportController(rs.Dbpool)
	n, cost, err := cnt.GetRepairCosts(ctx, in)
	return &pb.RepairCostResponse{NumOfRepairs: int32(n), Cost: float32(cost)}, err
}
