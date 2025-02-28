package transport

type TypeOfTransport string

const (
	TruckType      TypeOfTransport = "truck"
	TaxiType       TypeOfTransport = "taxi"
	BusType        TypeOfTransport = "bus"
	TramType       TypeOfTransport = "tram"
	TrolleybusType TypeOfTransport = "trolleybus"
)

type Transport struct {
	ID               int             `db:"id"`
	Type             TypeOfTransport `db:"type"`
	GarageFacilityId int             `db:"garage_facility_id"`
}

type Bus struct {
	Transport
	Brand         string `db:"brand"`
	PassengersNum int    `db:"passengers_num"`
}

type Taxi struct {
	Transport
	Brand string `db:"brand"`
}

type Truck struct {
	Transport
	Brand           string  `db:"brand"`
	Capacity        float64 `db:"capacity"`
	FuelConsumption float64 `db:"fuel_consumption"`
}

type Tram struct {
	Transport
	Brand         string `db:"brand"`
	PassengersNum int    `db:"passengers_num"`
}

type Trolleybus struct {
	Transport
	Brand         string `db:"brand"`
	PassengersNum int    `db:"passengers_num"`
}
