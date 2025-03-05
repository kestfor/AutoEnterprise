package transport_unit

import (
	pb "AutoEnterpise/go_code/generated/person"
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type TransportUnitController struct {
	DBPool *pgxpool.Pool
}

func NewTransportUnitController(DBPool *pgxpool.Pool) *TransportUnitController {
	return &TransportUnitController{DBPool: DBPool}
}

func (tuc *TransportUnitController) Create(ctx context.Context, transportUnit *pb.TransportUnit) error {
	err := tuc.DBPool.QueryRow(ctx, "INSERT INTO transport_unit (name, description, type) VALUES ($1, $2, $3) returning id", transportUnit.Name, transportUnit.Description, transportUnit.Type).Scan(&transportUnit.Id)
	return err
}

func (tuc *TransportUnitController) Alter(ctx context.Context, transportUnit *pb.TransportUnit) error {
	_, err := tuc.DBPool.Exec(ctx, "UPDATE transport_unit SET name = $1, description = $2, type = $3 WHERE id = $4", transportUnit.Name, transportUnit.Description, transportUnit.Type, transportUnit.Id)
	return err
}

func (tuc *TransportUnitController) selectUnits(ctx context.Context, query string, args ...any) ([]*pb.TransportUnit, error) {
	rows, err := tuc.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	transportUnits := make([]*pb.TransportUnit, 0)

	var id pgtype.Int4
	var name pgtype.Text
	var description pgtype.Text
	var t pgtype.Text
	_, err = pgx.ForEachRow(rows, []any{&id, &name, &description, &t}, func() error {
		tmp := id.Int32
		newTU := &pb.TransportUnit{
			Id:   &tmp,
			Name: name.String,
		}

		if description.Valid {
			newTU.Description = new(string)
			*newTU.Description = description.String
		}

		if t.Valid {
			newTU.Type = new(string)
			*newTU.Type = t.String
		}

		transportUnits = append(transportUnits, newTU)
		return nil
	})

	return transportUnits, err
}

func (tuc *TransportUnitController) All(ctx context.Context) ([]*pb.TransportUnit, error) {
	return tuc.selectUnits(ctx, "SELECT id, name, description, type from transport_unit")
}
