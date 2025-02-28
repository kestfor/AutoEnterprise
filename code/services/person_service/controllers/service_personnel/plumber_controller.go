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

type PlumberFields struct {
	Specialization pgtype.Text
	Certification  pgtype.Text
	SafetyTraining pgtype.Bool
	BrigadeId      pgtype.Int4
}

type PlumberController struct {
	PersonController
	Fields PlumberFields
}

func NewPlumberController(dbpool *pgxpool.Pool) Controller {
	return &PlumberController{PersonController{DBPool: dbpool}, PlumberFields{}}
}

func (ac *PlumberController) Create(ctx context.Context, person *pb.Person) error {
	return ac.PersonController.CreateWrapper(ac, ctx, person)
}

func (ac *PlumberController) CreateInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	plumberInfo := person.GetPlumberInfo()
	if plumberInfo == nil {
		return errors.New("no plumber info was found")
	}

	_, err := tx.Exec(ctx,
		"INSERT INTO plumber (person_id, specialization, certification, safety_training, brigade_id) VALUES ($1)",
		person.GetId(), plumberInfo.Specialization, plumberInfo.Certification, plumberInfo.SafetyTraining, plumberInfo.BrigadeId)
	return err
}

func (ac *PlumberController) Alter(ctx context.Context, person *pb.Person) error {
	return ac.PersonController.AlterWrapper(ac, ctx, person)
}

func (ac *PlumberController) AlterInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	plumberInfo := person.GetPlumberInfo()
	if plumberInfo == nil {
		return errors.New("no plumber info was found")
	}

	_, err := tx.Exec(ctx,
		"UPDATE plumber SET specialization=$2, certification=$3, safety_training=$4, brigade_id=$5 WHERE person_id=$1",
		person.GetId(), plumberInfo.Specialization, plumberInfo.Certification, plumberInfo.SafetyTraining, plumberInfo.BrigadeId)
	return err
}

func (ac *PlumberController) GetFields() []interface{} {
	person := ac.PersonController.GetFields()
	return append(person, &ac.Fields.Specialization, &ac.Fields.Certification, &ac.Fields.SafetyTraining, &ac.Fields.BrigadeId)
}

func (ac *PlumberController) selectPlumbers(ctx context.Context, query string, args ...interface{}) ([]*pb.Person, error) {
	rows, err := ac.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	persons := make([]*pb.Person, 0)
	_, err = pgx.ForEachRow(rows, ac.GetFields(), func() error {

		newPerson := ac.ScanPerson()

		personInfo := &pb.PlumberInfo{}

		if ac.Fields.BrigadeId.Valid {
			personInfo.BrigadeId = &ac.Fields.BrigadeId.Int32
		}

		if ac.Fields.Specialization.Valid {
			personInfo.Specialization = &ac.Fields.Specialization.String
		}

		if ac.Fields.Certification.Valid {
			personInfo.Certification = &ac.Fields.Certification.String
		}

		if ac.Fields.SafetyTraining.Valid {
			personInfo.SafetyTraining = ac.Fields.SafetyTraining.Bool
		}

		newPerson.PersonInfo = &pb.Person_PlumberInfo{PlumberInfo: personInfo}
		persons = append(persons, newPerson)
		return nil
	})
	return persons, err
}

func (ac *PlumberController) selectQuery() string {
	return "select " + ac.PersonController.Fields.ToStringSelect() +
		",specialization, certification, safety_training, brigade_id from person right join plumber on person.id = plumber.person_id"
}

func (ac *PlumberController) Filtered(ctx context.Context, filter *pb.PersonFilter) ([]*pb.Person, error) {
	query, args := BrigadeIdFilter(ac.selectQuery(), filter.BrigadeId)
	return ac.selectPlumbers(ctx, query, args)
}

func (ac *PlumberController) All(ctx context.Context) ([]*pb.Person, error) {
	return ac.selectPlumbers(ctx, ac.selectQuery())
}
