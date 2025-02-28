package service_personnel

import (
	pb "AutoEnterpise/code/generated/person"
	. "AutoEnterpise/code/services/person_service/controllers"
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type AssemblerFields struct {
	ExperienceYears pgtype.Int4
	Specialization  pgtype.Text
	Certification   pgtype.Text
	BrigadeId       pgtype.Int4
}

type AssemblerController struct {
	PersonController
	Fields AssemblerFields
}

func NewAssemblerController(dbpool *pgxpool.Pool) Controller {
	return &AssemblerController{PersonController{DBPool: dbpool}, AssemblerFields{}}
}

func (ac *AssemblerController) Create(ctx context.Context, person *pb.Person) error {
	return ac.PersonController.CreateWrapper(ac, ctx, person)
}

func (ac *AssemblerController) CreateInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	assemblerInfo := person.GetAssemblerInfo()
	if assemblerInfo == nil {
		return errors.New("no assembler info was found")
	}

	_, err := tx.Exec(ctx,
		"INSERT INTO assembler (person_id, experience_years, specialization, certification, brigade_id) VALUES ($1, $2, $3, $4, $5)",
		person.GetId(), assemblerInfo.ExperienceYears, assemblerInfo.Specialization, assemblerInfo.Certification, assemblerInfo.BrigadeId)
	return err
}

func (ac *AssemblerController) Alter(ctx context.Context, person *pb.Person) error {
	return ac.PersonController.AlterWrapper(ac, ctx, person)
}

func (ac *AssemblerController) AlterInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	assemblerInfo := person.GetAssemblerInfo()
	if assemblerInfo == nil {
		return errors.New("no assembler info was found")
	}

	_, err := tx.Exec(ctx,
		"UPDATE assembler SET experience_years=$1, specialization=$2, certification=$3, brigade_id=$4 WHERE person_id=$1",
		person.GetId(), assemblerInfo.ExperienceYears, assemblerInfo.Specialization, assemblerInfo.Certification, assemblerInfo.BrigadeId)
	return err
}

func (ac *AssemblerController) GetFields() []interface{} {
	person := ac.PersonController.GetFields()
	return append(person, &ac.Fields.ExperienceYears, &ac.Fields.Specialization, &ac.Fields.Certification, &ac.Fields.BrigadeId)
}

func (ac *AssemblerController) selectAssemblers(ctx context.Context, query string, args ...any) ([]*pb.Person, error) {
	rows, err := ac.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	persons := make([]*pb.Person, 0)
	_, err = pgx.ForEachRow(rows, ac.GetFields(), func() error {

		newPerson := ac.ScanPerson()

		personInfo := &pb.AssemblerInfo{}

		if ac.Fields.BrigadeId.Valid {
			personInfo.BrigadeId = &ac.Fields.BrigadeId.Int32
		}

		if ac.Fields.ExperienceYears.Valid {
			personInfo.ExperienceYears = ac.Fields.ExperienceYears.Int32
		}

		if ac.Fields.Specialization.Valid {
			personInfo.Specialization = &ac.Fields.Specialization.String
		}

		if ac.Fields.Certification.Valid {
			personInfo.Certification = &ac.Fields.Certification.String
		}

		newPerson.PersonInfo = &pb.Person_AssemblerInfo{AssemblerInfo: personInfo}
		persons = append(persons, newPerson)
		return nil
	})
	return persons, err
}

func (ac *AssemblerController) selectQuery() string {
	query := "select " + ac.PersonController.Fields.ToStringSelect() +
		", experience_years, specialization, certification, brigade_id from person right join assembler on person.id = assembler.person_id"
	return query
}

func (ac *AssemblerController) All(ctx context.Context) ([]*pb.Person, error) {
	return ac.selectAssemblers(ctx, ac.selectQuery())
}

func (ac *AssemblerController) Filtered(ctx context.Context, filter *pb.PersonFilter) ([]*pb.Person, error) {
	query, args := BrigadeIdFilter(ac.selectQuery(), filter.BrigadeId)
	return ac.selectAssemblers(ctx, query, args)
}
