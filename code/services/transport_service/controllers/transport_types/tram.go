package transport_types

import (
	pb "AutoEnterpise/code/generated/transport"
	. "AutoEnterpise/code/services/transport_service/controllers"
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type TramFields struct {
	PassengersNum      pgtype.Int4
	YearsOfManufacture pgtype.Int4
	IsOperational      pgtype.Bool
}

type TramController struct {
	TransportController
	Fields TramFields
}

func NewTramController(DBPool *pgxpool.Pool) Controller {
	return &TramController{TransportController{DBPool: DBPool}, TramFields{}}
}

func (d *TramController) GetFields() []any {
	transport := d.TransportController.GetFields()
	return append(transport, &d.Fields.PassengersNum, &d.Fields.YearsOfManufacture, &d.Fields.IsOperational)
}

func (d *TramController) All(ctx context.Context) ([]*pb.Transport, error) {
	query := "select " + d.TransportController.Fields.ToStringSelect() +
		", tram.passengers_num, tram.years_of_manufacture, tram.is_operational from transport right join tram on transport.id = tram.transport_id"
	rows, err := d.DBPool.Query(ctx, query)

	if err != nil {
		return nil, err
	}

	transports := make([]*pb.Transport, 0)
	_, err = pgx.ForEachRow(rows, d.GetFields(), func() error {

		newTransport := d.ScanTransport()

		transportInfo := &pb.TramInfo{}

		transportInfo.PassengersNum = d.Fields.PassengersNum.Int32

		transportInfo.YearsOfManufacture = d.Fields.YearsOfManufacture.Int32

		transportInfo.IsOperational = d.Fields.IsOperational.Bool

		newTransport.TransportInfo = &pb.Transport_TramInfo{TramInfo: transportInfo}
		transports = append(transports, newTransport)
		return nil
	})
	return transports, err
}

func (d *TramController) AlterInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	tramInfo := transport.GetTramInfo()
	if tramInfo == nil {
		return errors.New("tram info is required")
	}

	_, err := tx.Exec(ctx,
		"UPDATE tram SET passenger_num=$1, year_of_manufacture=$2, is_operational=$3 WHERE transport_id=$4",
		tramInfo.PassengersNum, tramInfo.YearsOfManufacture, tramInfo.IsOperational, transport.GetId())
	return err
}

func (d *TramController) CreateInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	tramInfo := transport.GetTramInfo()
	if tramInfo == nil {
		return errors.New("tram info is required")
	}
	_, err := tx.Exec(ctx,
		"INSERT INTO tram (transport_id, passenger_num, year_of_manufacture, is_operational)  VALUES ($1, $2, $3, $4)",
		transport.Id, tramInfo.PassengersNum, tramInfo.YearsOfManufacture, tramInfo.IsOperational)
	return err
}

func (d *TramController) Create(ctx context.Context, transport *pb.Transport) error {
	return d.CreateWrapper(d, ctx, transport)
}

func (d *TramController) Alter(ctx context.Context, transport *pb.Transport) error {
	return d.AlterWrapper(d, ctx, transport)
}
