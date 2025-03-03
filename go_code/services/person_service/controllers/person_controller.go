package controllers

import (
	pb "AutoEnterpise/go_code/generated/person"
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
	"google.golang.org/protobuf/types/known/timestamppb"
)

type PersonFields struct {
	ID          pgtype.Int4
	FirstName   pgtype.Text
	LastName    pgtype.Text
	Role        pgtype.Text
	BirthDate   pgtype.Date
	PhoneNumber pgtype.Text
	Email       pgtype.Text
	Salary      pgtype.Float8
}

type PersonController struct {
	DBPool *pgxpool.Pool
	Fields PersonFields
}

func NewPersonController(DBPool *pgxpool.Pool) *PersonController {
	return &PersonController{DBPool: DBPool}
}

func (pc *PersonController) CreateBasic(tx pgx.Tx, ctx context.Context, person *pb.Person) error {

	err := tx.QueryRow(ctx, "INSERT INTO person (first_name, last_name, role, birth_date, phone_number, email, salary) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id",
		person.GetFirstName(), person.GetSecondName(), person.GetRole(), person.GetBirthDate().AsTime(), person.GetPhoneNumber(), person.GetEmail(), person.GetSalary()).Scan(&person.Id)
	return err
}

func (pc *PersonController) CreateInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	return nil
}

func (pc *PersonController) CreateWrapper(superController SuperType, ctx context.Context, person *pb.Person) error {
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
	err = superController.CreateBasic(tx, ctx, person)
	if err != nil {
		return err
	}
	err = superController.CreateInfo(tx, ctx, person)
	return err
}

func (pc *PersonController) Create(ctx context.Context, person *pb.Person) error {
	return errors.New("not implemented")
}

func (pc *PersonController) Alter(ctx context.Context, person *pb.Person) error {
	return errors.New("not implemented")
}

func (pc *PersonController) AlterWrapper(superController SuperType, ctx context.Context, person *pb.Person) error {
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

	err = superController.AlterBasic(tx, ctx, person)

	if err != nil {
		return err
	}

	return superController.AlterInfo(tx, ctx, person)
}

func (pc *PersonController) AlterInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	return nil
}

func (pc *PersonController) AlterBasic(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	_, err := tx.Exec(ctx, "update person set first_name=$2, last_name=$3, role=$4, birth_date=$5, phone_number=$6, email=$7, salary=$8 where id=$1",
		person.GetId(), person.GetFirstName(), person.GetSecondName(), person.GetRole(), person.GetBirthDate().AsTime(), person.GetPhoneNumber(), person.GetEmail(), person.GetSalary())
	if err != nil {
		return err
	}
	return err
}

func (pc *PersonController) ScanPerson() *pb.Person {
	id := pc.Fields.ID.Int32

	newPerson := &pb.Person{
		Id:         &id,
		FirstName:  pc.Fields.FirstName.String,
		SecondName: pc.Fields.LastName.String,
		Role:       pc.Fields.Role.String,
	}

	if pc.Fields.BirthDate.Valid {
		newPerson.BirthDate = timestamppb.New(pc.Fields.BirthDate.Time)
	}

	if pc.Fields.PhoneNumber.Valid {
		newPerson.PhoneNumber = pc.Fields.PhoneNumber.String
	}

	if pc.Fields.Email.Valid {
		newPerson.Email = pc.Fields.Email.String
	}

	if pc.Fields.Salary.Valid {
		newPerson.Salary = float32(pc.Fields.Salary.Float64)
	}
	return newPerson
}

func (pc *PersonController) GetFields() []any {
	return []any{&pc.Fields.ID, &pc.Fields.FirstName, &pc.Fields.LastName, &pc.Fields.Role, &pc.Fields.BirthDate, &pc.Fields.PhoneNumber, &pc.Fields.Email, &pc.Fields.Salary}
}

func (f *PersonFields) ToStringSelect() string {
	return "person.id, person.first_name, person.last_name, person.role, person.birth_date, person.phone_number, person.email, person.salary"
}

func (f *PersonFields) ToStringUpdate() string {
	return "update person set first_name=$2, last_name=$3, role=$4, birth_date=$5, phone_number=$6, email=$7, salary=$8 where person.id=$1"
}

func (dc *PersonController) selectPersons(ctx context.Context, query string) ([]*pb.Person, error) {
	rows, err := dc.DBPool.Query(ctx, query)

	if err != nil {
		return nil, err
	}

	persons := make([]*pb.Person, 0)
	_, err = pgx.ForEachRow(rows, dc.GetFields(), func() error {

		newPerson := dc.ScanPerson()

		persons = append(persons, newPerson)
		return nil
	})
	return persons, err
}

func (dc *PersonController) All(ctx context.Context) ([]*pb.Person, error) {
	query := "SELECT person.id, first_name, last_name, role, birth_date, phone_number, email, salary from person"
	return dc.selectPersons(ctx, query)
}

func (dc *PersonController) Filtered(ctx context.Context, filter *pb.PersonFilter) ([]*pb.Person, error) {
	return make([]*pb.Person, 0), nil
}

func BrigadeIdFilter(query string, brigadeId *int32) (string, pgx.NamedArgs) {
	if brigadeId == nil {
		return query, pgx.NamedArgs{}
	}
	args := pgx.NamedArgs{
		"brigade_id": *brigadeId,
	}
	return query + " where brigade_id = @brigade_id", args
}
