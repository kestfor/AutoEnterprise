package route

import (
	"github.com/jackc/pgx/v5/pgtype"
)

type TypeOfTrip string

const (
	CargoType     TypeOfTrip = "Cargo"
	PassengerType TypeOfTrip = "Passenger"
)

type Trip struct {
	ID          int              `db:"id"`
	RouteId     int              `db:"route_id"`
	TransportId int              `db:"transport_id"`
	DriverId    int              `db:"driver_id"`
	StartTime   pgtype.Timestamp `db:"start_time"`
	EndTime     pgtype.Timestamp `db:"end_time"`
	Type        TypeOfTrip       `db:"type"`
}

type CargoTrip struct {
	Trip
	CargoName   string  `db:"cargo_name"`
	CargoType   string  `db:"cargo_type"`
	CargoWeight float64 `db:"weight"`
	CargoCost   float64 `db:"cost"`
	Distance    float64 `db:"distance"`
}

type PassengerTrip struct {
	Trip
	PassengersNum int     `db:"passengers_num"`
	Distance      float64 `db:"distance"`
}
