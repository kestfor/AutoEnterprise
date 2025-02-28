package route

type Route struct {
	ID          int    `db:"id"`
	Name        string `db:"name"`
	TransportId int    `db:"transport_id"`
}
