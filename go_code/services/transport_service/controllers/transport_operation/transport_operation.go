package transport_operation

import (
	pb "AutoEnterpise/go_code/generated/transport"
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
	"google.golang.org/protobuf/types/known/timestamppb"
)

type TransportOperationController struct {
	dbpool *pgxpool.Pool
}

func NewTransportOperationController(dbpool *pgxpool.Pool) *TransportOperationController {
	return &TransportOperationController{dbpool: dbpool}
}

func (bc *TransportOperationController) All(ctx context.Context) ([]*pb.TransportOperation, error) {
	rows, err := bc.dbpool.Query(ctx, "SELECT id, type, date, description, transport_id from transport_operation")

	if err != nil {
		return nil, err
	}

	transportOperations := make([]*pb.TransportOperation, 0)
	var id pgtype.Int4
	var opType pgtype.Text
	var date pgtype.Date
	var description pgtype.Text
	var transportId pgtype.Int4
	_, err = pgx.ForEachRow(rows, []any{&id, &opType, &date, &description, transportId}, func() error {

		newTO := &pb.TransportOperation{
			Id:   &id.Int32,
			Type: opType.String,
			Date: timestamppb.New(date.Time),
		}

		if transportId.Valid {
			newTO.TransportId = &transportId.Int32
		}

		if description.Valid {
			newTO.Description = &description.String
		}

		transportOperations = append(transportOperations, newTO)
		return nil
	})
	return transportOperations, err
}

func (bc *TransportOperationController) Create(ctx context.Context, transportOperation *pb.TransportOperation) error {
	err := bc.dbpool.QueryRow(ctx, "INSERT INTO transport_operation (type, date, description, transport_id) VALUES ($1, $2, $3, $4) returning id",
		transportOperation.Type, transportOperation.Date.AsTime(), transportOperation.Description, transportOperation.TransportId).Scan(&transportOperation.Id)
	return err
}

func (bc *TransportOperationController) Alter(ctx context.Context, transportOperation *pb.TransportOperation) error {
	_, err := bc.dbpool.Exec(ctx, "UPDATE transport_operation SET type = $1, date = $2, description=$3, transport_id=$4 WHERE id = $5",
		transportOperation.Type, transportOperation.Date, transportOperation.Description, transportOperation.TransportId, transportOperation.Id)
	return err
}
