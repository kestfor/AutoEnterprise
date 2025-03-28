package main_persons

import (
	pb "AutoEnterpise/go_code/generated/person"
	. "AutoEnterpise/go_code/services/person_service/controllers"
	"AutoEnterpise/go_code/utils"
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type ForemanFields struct {
	MasterId      pgtype.Int4
	ServiceCenter pgtype.Text
	Certification pgtype.Text
}

type ForemanController struct {
	PersonController
	Fields ForemanFields
}

func NewForemanController(DBPool *pgxpool.Pool) Controller {
	return &ForemanController{PersonController{DBPool: DBPool}, ForemanFields{}}
}

func (d *ForemanController) GetFields() []any {
	person := d.PersonController.GetFields()
	return append(person, &d.Fields.MasterId, &d.Fields.ServiceCenter, &d.Fields.Certification)
}

func (c *ForemanController) selectForemen(ctx context.Context, query string, args ...any) ([]*pb.Person, error) {
	rows, err := c.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	persons := make([]*pb.Person, 0)
	_, err = pgx.ForEachRow(rows, c.GetFields(), func() error {

		newPerson := c.ScanPerson()

		personInfo := &pb.ForemanInfo{}

		if c.Fields.MasterId.Valid {
			tmp := c.Fields.MasterId.Int32
			personInfo.MasterId = &tmp
		}

		if c.Fields.ServiceCenter.Valid {
			tmp := c.Fields.ServiceCenter.String
			personInfo.ServiceCenter = &tmp
		}

		if c.Fields.Certification.Valid {
			tmp := c.Fields.Certification.String
			personInfo.Certification = &tmp
		}

		newPerson.PersonInfo = &pb.Person_ForemanInfo{ForemanInfo: personInfo}
		persons = append(persons, newPerson)
		return nil
	})
	return persons, err
}

func (c *ForemanController) selectQuery() string {
	return "SELECT person.id, first_name, last_name, person.role, birth_date, phone_number, email, salary, master_id, service_center, certification  from person right join foreman on person.id = foreman.person_id"
}

func (c *ForemanController) All(ctx context.Context) ([]*pb.Person, error) {
	return c.selectForemen(ctx, c.selectQuery())
}

func (c *ForemanController) Filtered(ctx context.Context, filter *pb.PersonFilter) ([]*pb.Person, error) {

	args := pgx.NamedArgs{}
	whereClauses := []string{}
	var query = c.selectQuery()
	if filter != nil {
		whereClauses, args = BrigadeIdFilter(whereClauses, filter.BrigadeId)
		whereClauses, args = IdFilter(whereClauses, filter.Ids, args)

		if filter.GetForemanFilter() != nil {
			args["master_id"] = filter.GetForemanFilter().GetMasterId()
			whereClauses = append(whereClauses, "master_id = @master_id")
		}

	}

	query = utils.AddWhereClauses(query, whereClauses)

	return c.selectForemen(ctx, query, args)
}

func (d *ForemanController) AlterInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	foremanInfo := person.GetForemanInfo()
	if foremanInfo == nil {
		return errors.New("driver info is required")
	}

	_, err := tx.Exec(ctx, "UPDATE foreman SET master_id=$1, certification=$2, service_center=$3 WHERE person_id=$4",
		foremanInfo.MasterId, foremanInfo.Certification, foremanInfo.ServiceCenter, person.GetId())
	return err
}

func (d *ForemanController) CreateInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	foremanInfo := person.GetForemanInfo()
	if foremanInfo == nil {
		return errors.New("driver info is required")
	}
	_, err := tx.Exec(ctx, "INSERT INTO foreman (person_id, master_id, service_center, certification)  VALUES ($1, $2, $3, $4)",
		person.Id, foremanInfo.MasterId, foremanInfo.ServiceCenter, foremanInfo.Certification)
	return err
}

func (d *ForemanController) Create(ctx context.Context, person *pb.Person) error {
	return d.CreateWrapper(d, ctx, person)
}

func (d *ForemanController) Alter(ctx context.Context, person *pb.Person) error {
	return d.AlterWrapper(d, ctx, person)
}
