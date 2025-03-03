package trips

import (
	. "AutoEnterpise/go_code/generated/trips"
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type CargoTripFields struct {
	CargoName   pgtype.Text
	CargoType   pgtype.Text
	CargoCost   pgtype.Float4
	CargoWeight pgtype.Float4
	Distance    pgtype.Float4
}

type CargoTripController struct {
	TripController
	Fields CargoTripFields
}

func NewCargoTripController(DBPool *pgxpool.Pool) Controller {
	return &CargoTripController{TripController{DBPool: DBPool}, CargoTripFields{}}
}

func (d *CargoTripController) GetFields() []any {
	trip := d.TripController.GetFields()
	return append(trip, &d.Fields.CargoName, &d.Fields.CargoType, &d.Fields.CargoCost, &d.Fields.CargoWeight, &d.Fields.Distance)
}

func (d *CargoTripController) selectCargoTrips(ctx context.Context, query string, args ...any) ([]*Trip, error) {
	rows, err := d.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	trips := make([]*Trip, 0)
	_, err = pgx.ForEachRow(rows, d.GetFields(), func() error {

		newTrip := d.ScanTrip()

		tripInfo := &TripInfoCargo{}

		if d.Fields.CargoName.Valid {
			tripInfo.CargoName = d.Fields.CargoName.String
		}

		if d.Fields.CargoType.Valid {
			tripInfo.CargoType = d.Fields.CargoType.String
		}

		if d.Fields.CargoCost.Valid {
			tripInfo.CargoCost = d.Fields.CargoCost.Float32
		}

		if d.Fields.CargoWeight.Valid {
			tripInfo.CargoWeight = d.Fields.CargoWeight.Float32
		}

		if d.Fields.Distance.Valid {
			tripInfo.Distance = d.Fields.Distance.Float32
		}

		newTrip.TripInfo = &Trip_Cargo{Cargo: tripInfo}
		trips = append(trips, newTrip)
		return nil
	})
	return trips, err
}

func (d *CargoTripController) selectQuery() string {
	return "select " + d.TripController.Fields.ToStringSelect() +
		", trip_info_cargo.cargo_name, trip_info_cargo.cargo_type, trip_info_cargo.cargo_cost, trip_info_cargo.cargo_weight, trip_info_cargo.distance from trip right join trip_info_cargo on trip.id = trip_info_cargo.trip_id"
}

func (d *CargoTripController) All(ctx context.Context) ([]*Trip, error) {
	return d.selectCargoTrips(ctx, d.selectQuery())
}

func (d *CargoTripController) Filtered(ctx context.Context, filter *TripFilter) ([]*Trip, error) {
	return d.selectCargoTrips(ctx, d.selectQuery())
}

func (d *CargoTripController) CreateInfo(tx pgx.Tx, ctx context.Context, trip *Trip) error {
	tripInfo := trip.GetCargo()
	if tripInfo == nil {
		return errors.New("cargo info is required")
	}
	_, err := tx.Exec(ctx,
		"INSERT INTO trip_info_cargo (trip_id, cargo_name, cargo_cost, cargo_type, cargo_weight, distance, type)  VALUES ($1, $2, $3, $4, $5, $6, $7)",
		trip.Id, tripInfo.CargoName, tripInfo.CargoCost, tripInfo.CargoType, tripInfo.CargoWeight, tripInfo.Distance, trip.Type)
	return err
}

func (d *CargoTripController) AlterInfo(tx pgx.Tx, ctx context.Context, trip *Trip) error {
	tripInfo := trip.GetCargo()
	if tripInfo == nil {
		return errors.New("cargo info is required")
	}
	_, err := tx.Exec(ctx,
		"UPDATE trip_info_cargo SET cargo_name=$1, cargo_cost=$2, cargo_type=$3, cargo_weight=$4, distance=$5, type=$6 WHERE trip_id=$7",
		tripInfo.CargoName, tripInfo.CargoCost, tripInfo.CargoType, tripInfo.CargoWeight, tripInfo.Distance, trip.Type, trip.Id)
	return err
}

func (d *CargoTripController) Create(ctx context.Context, trip *Trip) error {
	return d.CreateWrapper(d, ctx, trip)
}

func (d *CargoTripController) Alter(ctx context.Context, trip *Trip) error {
	return d.AlterWrapper(d, ctx, trip)
}
