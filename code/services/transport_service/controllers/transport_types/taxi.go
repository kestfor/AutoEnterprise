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

type TaxiFields struct {
	IsAvailable        pgtype.Bool
	YearsOfManufacture pgtype.Int4
}

type TaxiController struct {
	TransportController
	Fields TaxiFields
}

func NewTaxiController(DBPool *pgxpool.Pool) Controller {
	return &TaxiController{TransportController{DBPool: DBPool}, TaxiFields{}}
}

func (d *TaxiController) GetFields() []any {
	transport := d.TransportController.GetFields()
	return append(transport, &d.Fields.IsAvailable, &d.Fields.YearsOfManufacture)
}

func (tc *TaxiController) selectTaxis(ctx context.Context, query string, args ...any) ([]*pb.Transport, error) {
	rows, err := tc.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	transports := make([]*pb.Transport, 0)
	_, err = pgx.ForEachRow(rows, tc.GetFields(), func() error {

		newTransport := tc.ScanTransport()

		transportInfo := &pb.TaxiInfo{}

		transportInfo.IsAvailable = tc.Fields.IsAvailable.Bool

		transportInfo.YearsOfManufacture = tc.Fields.YearsOfManufacture.Int32

		newTransport.TransportInfo = &pb.Transport_TaxiInfo{TaxiInfo: transportInfo}
		transports = append(transports, newTransport)
		return nil
	})
	return transports, err
}

func (tc *TaxiController) selectQuery() string {
	return "select " + tc.TransportController.Fields.ToStringSelect() +
		", taxi.is_available, taxi.years_of_manufacture from transport right join taxi on transport.id = taxi.transport_id"
}

func (d *TaxiController) All(ctx context.Context) ([]*pb.Transport, error) {
	return d.selectTaxis(ctx, d.selectQuery())
}

func (d *TaxiController) Filtered(ctx context.Context, filter *pb.TransportFilter) ([]*pb.Transport, error) {
	query := d.selectQuery()
	query, args := AddDefaultTransportFilter(query, filter)
	return d.selectTaxis(ctx, query, args)
}

func (d *TaxiController) AlterInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	taxiInfo := transport.GetTaxiInfo()
	if taxiInfo == nil {
		return errors.New("taxi info is required")
	}

	_, err := tx.Exec(ctx,
		"UPDATE taxi SET is_available=$1, years_of_manufacture=$2 WHERE transport_id=$3",
		taxiInfo.IsAvailable, taxiInfo.YearsOfManufacture, transport.GetId())
	return err
}

func (d *TaxiController) CreateInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	taxiInfo := transport.GetTaxiInfo()
	if taxiInfo == nil {
		return errors.New("taxi info is required")
	}
	_, err := tx.Exec(ctx,
		"INSERT INTO taxi (transport_id, is_available, years_of_manufacture)  VALUES ($1, $2, $3)",
		transport.Id, taxiInfo.IsAvailable, taxiInfo.YearsOfManufacture)
	return err
}

func (d *TaxiController) Create(ctx context.Context, transport *pb.Transport) error {
	return d.CreateWrapper(d, ctx, transport)
}

func (d *TaxiController) Alter(ctx context.Context, transport *pb.Transport) error {
	return d.AlterWrapper(d, ctx, transport)
}
