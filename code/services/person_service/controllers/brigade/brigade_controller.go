package brigade

import (
	pb "AutoEnterpise/code/generated/person"
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type BrigadeController struct {
	dbpool *pgxpool.Pool
}

func NewBrigadeController(dbpool *pgxpool.Pool) *BrigadeController {
	return &BrigadeController{dbpool: dbpool}
}

func (bc *BrigadeController) All(ctx context.Context) ([]*pb.Brigade, error) {
	rows, err := bc.dbpool.Query(ctx, "SELECT id, name, foreman_id from brigade")

	if err != nil {
		return nil, err
	}

	brigs := make([]*pb.Brigade, 0)
	var id pgtype.Int4
	var name pgtype.Text
	var foremanId pgtype.Int4
	_, err = pgx.ForEachRow(rows, []any{&id, &name, &foremanId}, func() error {

		newBr := &pb.Brigade{
			Id:   &id.Int32,
			Name: name.String,
		}

		if foremanId.Valid {
			newBr.ForemanId = &foremanId.Int32
		}

		brigs = append(brigs, newBr)
		return nil
	})
	return brigs, err
}

func (bc *BrigadeController) Create(ctx context.Context, brigade *pb.Brigade) error {
	_, err := bc.dbpool.Exec(ctx, "INSERT INTO brigade (name, foreman_id) VALUES ($1, $2)", brigade.Name, brigade.ForemanId)
	return err
}

func (bc *BrigadeController) Alter(ctx context.Context, brigade *pb.Brigade) error {
	_, err := bc.dbpool.Exec(ctx, "UPDATE brigade SET name = $1, foreman_id = $2 WHERE id = $3", brigade.Name, brigade.ForemanId, brigade.Id)
	return err
}
