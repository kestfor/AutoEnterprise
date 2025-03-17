package service_personnel

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

type WelderFields struct {
	WeldingType    pgtype.Text
	Certification  pgtype.Text
	SafetyTraining pgtype.Bool
	BrigadeId      pgtype.Int4
}

type WelderController struct {
	PersonController
	Fields WelderFields
}

func NewWelderController(dbpool *pgxpool.Pool) Controller {
	return &WelderController{PersonController{DBPool: dbpool}, WelderFields{}}
}

func (ac *WelderController) Create(ctx context.Context, person *pb.Person) error {
	return ac.PersonController.CreateWrapper(ac, ctx, person)
}

func (ac *WelderController) CreateInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	welderInfo := person.GetWelderInfo()
	if welderInfo == nil {
		return errors.New("no welder info was found")
	}

	_, err := tx.Exec(ctx,
		"INSERT INTO welder (person_id, welding_type, certification, safety_training, brigade_id) VALUES ($1, $2, $3, $4, $5)",
		person.GetId(), welderInfo.WeldingType, welderInfo.Certification, welderInfo.SafetyTraining, welderInfo.BrigadeId)
	return err
}

func (ac *WelderController) Alter(ctx context.Context, person *pb.Person) error {
	return ac.PersonController.AlterWrapper(ac, ctx, person)
}

func (ac *WelderController) AlterInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	welderInfo := person.GetWelderInfo()
	if welderInfo == nil {
		return errors.New("no welder info was found")
	}

	_, err := tx.Exec(ctx,
		"UPDATE welder SET welding_type=$2, certification=$3, safety_training=$4, brigade_id=$5  WHERE person_id=$1",
		person.GetId(), welderInfo.WeldingType, welderInfo.Certification, welderInfo.SafetyTraining, welderInfo.BrigadeId)
	return err
}

func (ac *WelderController) GetFields() []any {
	person := ac.PersonController.GetFields()
	return append(person, &ac.Fields.WeldingType, &ac.Fields.Certification, &ac.Fields.SafetyTraining, &ac.Fields.BrigadeId)
}

func (ac *WelderController) selectWelders(ctx context.Context, query string, args ...any) ([]*pb.Person, error) {
	rows, err := ac.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	persons := make([]*pb.Person, 0)
	_, err = pgx.ForEachRow(rows, ac.GetFields(), func() error {

		newPerson := ac.ScanPerson()

		personInfo := &pb.WelderInfo{}

		if ac.Fields.BrigadeId.Valid {
			tmp := ac.Fields.BrigadeId.Int32
			personInfo.BrigadeId = &tmp
		}

		if ac.Fields.Certification.Valid {
			tmp := ac.Fields.Certification.String
			personInfo.Certification = &tmp
		}

		if ac.Fields.WeldingType.Valid {
			tmp := ac.Fields.WeldingType.String
			personInfo.WeldingType = &tmp
		}

		if ac.Fields.SafetyTraining.Valid {
			personInfo.SafetyTraining = ac.Fields.SafetyTraining.Bool
		}

		newPerson.PersonInfo = &pb.Person_WelderInfo{WelderInfo: personInfo}
		persons = append(persons, newPerson)
		return nil
	})
	return persons, err
}

func (ac *WelderController) selectQuery() string {
	return "select " + ac.PersonController.Fields.ToStringSelect() +
		", welding_type, certification, safety_training, brigade_id from person right join welder on person.id = welder.person_id"
}

func (ac *WelderController) All(ctx context.Context) ([]*pb.Person, error) {
	return ac.selectWelders(ctx, ac.selectQuery())
}

func (ac *WelderController) Filtered(ctx context.Context, filter *pb.PersonFilter) ([]*pb.Person, error) {
	query := ac.selectQuery()
	var where []string
	where, args := BrigadeIdFilter(where, filter.BrigadeId)
	where, args = IdFilter(where, filter.Ids, args)
	if filter.GetServicePersonnelFilter() != nil {
		where, args = ServicePersonnelFilter(where, args, filter.GetServicePersonnelFilter().ForemanId)
	}
	if len(where) > 0 {
		query += " WHERE " + fmt.Sprintf("%s", utils.JoinStrings(where, " AND "))
	}
	return ac.selectWelders(ctx, query, args)
}
