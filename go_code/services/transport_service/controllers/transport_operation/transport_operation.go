package transport_operation

import (
	pb "AutoEnterpise/go_code/generated/transport"
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
	"google.golang.org/protobuf/types/known/timestamppb"
	"strings"
)

type TransportOperationController struct {
	dbpool *pgxpool.Pool
}

func NewTransportOperationController(dbpool *pgxpool.Pool) *TransportOperationController {
	return &TransportOperationController{dbpool: dbpool}
}

func (bc *TransportOperationController) selectOperations(ctx context.Context, query string, args ...any) ([]*pb.TransportOperation, error) {

	rows, err := bc.dbpool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	transportOperations := make([]*pb.TransportOperation, 0)
	var id pgtype.Int4
	var opType pgtype.Text
	var date pgtype.Date
	var description pgtype.Text
	var transportId pgtype.Int4
	_, err = pgx.ForEachRow(rows, []any{&id, &opType, &date, &description, &transportId}, func() error {

		var tmp = new(int32)
		*tmp = id.Int32
		newTO := &pb.TransportOperation{
			Id:   tmp,
			Type: opType.String,
			Date: timestamppb.New(date.Time),
		}

		if transportId.Valid {
			tmp := transportId.Int32
			newTO.TransportId = &tmp
		}

		if description.Valid {
			tmp := description.String
			newTO.Description = &tmp
		}

		transportOperations = append(transportOperations, newTO)
		return nil
	})

	return transportOperations, err
}

func (bc *TransportOperationController) selectQuery() string {
	return "SELECT id, type, date, description, transport_id from transport_operation"
}

func (bc *TransportOperationController) All(ctx context.Context) ([]*pb.TransportOperation, error) {
	return bc.selectOperations(ctx, bc.selectQuery())
}

func (bc *TransportOperationController) Filtered(ctx context.Context, filter *pb.OperationFilter) ([]*pb.TransportOperation, error) {
	args := pgx.NamedArgs{}
	whereClauses := make([]string, 0)

	if filter.DateFrom != nil {
		args["date_from"] = filter.DateFrom.AsTime()
		whereClauses = append(whereClauses, "transport_operation.date >= @date_from")
	}

	if len(filter.Ids) > 0 {
		args["ids"] = filter.Ids
		whereClauses = append(whereClauses, "transport_operation.id = ANY(@ids)")
	}

	if filter.DateTo != nil {
		args["date_to"] = filter.DateTo.AsTime()
		whereClauses = append(whereClauses, "transport_operation.date <= @date_to")
	}

	query := bc.selectQuery()

	if len(whereClauses) > 0 {
		query += " WHERE " + strings.Join(whereClauses, " AND ")
	}
	return bc.selectOperations(ctx, query, args)
}

func (bc *TransportOperationController) Create(ctx context.Context, transportOperation *pb.TransportOperation) error {
	tx, err := bc.dbpool.Begin(ctx)
	if err != nil {
		return err
	}

	defer func() {
		if err != nil {
			tx.Rollback(ctx)
		} else {
			tx.Commit(ctx)
		}
	}()

	err = tx.QueryRow(ctx, "INSERT INTO transport_operation (type, date, description, transport_id) VALUES ($1, $2, $3, $4) returning id",
		transportOperation.Type, transportOperation.Date.AsTime(), transportOperation.Description, transportOperation.TransportId).Scan(&transportOperation.Id)

	if err != nil {
		return err
	}

	//update transport field
	if transportOperation.Type == pb.TransportOperationType_sale.String() || transportOperation.Type == pb.TransportOperationType_write_off.String() {
		_, err = tx.Exec(ctx, "UPDATE transport set active=FALSE where transport.id=$1", transportOperation.GetTransportId())
	}
	return err
}

func (bc *TransportOperationController) Alter(ctx context.Context, transportOperation *pb.TransportOperation) error {
	_, err := bc.dbpool.Exec(ctx, "UPDATE transport_operation SET type = $1, date = $2, description=$3, transport_id=$4 WHERE id = $5",
		transportOperation.Type, transportOperation.Date.AsTime(), transportOperation.Description, transportOperation.TransportId, transportOperation.Id)
	return err
}
