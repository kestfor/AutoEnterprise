package transport_types

import (
	pb "AutoEnterpise/go_code/generated/transport"
	. "AutoEnterpise/go_code/services/transport_service/controllers"
	"context"
	"errors"
	"fmt"
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

func (tc *TramController) selectTrams(ctx context.Context, query string, args ...any) ([]*pb.Transport, error) {
	rows, err := tc.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	transports := make([]*pb.Transport, 0)
	_, err = pgx.ForEachRow(rows, tc.GetFields(), func() error {

		newTransport := tc.ScanTransport()

		transportInfo := &pb.TramInfo{}

		transportInfo.PassengersNum = tc.Fields.PassengersNum.Int32

		transportInfo.YearsOfManufacture = tc.Fields.YearsOfManufacture.Int32

		transportInfo.IsOperational = tc.Fields.IsOperational.Bool

		newTransport.TransportInfo = &pb.Transport_TramInfo{TramInfo: transportInfo}
		transports = append(transports, newTransport)
		return nil
	})
	return transports, err
}

func (tc *TramController) selectQuery() string {
	return "select " + tc.TransportController.Fields.ToStringSelect() +
		", tram.passengers_num, tram.years_of_manufacture, tram.is_operational from active_transport as transport right join tram on transport.id = tram.transport_id"
}

func (tc *TramController) modifiedSelectQuery(tableName string) string {
	return fmt.Sprintf("select "+tc.TransportController.Fields.ToStringSelect()+
		", tram.passengers_num, tram.years_of_manufacture, tram.is_operational from %s right join tram on transport.id = tram.transport_id", tableName)
}

func (d *TramController) All(ctx context.Context) ([]*pb.Transport, error) {
	q := d.selectQuery() + " where transport.id is not null"
	return d.selectTrams(ctx, q)
}

func (d *TramController) Filtered(ctx context.Context, filter *pb.TransportFilter) ([]*pb.Transport, error) {
	query := d.modifiedSelectQuery("transport")
	query, args := AddDefaultTransportFilter(query, filter)
	return d.selectTrams(ctx, query, args)
}

func (d *TramController) AlterInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	tramInfo := transport.GetTramInfo()
	if tramInfo == nil {
		return errors.New("tram info is required")
	}

	_, err := tx.Exec(ctx,
		"UPDATE tram SET passengers_num=$1, years_of_manufacture=$2, is_operational=$3 WHERE transport_id=$4",
		tramInfo.PassengersNum, tramInfo.YearsOfManufacture, tramInfo.IsOperational, transport.GetId())
	return err
}

func (d *TramController) CreateInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	tramInfo := transport.GetTramInfo()
	if tramInfo == nil {
		return errors.New("tram info is required")
	}
	_, err := tx.Exec(ctx,
		"INSERT INTO tram (transport_id, passengers_num, years_of_manufacture, is_operational)  VALUES ($1, $2, $3, $4)",
		transport.Id, tramInfo.PassengersNum, tramInfo.YearsOfManufacture, tramInfo.IsOperational)
	return err
}

func (d *TramController) Create(ctx context.Context, transport *pb.Transport) error {
	return d.CreateWrapper(d, ctx, transport)
}

func (d *TramController) Alter(ctx context.Context, transport *pb.Transport) error {
	return d.AlterWrapper(d, ctx, transport)
}
