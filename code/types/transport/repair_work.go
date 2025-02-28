package transport

import "github.com/jackc/pgx/v5/pgtype"

type RepairWorkState string

const (
	InProgress RepairWorkState = "in progress"
	Finished   RepairWorkState = "finished"
	NotStarted RepairWorkState = "not started"
)

type RepairWork struct {
	ID                 int              `db:"id"`
	StartTime          pgtype.Timestamp `db:"start_time"`
	EndTime            pgtype.Timestamp `db:"end_time"`
	TransportId        int              `db:"transport_id"`
	ServicePersonnelId int              `db:"service_personnel_id"`
	State              RepairWorkState  `db:"state"`
	UnitId             int              `db:"unit_id"`
	Description        string           `db:"description"`
	RepairCost         float64          `db:"repair_cost"`
}
