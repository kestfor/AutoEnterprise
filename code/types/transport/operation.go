package transport

import "github.com/jackc/pgx/v5/pgtype"

type OperationType string

const (
	PurchaseOperation OperationType = "purchase"
	SaleOperation     OperationType = "sale"
	WriteOffOperation OperationType = "write-off"
)

type Operation struct {
	ID          int              `db:"id"`
	Type        OperationType    `db:"type"`
	Date        pgtype.Timestamp `db:"date"`
	Description string           `db:"description"`
	TransportId int              `db:"transport_id"`
}
