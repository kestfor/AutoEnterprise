package trips

import (
	. "AutoEnterpise/go_code/generated/trips"
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type PassengersTripFields struct {
	PassengersNum pgtype.Int4
	Distance      pgtype.Float4
}

type PassengersTripController struct {
	TripController
	Fields PassengersTripFields
}

func NewPassengersTripController(DBPool *pgxpool.Pool) Controller {
	return &PassengersTripController{TripController{DBPool: DBPool}, PassengersTripFields{}}
}

func (d *PassengersTripController) GetFields() []any {
	trip := d.TripController.GetFields()
	return append(trip, &d.Fields.PassengersNum, &d.Fields.Distance)
}

func (d *PassengersTripController) selectPassengersTrips(ctx context.Context, query string, args ...any) ([]*Trip, error) {
	rows, err := d.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	trips := make([]*Trip, 0)
	_, err = pgx.ForEachRow(rows, d.GetFields(), func() error {

		newTrip := d.ScanTrip()

		tripInfo := &TripInfoPassenger{}

		if d.Fields.Distance.Valid {
			tripInfo.Distance = d.Fields.Distance.Float32
		}

		if d.Fields.PassengersNum.Valid {
			tripInfo.PassengersNum = d.Fields.PassengersNum.Int32
		}

		newTrip.TripInfo = &Trip_Passengers{Passengers: tripInfo}
		trips = append(trips, newTrip)
		return nil
	})
	return trips, err
}

func (d *PassengersTripController) selectQuery() string {
	return "select " + d.TripController.Fields.ToStringSelect() +
		", trip_info_passenger.passengers_num, trip_info_passenger.distance from trip right join trip_info_passenger on trip.id = trip_info_passenger.trip_id"
}

func (d *PassengersTripController) All(ctx context.Context) ([]*Trip, error) {
	return d.selectPassengersTrips(ctx, d.selectQuery())
}

func (d *PassengersTripController) Filtered(ctx context.Context, filter *TripFilter) ([]*Trip, error) {
	return d.selectPassengersTrips(ctx, d.selectQuery())
}

func (d *PassengersTripController) CreateInfo(tx pgx.Tx, ctx context.Context, trip *Trip) error {
	tripInfo := trip.GetPassengers()
	if tripInfo == nil {
		return errors.New("passengers info is required")
	}
	_, err := tx.Exec(ctx,
		"INSERT INTO trip_info_passenger (trip_id, passengers_num, distance, type)  VALUES ($1, $2, $3, $4)",
		trip.Id, tripInfo.PassengersNum, tripInfo.Distance, trip.Type)
	return err
}

func (d *PassengersTripController) AlterInfo(tx pgx.Tx, ctx context.Context, trip *Trip) error {
	tripInfo := trip.GetPassengers()
	if tripInfo == nil {
		return errors.New("cargo info is required")
	}
	_, err := tx.Exec(ctx,
		"UPDATE trip_info_passenger SET passengers_num=$1, distance=$2 WHERE trip_id=$3",
		tripInfo.PassengersNum, tripInfo.Distance, trip.Id)
	return err
}

func (d *PassengersTripController) Create(ctx context.Context, trip *Trip) error {
	return d.CreateWrapper(d, ctx, trip)
}

func (d *PassengersTripController) Alter(ctx context.Context, trip *Trip) error {
	return d.AlterWrapper(d, ctx, trip)
}
