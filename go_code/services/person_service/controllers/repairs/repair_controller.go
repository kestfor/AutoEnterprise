package repairs

import (
	pb "AutoEnterpise/go_code/generated/person"
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
	"google.golang.org/protobuf/types/known/timestamppb"
)

type RepairWorkController struct {
	dbpool *pgxpool.Pool
}

func NewRepairWorkController(dbpool *pgxpool.Pool) *RepairWorkController {
	return &RepairWorkController{dbpool: dbpool}
}

func (rc *RepairWorkController) selectWorks(ctx context.Context, query string, args ...any) ([]*pb.RepairWork, error) {
	rows, err := rc.dbpool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	repairs := make([]*pb.RepairWork, 0)
	var id pgtype.Int4
	var startTime pgtype.Timestamptz
	var endTime pgtype.Timestamptz
	var transportId pgtype.Int4
	var servicePersonnelId pgtype.Int4
	var unitId pgtype.Int4
	var description pgtype.Text
	var repairCost pgtype.Float4
	var state pgtype.Text
	_, err = pgx.ForEachRow(rows, []any{&id, &startTime, &endTime, transportId, servicePersonnelId, unitId, description, repairCost, state}, func() error {

		newRep := &pb.RepairWork{
			Id:                 &id.Int32,
			StartTime:          timestamppb.New(startTime.Time),
			State:              state.String,
			TransportId:        transportId.Int32,
			ServicePersonnelId: servicePersonnelId.Int32,
		}

		if endTime.Valid {
			newRep.EndTime = timestamppb.New(endTime.Time)
		}

		if unitId.Valid {
			newRep.UnitId = &unitId.Int32
		}

		if description.Valid {
			newRep.Description = &description.String
		}

		if repairCost.Valid {
			newRep.RepairCost = &repairCost.Float32
		}

		repairs = append(repairs, newRep)
		return nil
	})
	return repairs, err
}

func (rc *RepairWorkController) selectQuery() string {
	return "select id, start_time, end_time, transport_id, service_personnel_id, unit_id, description, repair_cost, state from repair_work"
}

func (bc *RepairWorkController) All(ctx context.Context) ([]*pb.RepairWork, error) {
	return bc.selectWorks(ctx, bc.selectQuery())
}

func (rc *RepairWorkController) Filtered(ctx context.Context, filter *pb.RepairWorkFilter) ([]*pb.RepairWork, error) {
	namedArgs := pgx.NamedArgs{}
	query := rc.selectQuery()
	whereClauses := []string{}

	if filter.TransportId != nil {
		whereClauses = append(whereClauses, fmt.Sprintf("transport_id = @transport_id"))
		namedArgs["transport_id"] = filter.GetTransportId()
	}

	if filter.UnitId != nil {
		whereClauses = append(whereClauses, fmt.Sprintf("unit_id = @unit_id"))
		namedArgs["unit_id"] = filter.GetUnitId()
	}

	if filter.DateRange != nil {
		whereClauses = append(whereClauses, fmt.Sprintf("start_time between @start_time and @end_time and end_time between @start_time and @end_time"))
		namedArgs["start_time"] = filter.DateRange.DateFrom.AsTime()
		namedArgs["end_time"] = filter.DateRange.DateTo.AsTime()
	}

	if filter.ServicePersonnelId != nil {
		whereClauses = append(whereClauses, "service_personnel_id = @service_personnel_id")
		namedArgs["service_personnel_id"] = filter.GetServicePersonnelId()
	}

	if len(filter.States) > 0 {
		states := make([]string, len(filter.States))
		for i, s := range filter.States {
			states[i] = s.String()
		}
		whereClauses = append(whereClauses, "state = ANY(@states)")
		namedArgs["states"] = states
	}

	return rc.selectWorks(ctx, query, namedArgs)

}

func (bc *RepairWorkController) Create(ctx context.Context, repairWork *pb.RepairWork) error {
	var fst pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	var fet pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	if repairWork.StartTime != nil {
		fst.Valid = true
		fst.Time = repairWork.EndTime.AsTime()
	}

	if repairWork.EndTime != nil {
		fet.Valid = true
		fet.Time = repairWork.EndTime.AsTime()
	}

	err := bc.dbpool.QueryRow(ctx, "INSERT INTO repair_work (start_time, end_time, transport_id, service_personnel_id, unit_id, description, repair_cost, state) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) returning id",
		fst, fet, repairWork.TransportId, repairWork.ServicePersonnelId, repairWork.UnitId, repairWork.Description, repairWork.RepairCost, repairWork.State).Scan(&repairWork.Id)
	return err
}

func (bc *RepairWorkController) Alter(ctx context.Context, repairWork *pb.RepairWork) error {
	var fst pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	var fet pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	if repairWork.StartTime != nil {
		fst.Valid = true
		fst.Time = repairWork.EndTime.AsTime()
	}

	if repairWork.EndTime != nil {
		fet.Valid = true
		fet.Time = repairWork.EndTime.AsTime()
	}
	_, err := bc.dbpool.Exec(ctx, "update repair_work SET start_time=$2, end_time=$3, transport_id=$4, service_personnel_id=$5, unit_id=$6, description=$7, repair_cost=$8, state=$9 WHERE id = $1",
		repairWork.Id, fst, fet, repairWork.TransportId, repairWork.ServicePersonnelId, repairWork.UnitId, repairWork.Description, repairWork.RepairCost, repairWork.State)
	return err
}
