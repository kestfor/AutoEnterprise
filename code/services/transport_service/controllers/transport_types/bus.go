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

type BusFields struct {
	PassengersNum pgtype.Int4
}

type BusController struct {
	TransportController
	Fields BusFields
}

func NewBusController(DBPool *pgxpool.Pool) Controller {
	return &BusController{TransportController{DBPool: DBPool}, BusFields{}}
}

func (d *BusController) GetFields() []any {
	transport := d.TransportController.GetFields()
	return append(transport, &d.Fields.PassengersNum)
}

func (bc *BusController) selectBusses(ctx context.Context, query string, args ...any) ([]*pb.Transport, error) {
	rows, err := bc.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	transports := make([]*pb.Transport, 0)
	_, err = pgx.ForEachRow(rows, bc.GetFields(), func() error {

		newTransport := bc.ScanTransport()

		transportInfo := &pb.BusInfo{}

		transportInfo.PassengersNum = bc.Fields.PassengersNum.Int32

		newTransport.TransportInfo = &pb.Transport_BusInfo{BusInfo: transportInfo}
		transports = append(transports, newTransport)
		return nil
	})
	return transports, err
}

func (bc *BusController) selectQuery() string {
	return "select " + bc.TransportController.Fields.ToStringSelect() +
		", bus.passengers_num from transport right join bus on transport.id = bus.transport_id"
}

func (d *BusController) All(ctx context.Context) ([]*pb.Transport, error) {
	return d.selectBusses(ctx, d.selectQuery())
}

func (d *BusController) Filtered(ctx context.Context, filter *pb.TransportFilter) ([]*pb.Transport, error) {
	query := d.selectQuery()
	query, args := AddDefaultTransportFilter(query, filter)
	return d.selectBusses(ctx, query, args)
}

func (d *BusController) AlterInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	busInfo := transport.GetBusInfo()
	if busInfo == nil {
		return errors.New("bus info is required")
	}

	_, err := tx.Exec(ctx,
		"UPDATE bus SET passengers_num=$1 WHERE transport_id=$2",
		busInfo.PassengersNum, transport.GetId())
	return err
}

func (d *BusController) CreateInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	busInfo := transport.GetBusInfo()
	if busInfo == nil {
		return errors.New("bus info is required")
	}
	_, err := tx.Exec(ctx,
		"INSERT INTO bus (transport_id, passengers_num)  VALUES ($1, $2)",
		transport.Id, busInfo.PassengersNum)
	return err
}

func (d *BusController) Create(ctx context.Context, transport *pb.Transport) error {
	return d.CreateWrapper(d, ctx, transport)
}

func (d *BusController) Alter(ctx context.Context, transport *pb.Transport) error {
	return d.AlterWrapper(d, ctx, transport)
}
