package controllers

import (
	pb "AutoEnterpise/go_code/generated/transport"
	"AutoEnterpise/go_code/utils"
	"context"
	"errors"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type TransportFields struct {
	ID               pgtype.Int4
	Name             pgtype.Text
	LicensePlate     pgtype.Text
	Type             pgtype.Text
	GarageFacilityId pgtype.Int4
}

type TransportController struct {
	DBPool *pgxpool.Pool
	Fields TransportFields
}

func NewTransportController(DBPool *pgxpool.Pool) *TransportController {
	return &TransportController{DBPool: DBPool}
}

func (pc *TransportController) CreateBasic(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {

	err := tx.QueryRow(ctx, "INSERT INTO transport (name, licence_plate, type, garage_facility_id) VALUES ($1, $2, $3, $4) RETURNING id",
		transport.Name, transport.LicensePlate, transport.Type, transport.GarageFacilityId).Scan(&transport.Id)
	return err
}

func (pc *TransportController) CreateInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	return nil
}

func (pc *TransportController) CreateWrapper(superController SuperType, ctx context.Context, transport *pb.Transport) error {
	tx, err := pc.DBPool.Begin(ctx)

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
	err = superController.CreateBasic(tx, ctx, transport)
	if err != nil {
		return err
	}
	err = superController.CreateInfo(tx, ctx, transport)
	return err
}

func (pc *TransportController) Create(ctx context.Context, transport *pb.Transport) error {
	return errors.New("not implemented")
}

func (pc *TransportController) Alter(ctx context.Context, transport *pb.Transport) error {
	return errors.New("not implemented")
}

func (pc *TransportController) AlterWrapper(superController SuperType, ctx context.Context, transport *pb.Transport) error {
	tx, err := pc.DBPool.Begin(ctx)
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

	err = superController.AlterBasic(tx, ctx, transport)

	if err != nil {
		return err
	}

	return superController.AlterInfo(tx, ctx, transport)
}

func (pc *TransportController) AlterInfo(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	return nil
}

func (pc *TransportController) AlterBasic(tx pgx.Tx, ctx context.Context, transport *pb.Transport) error {
	_, err := tx.Exec(ctx, "update transport set name=$2, licence_plate=$3, type=$4, garage_facility_id=$5 where id=$1",
		transport.GetId(), transport.Name, transport.LicensePlate, transport.Type, transport.GarageFacilityId)
	if err != nil {
		return err
	}
	return err
}

func (pc *TransportController) ScanTransport() *pb.Transport {
	var id = pc.Fields.ID.Int32
	var garageFacility = pc.Fields.GarageFacilityId.Int32

	newTransport := &pb.Transport{
		Id:               &id,
		Name:             pc.Fields.Name.String,
		LicensePlate:     pc.Fields.LicensePlate.String,
		Type:             pc.Fields.Type.String,
		GarageFacilityId: &garageFacility,
	}

	return newTransport
}

func (pc *TransportController) GetFields() []any {
	return []any{&pc.Fields.ID, &pc.Fields.Name, &pc.Fields.LicensePlate, &pc.Fields.Type, &pc.Fields.GarageFacilityId}
}

func (f *TransportFields) ToStringSelect() string {
	return "transport.id, transport.name, transport.licence_plate, transport.type, transport.garage_facility_id"
}

func (dc *TransportController) All(ctx context.Context) ([]*pb.Transport, error) {
	rows, err := dc.DBPool.Query(ctx, "SELECT transport.id, transport.name, transport.licence_plate, transport.type, transport.garage_facility_id from active_transport as transport")

	if err != nil {
		return nil, err
	}

	transports := make([]*pb.Transport, 0)
	_, err = pgx.ForEachRow(rows, dc.GetFields(), func() error {

		newTransport := dc.ScanTransport()

		transports = append(transports, newTransport)
		return nil
	})
	return transports, err
}

func AddDefaultTransportFilter(query string, filter *pb.TransportFilter) (string, pgx.NamedArgs) {
	args := pgx.NamedArgs{}
	whereClauses := make([]string, 0)
	if filter.GarageFacilityId != nil {
		whereClauses = append(whereClauses, "garage_facility_id = @garage_facility_id")
		args["garage_facility_id"] = filter.GetGarageFacilityId()
	}

	if len(filter.Ids) > 0 {
		args["ids"] = filter.Ids
		whereClauses = append(whereClauses, "transport.id = ANY(@ids)")
	}

	if filter.RouteId != nil {
		query += " left join transport_on_route on transport_on_route.transport_id = transport.id"
		whereClauses = append(whereClauses, "transport_on_route.route_id = @route_id")
		args["route_id"] = filter.GetRouteId()
	}

	if len(whereClauses) > 0 {
		query += " WHERE " + fmt.Sprintf("%s", utils.JoinStrings(whereClauses, " AND "))
	}
	return query, args
}
