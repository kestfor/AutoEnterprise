package main_persons

import (
	pb "AutoEnterpise/go_code/generated/person"
	. "AutoEnterpise/go_code/services/person_service/controllers"
	"AutoEnterpise/go_code/utils"
	"context"
	"errors"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type DriverFields struct {
	TransportId pgtype.Int4
	BrigadeId   pgtype.Int4
}

type DriverController struct {
	PersonController
	Fields DriverFields
}

func NewDriverController(DBPool *pgxpool.Pool) *DriverController {
	return &DriverController{PersonController{DBPool: DBPool}, DriverFields{}}
}

func (d *DriverController) GetFields() []any {
	person := d.PersonController.GetFields()
	return append(person, &d.Fields.TransportId, &d.Fields.BrigadeId)
}

func (d *DriverController) selectDrivers(ctx context.Context, query string, args ...any) ([]*pb.Person, error) {
	rows, err := d.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	persons := make([]*pb.Person, 0)
	_, err = pgx.ForEachRow(rows, d.GetFields(), func() error {

		newPerson := d.ScanPerson()

		personInfo := &pb.DriverInfo{}

		if d.Fields.TransportId.Valid {
			tmp := d.Fields.TransportId.Int32
			personInfo.TransportId = &tmp
		}

		if d.Fields.BrigadeId.Valid {
			tmp := d.Fields.BrigadeId.Int32
			personInfo.BrigadeId = &tmp
		}

		newPerson.PersonInfo = &pb.Person_DriverInfo{DriverInfo: personInfo}
		persons = append(persons, newPerson)
		return nil
	})
	return persons, err
}

func (d *DriverController) selectQuery() string {
	query := "select " + d.PersonController.Fields.ToStringSelect() +
		", driver.transport_id, driver.brigade_id from person right join driver on person.id = driver.person_id"
	return query
}

func (d *DriverController) All(ctx context.Context) ([]*pb.Person, error) {
	return d.selectDrivers(ctx, d.selectQuery())
}

func (d *DriverController) Filtered(ctx context.Context, filter *pb.PersonFilter) ([]*pb.Person, error) {
	query := d.selectQuery()

	args := pgx.NamedArgs{}
	if filter != nil {
		var whereClauses []string

		if filter.BrigadeId != nil {
			whereClauses = append(whereClauses, fmt.Sprintf("%s = @%d", "brigade_id", filter.GetBrigadeId()))
			args["brigade_id"] = *filter.BrigadeId
		}

		if len(whereClauses) > 0 {
			query += " WHERE " + fmt.Sprintf("%s", utils.JoinStrings(whereClauses, " AND "))
		}
	}

	return d.selectDrivers(ctx, query, args)
}

func (d *DriverController) AlterInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	driverInfo := person.GetDriverInfo()
	if driverInfo == nil {
		return errors.New("driver info is required")
	}

	_, err := tx.Exec(ctx,
		"UPDATE driver SET transport_id=$1, brigade_id=$2 WHERE person_id=$3",
		driverInfo.TransportId, driverInfo.BrigadeId, person.GetId())
	return err
}

func (d *DriverController) CreateInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	driverInfo := person.GetDriverInfo()
	if driverInfo == nil {
		return errors.New("driver info is required")
	}
	_, err := tx.Exec(ctx,
		"INSERT INTO driver (person_id, transport_id, brigade_id)  VALUES ($1, $2, $3)",
		person.Id, driverInfo.TransportId, driverInfo.BrigadeId)
	return err
}

func (d *DriverController) GetByTransportId(ctx context.Context, transportId int32) ([]*pb.Person, error) {
	args := pgx.NamedArgs{"transport_id": transportId}
	query := d.selectQuery() + " WHERE transport_id = @transport_id"
	persons, err := d.selectDrivers(ctx, query, args)
	if err != nil {
		return nil, err
	}
	return persons, nil
}

func (d *DriverController) Create(ctx context.Context, person *pb.Person) error {
	return d.CreateWrapper(d, ctx, person)
}

func (d *DriverController) Alter(ctx context.Context, person *pb.Person) error {
	return d.AlterWrapper(d, ctx, person)
}
