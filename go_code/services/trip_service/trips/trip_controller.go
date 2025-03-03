package trips

import (
	. "AutoEnterpise/go_code/generated/trips"
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
	"google.golang.org/protobuf/types/known/timestamppb"
)

type TripController struct {
	DBPool *pgxpool.Pool
	Fields TripFields
}

type TripFields struct {
	Id          pgtype.Int4
	RouteId     pgtype.Int4
	DriverId    pgtype.Int4
	TransportId pgtype.Int4
	StartTime   pgtype.Timestamp
	EndTime     pgtype.Timestamp
	Type        pgtype.Text
}

type Controller interface {
	Create(ctx context.Context, trip *Trip) error
	Alter(ctx context.Context, trip *Trip) error
	All(ctx context.Context) ([]*Trip, error)
	Filtered(ctx context.Context, filter *TripFilter) ([]*Trip, error)
}

type SuperType interface {
	CreateBasic(tx pgx.Tx, ctx context.Context, trip *Trip) error
	CreateInfo(tx pgx.Tx, ctx context.Context, trip *Trip) error
	AlterInfo(tx pgx.Tx, ctx context.Context, trip *Trip) error
	AlterBasic(tx pgx.Tx, ctx context.Context, trip *Trip) error
	CreateWrapper(superType SuperType, ctx context.Context, trip *Trip) error
	AlterWrapper(superType SuperType, ctx context.Context, trip *Trip) error
}

func (pc *TripController) GetFields() []any {
	return []any{&pc.Fields.Id, &pc.Fields.RouteId, &pc.Fields.DriverId, &pc.Fields.TransportId, &pc.Fields.StartTime, &pc.Fields.EndTime, &pc.Fields.Type}
}

func (pc *TripController) ScanTrip() *Trip {
	var id int32 = pc.Fields.Id.Int32
	var startTime *timestamppb.Timestamp = nil
	var endTime *timestamppb.Timestamp = nil
	if pc.Fields.StartTime.Valid {
		startTime = timestamppb.New(pc.Fields.StartTime.Time)
	}
	if pc.Fields.EndTime.Valid {
		endTime = timestamppb.New(pc.Fields.EndTime.Time)
	}

	trip := Trip{
		Id:        &id,
		StartTime: startTime,
		EndTime:   endTime,
		Type:      pc.Fields.Type.String}

	if pc.Fields.RouteId.Valid {
		trip.RouteId = &pc.Fields.RouteId.Int32
	}

	if pc.Fields.DriverId.Valid {
		trip.DriverId = &pc.Fields.DriverId.Int32
	}

	if pc.Fields.TransportId.Valid {
		trip.TransportId = &pc.Fields.TransportId.Int32
	}

	return &trip
}

func NewTripController(DBPool *pgxpool.Pool) Controller {
	return &TripController{DBPool: DBPool}
}

func (pc *TripController) CreateBasic(tx pgx.Tx, ctx context.Context, trip *Trip) error {
	var fst pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	var fet pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	if trip.StartTime != nil {
		fst = pgtype.Timestamp{Time: trip.StartTime.AsTime(), Valid: true}
	}
	if trip.EndTime != nil {
		fet = pgtype.Timestamp{Time: trip.EndTime.AsTime(), Valid: true}
	}

	err := tx.QueryRow(ctx, "INSERT INTO trip (route_id, driver_id, transport_id, start_time, end_time, type) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id",
		trip.RouteId, trip.DriverId, trip.TransportId, fst, fet, trip.Type).Scan(&trip.Id)
	return err
}

func (pc *TripController) CreateInfo(tx pgx.Tx, ctx context.Context, trip *Trip) error {
	return nil
}

func (pc *TripController) CreateWrapper(superController SuperType, ctx context.Context, trip *Trip) error {
	tx, err := pc.DBPool.Begin(ctx)

	if err != nil {
		return err
	}

	defer func() {
		if err != nil {
			tx.Rollback(ctx)
		} else {
			tx.Commit(ctx)
		}
	}()
	err = superController.CreateBasic(tx, ctx, trip)
	if err != nil {
		return err
	}
	err = superController.CreateInfo(tx, ctx, trip)
	return err
}

func (pc *TripController) Create(ctx context.Context, trip *Trip) error {
	return errors.New("not implemented")
}

func (pc *TripController) Alter(ctx context.Context, trip *Trip) error {
	return errors.New("not implemented")
}

func (pc *TripController) AlterWrapper(superController SuperType, ctx context.Context, trip *Trip) error {
	tx, err := pc.DBPool.Begin(ctx)
	if err != nil {
		return err
	}

	defer func() {
		if err != nil {
			tx.Rollback(ctx)
		} else {
			tx.Commit(ctx)
		}
	}()

	err = superController.AlterBasic(tx, ctx, trip)

	if err != nil {
		return err
	}

	return superController.AlterInfo(tx, ctx, trip)
}

func (pc *TripController) AlterInfo(tx pgx.Tx, ctx context.Context, trip *Trip) error {
	return nil
}

func (pc *TripController) AlterBasic(tx pgx.Tx, ctx context.Context, trip *Trip) error {
	_, err := tx.Exec(ctx, "update trip set route_id=$2, driver_id=$3, transport_id=$4, start_time=$5, end_time=$6, type=$7 where id=$1",
		trip.GetId(), trip.RouteId, trip.DriverId, trip.TransportId, trip.StartTime, trip.EndTime, trip.Type)
	if err != nil {
		return err
	}
	return err
}

func (t *TripController) All(ctx context.Context) ([]*Trip, error) {
	return nil, errors.New("not implemented")
}

func (t *TripController) Filtered(ctx context.Context, filter *TripFilter) ([]*Trip, error) {
	return nil, errors.New("not implemented")
}

func (tf *TripFields) ToStringSelect() string {
	return "trip.id, trip.route_id, trip.driver_id, trip.transport_id, trip.start_time, trip.end_time, trip.type"
}
