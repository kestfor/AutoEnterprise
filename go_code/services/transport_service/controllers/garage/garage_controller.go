package garage

import (
	pb "AutoEnterpise/go_code/generated/transport"
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type GarageFacilityController struct {
	dbpool *pgxpool.Pool
}

func NewGarageFacilityController(dbpool *pgxpool.Pool) *GarageFacilityController {
	return &GarageFacilityController{dbpool: dbpool}
}

func (bc *GarageFacilityController) All(ctx context.Context) ([]*pb.GarageFacility, error) {
	rows, err := bc.dbpool.Query(ctx, "SELECT id, name, type, address from garage_facility")

	if err != nil {
		return nil, err
	}

	garages := make([]*pb.GarageFacility, 0)
	var id pgtype.Int4
	var name pgtype.Text
	var facilityType pgtype.Text
	var address pgtype.Text
	_, err = pgx.ForEachRow(rows, []any{&id, &name, &facilityType, &address}, func() error {

		var tmp int32 = id.Int32
		newGar := &pb.GarageFacility{
			Id:      &tmp,
			Name:    name.String,
			Type:    facilityType.String,
			Address: address.String,
		}

		garages = append(garages, newGar)
		return nil
	})
	return garages, err
}

func (bc *GarageFacilityController) Create(ctx context.Context, garage *pb.GarageFacility) error {
	err := bc.dbpool.QueryRow(ctx, "INSERT INTO garage_facility (name, type, address) VALUES ($1, $2, $3) returning id",
		garage.Name, garage.Type, garage.Address).Scan(&garage.Id)
	return err
}

func (bc *GarageFacilityController) Alter(ctx context.Context, garage *pb.GarageFacility) error {
	_, err := bc.dbpool.Exec(ctx, "UPDATE garage_facility SET name = $1, type = $2, address=$3 WHERE id = $4",
		garage.Name, garage.Type, garage.Address, garage.Id)
	return err
}
