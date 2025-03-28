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

type TechnicianFields struct {
	FieldOfExpertise pgtype.Text
	Certification    pgtype.Text
	BrigadeId        pgtype.Int4
}

type TechnicianController struct {
	PersonController
	Fields TechnicianFields
}

func NewTechnicianController(dbpool *pgxpool.Pool) Controller {
	return &TechnicianController{PersonController{DBPool: dbpool}, TechnicianFields{}}
}

func (ac *TechnicianController) Create(ctx context.Context, person *pb.Person) error {
	return ac.PersonController.CreateWrapper(ac, ctx, person)
}

func (ac *TechnicianController) CreateInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	technicianInfo := person.GetTechnicianInfo()
	if technicianInfo == nil {
		return errors.New("no technician info was found")
	}

	_, err := tx.Exec(ctx,
		"INSERT INTO technician (person_id, field_of_expertise, certification, brigade_id) VALUES ($1, $2, $3, $4)",
		person.GetId(), technicianInfo.FieldOfExpertise, technicianInfo.Certification, technicianInfo.BrigadeId)
	return err
}

func (ac *TechnicianController) Alter(ctx context.Context, person *pb.Person) error {
	return ac.PersonController.AlterWrapper(ac, ctx, person)
}

func (ac *TechnicianController) AlterInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	technicianInfo := person.GetTechnicianInfo()
	if technicianInfo == nil {
		return errors.New("no technician info was found")
	}

	_, err := tx.Exec(ctx,
		"UPDATE technician  SET field_of_expertise=$2, certification=$3, brigade_id=$4  WHERE person_id=$1",
		person.GetId(), technicianInfo.FieldOfExpertise, technicianInfo.Certification, technicianInfo.BrigadeId)
	return err
}

func (ac *TechnicianController) GetFields() []any {
	person := ac.PersonController.GetFields()
	return append(person, &ac.Fields.FieldOfExpertise, &ac.Fields.Certification, &ac.Fields.BrigadeId)
}

func (ac *TechnicianController) selectTechnicians(ctx context.Context, query string, args ...any) ([]*pb.Person, error) {
	rows, err := ac.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	persons := make([]*pb.Person, 0)
	_, err = pgx.ForEachRow(rows, ac.GetFields(), func() error {

		newPerson := ac.ScanPerson()

		personInfo := &pb.TechnicianInfo{}

		if ac.Fields.BrigadeId.Valid {
			tmp := ac.Fields.BrigadeId.Int32
			personInfo.BrigadeId = &tmp
		}

		if ac.Fields.Certification.Valid {
			tmp := ac.Fields.Certification.String
			personInfo.Certification = &tmp
		}

		if ac.Fields.FieldOfExpertise.Valid {
			tmp := ac.Fields.FieldOfExpertise.String
			personInfo.FieldOfExpertise = &tmp
		}

		newPerson.PersonInfo = &pb.Person_TechnicianInfo{TechnicianInfo: personInfo}
		persons = append(persons, newPerson)
		return nil
	})
	return persons, err
}

func (ac *TechnicianController) selectQuery() string {
	return "select " + ac.PersonController.Fields.ToStringSelect() +
		", field_of_expertise, certification, brigade_id from person right join technician on person.id = technician.person_id"
}

func (ac *TechnicianController) All(ctx context.Context) ([]*pb.Person, error) {

	return ac.selectTechnicians(ctx, ac.selectQuery())
}

func (ac *TechnicianController) Filtered(ctx context.Context, filter *pb.PersonFilter) ([]*pb.Person, error) {
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
	return ac.selectTechnicians(ctx, query, args)
}
