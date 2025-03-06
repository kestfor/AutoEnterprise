package report_service

import (
	pb "AutoEnterpise/go_code/generated/person"
	. "AutoEnterpise/go_code/generated/report"
	"AutoEnterpise/go_code/services/person_service/controllers/main_persons"
	"context"
	"errors"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type ReportController struct {
	DBPool *pgxpool.Pool
}

func NewReportController(DBPool *pgxpool.Pool) *ReportController {
	return &ReportController{DBPool: DBPool}
}

func (r *ReportController) GetDriversByTransport(ctx context.Context, transportId int32) ([]*pb.Person, error) {
	driverController := main_persons.NewDriverController(r.DBPool)
	return driverController.GetByTransportId(ctx, transportId)
}

func (r *ReportController) GetCarMileage(ctx context.Context, req *CarMileageRequest) (float64, error) {
	var fst pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	var fet pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	if req.DateFrom != nil {
		fst = pgtype.Timestamp{Time: req.DateFrom.AsTime(), Valid: true}
	}
	if req.DateTo != nil {
		fet = pgtype.Timestamp{Time: req.DateTo.AsTime(), Valid: true}
	}

	var query string
	var result pgtype.Float8
	if req.TransportId != nil {
		query = "select SUM(COALESCE(distance, 0)) from trip inner join transport on trip.transport_id = transport.id where transport.id = $1 and trip.start_time >= $2 and trip.end_time <= $3"
		err := r.DBPool.QueryRow(ctx, query, req.TransportId, fst, fet).Scan(&result)
		return result.Float64, err
	} else if req.Category != nil {
		query = "select SUM(COALESCE(distance, 0)) from trip inner join public.transport on trip.transport_id = transport.id where transport.type = $1 and trip.start_time >= $2 and trip.end_time <= $3"
		err := r.DBPool.QueryRow(ctx, query, req.Category, fst, fet).Scan(&result)
		return result.Float64, err
	}

	return 0, errors.New("either transportId or category must be provided")
}

func (r *ReportController) GetRepairCosts(ctx context.Context, req *RepairCostRequest) (int, float64, error) {
	var fst pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	var fet pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	if req.DateFrom != nil {
		fst = pgtype.Timestamp{Time: req.DateFrom.AsTime(), Valid: true}
	}
	if req.DateTo != nil {
		fet = pgtype.Timestamp{Time: req.DateTo.AsTime(), Valid: true}
	}

	var query string
	var n int
	var total pgtype.Float8
	if req.TransportId != nil {
		query = "select sum(repair_cost), count(repair_cost) from repair_work where transport_id = $1 and repair_work.start_time >= $2 and repair_work.end_time <= $3"
		err := r.DBPool.QueryRow(ctx, query, req.TransportId, fst, fet).Scan(&total, &n)
		return n, total.Float64, err
	} else if req.Brand != nil {
		query = "select sum(repair_cost), count(repair_cost) from repair_work inner join public.transport on transport.id = repair_work.transport_id where transport.brand = $1 and repair_work.start_time >= $2 and repair_work.end_time <= $3"
		err := r.DBPool.QueryRow(ctx, query, req.Brand, fst, fet).Scan(&total, &n)
		return n, total.Float64, err
	} else if req.Category != nil {
		query = "select sum(repair_cost), count(repair_cost) from repair_work inner join public.transport on transport.id = repair_work.transport_id where transport.type = $1 and repair_work.start_time >= $2 and repair_work.end_time <= $3"
		err := r.DBPool.QueryRow(ctx, query, req.Category, fst, fet).Scan(&total, &n)
		return n, total.Float64, err
	}

	return 0, 0, errors.New("either transportId, category or brand must be provided")
}
