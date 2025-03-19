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

type TrolleybusFields struct {
	PassengersNum      pgtype.Int4
	YearsOfManufacture pgtype.Int4
	IsOperational      pgtype.Bool
}

type TrolleybusController struct {
	TransportController
	Fields TrolleybusFields
}

func NewTrolleybusController(DBPool *pgxpool.Pool) Controller {
	return &TrolleybusController{TransportController{DBPool: DBPool}, TrolleybusFields{}}
}

func (d *TrolleybusController) GetFields() []any {
	transport := d.TransportController.GetFields()
	return append(transport, &d.Fields.PassengersNum, &d.Fields.YearsOfManufacture, &d.Fields.IsOperational)
}

func (tc *TrolleybusController) selectTrolleybuses(ctx context.Context, query string, args ...any) ([]*pb.Transport, error) {
	rows, err := tc.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	transports := make([]*pb.Transport, 0)
	_, err = pgx.ForEachRow(rows, tc.GetFields(), func() error {

		newTransport := tc.ScanTransport()

		transportInfo := &pb.TrolleybusInfo{}

		transportInfo.PassengersNum = tc.Fields.PassengersNum.Int32

		transportInfo.YearsOfManufacture = tc.Fields.YearsOfManufacture.Int32

		transportInfo.IsOperational = tc.Fields.IsOperational.Bool

		newTransport.TransportInfo = &pb.Transport_TrolleybusInfo{TrolleybusInfo: transportInfo}
		transports = append(transports, newTransport)
		return nil
	})
	return transports, err
}

func (tc *TrolleybusController) selectQuery() string {
	return "select " + tc.TransportController.Fields.ToStringSelect() +
		", trolleybus.passengers_num, trolleybus.years_of_manufacture, trolleybus.is_operational from active_transport as transport right join trolleybus on transport.id = trolleybus.transport_id"
}

func (tc *TrolleybusController) modifiedSelectQuery(tableName string) string {
	return fmt.Sprintf("select "+tc.TransportController.Fields.ToStringSelect()+
		", trolleybus.passengers_num, trolleybus.years_of_manufacture, trolleybus.is_operational from %s right join trolleybus on transport.id = trolleybus.transport_id", tableName)
}

func (d *TrolleybusController) All(ctx context.Context) ([]*pb.Transport, error) {
	q := d.selectQuery() + " where transport.id is not null"
	return d.selectTrolleybuses(ctx, q)
}

func (d *TrolleybusController) Filtered(ctx context.Context, filter *pb.TransportFilter) ([]*pb.Transport, error) {
	query := d.modifiedSelectQuery("transport")
	query, args := AddDefaultTransportFilter(query, filter)
	return d.selectTrolleybuses(ctx, query, args)
}

func (d *TrolleybusController) AlterInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	trolleybusInfo := transport.GetTrolleybusInfo()
	if trolleybusInfo == nil {
		return errors.New("trolleybus info is required")
	}

	_, err := tx.Exec(ctx,
		"UPDATE trolleybus SET passengers_num=$1, years_of_manufacture=$2, is_operational=$3 WHERE transport_id=$4",
		trolleybusInfo.PassengersNum, trolleybusInfo.YearsOfManufacture, trolleybusInfo.IsOperational, transport.GetId())
	return err
}

func (d *TrolleybusController) CreateInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	trolleybusInfo := transport.GetTrolleybusInfo()
	if trolleybusInfo == nil {
		return errors.New("trolleybus info is required")
	}
	_, err := tx.Exec(ctx,
		"INSERT INTO trolleybus (transport_id, passengers_num, years_of_manufacture, is_operational)  VALUES ($1, $2, $3, $4)",
		transport.Id, trolleybusInfo.PassengersNum, trolleybusInfo.YearsOfManufacture, trolleybusInfo.IsOperational)
	return err
}

func (d *TrolleybusController) Create(ctx context.Context, transport *pb.Transport) error {
	return d.CreateWrapper(d, ctx, transport)
}

func (d *TrolleybusController) Alter(ctx context.Context, transport *pb.Transport) error {
	return d.AlterWrapper(d, ctx, transport)
}
