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

type TruckFields struct {
	CargoCapacityKg    pgtype.Float4
	FuelConsumption    pgtype.Float4
	TruckType          pgtype.Text
	YearsOfManufacture pgtype.Int4
}

type TruckController struct {
	TransportController
	Fields TruckFields
}

func NewTruckController(DBPool *pgxpool.Pool) Controller {
	return &TruckController{TransportController{DBPool: DBPool}, TruckFields{}}
}

func (d *TruckController) GetFields() []any {
	transport := d.TransportController.GetFields()
	return append(transport, &d.Fields.CargoCapacityKg, &d.Fields.FuelConsumption, &d.Fields.TruckType, &d.Fields.YearsOfManufacture)
}

func (d *TruckController) All(ctx context.Context) ([]*pb.Transport, error) {
	query := "select " + d.TransportController.Fields.ToStringSelect() +
		", truck.cargo_capacity_kg, truck.fuel_consumption, truck.truck_type, truck.year_of_manufacture from transport right join truck on transport.id = truck.transport_id"
	rows, err := d.DBPool.Query(ctx, query)

	if err != nil {
		return nil, err
	}

	transports := make([]*pb.Transport, 0)
	_, err = pgx.ForEachRow(rows, d.GetFields(), func() error {

		newTransport := d.ScanTransport()

		transportInfo := &pb.TruckInfo{}

		transportInfo.CargoCapacityKg = d.Fields.CargoCapacityKg.Float32
		transportInfo.FuelConsumption = d.Fields.FuelConsumption.Float32
		transportInfo.TruckType = d.Fields.TruckType.String
		transportInfo.YearsOfManufacture = d.Fields.YearsOfManufacture.Int32

		newTransport.TransportInfo = &pb.Transport_TruckInfo{TruckInfo: transportInfo}
		transports = append(transports, newTransport)
		return nil
	})
	return transports, err
}

func (d *TruckController) AlterInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	truckInfo := transport.GetTruckInfo()
	if truckInfo == nil {
		return errors.New("truck info is required")
	}

	_, err := tx.Exec(ctx,
		"UPDATE truck SET cargo_capacity_kg=$1, fuel_consumption=$2, truck_type=$3, year_of_manufacture=$4 WHERE transport_id=$5",
		truckInfo.CargoCapacityKg, truckInfo.FuelConsumption, truckInfo.TruckType, truckInfo.YearsOfManufacture, transport.GetId())
	return err
}

func (d *TruckController) CreateInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	truckInfo := transport.GetTruckInfo()
	if truckInfo == nil {
		return errors.New("truck info is required")
	}
	_, err := tx.Exec(ctx,
		"INSERT INTO truck (transport_id, cargo_capacity_kg, fuel_consumption, truck_type, year_of_manufacture)  VALUES ($1, $2, $3, $4, $5)",
		transport.Id, truckInfo.CargoCapacityKg, truckInfo.FuelConsumption, truckInfo.TruckType, truckInfo.YearsOfManufacture)
	return err
}

func (d *TruckController) Create(ctx context.Context, transport *pb.Transport) error {
	return d.CreateWrapper(d, ctx, transport)
}

func (d *TruckController) Alter(ctx context.Context, transport *pb.Transport) error {
	return d.AlterWrapper(d, ctx, transport)
}
