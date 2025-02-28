package main_persons

import (
	pb "AutoEnterpise/code/generated/person"
	. "AutoEnterpise/code/services/person_service/controllers"
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type ManagerFields struct {
	Department           pgtype.Text
	ManagementExperience pgtype.Int4
}

type ManagerController struct {
	PersonController
	Fields ManagerFields
}

func NewManagerController(DBPool *pgxpool.Pool) Controller {
	return &ManagerController{PersonController{DBPool: DBPool}, ManagerFields{}}
}

func (dc *ManagerController) GetFields() []any {
	person := dc.PersonController.GetFields()
	return append(person, &dc.Fields.Department, &dc.Fields.ManagementExperience)
}

func (dc *ManagerController) selectManagers(ctx context.Context, query string, args ...any) ([]*pb.Person, error) {
	rows, err := dc.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	persons := make([]*pb.Person, 0)
	_, err = pgx.ForEachRow(rows, dc.GetFields(), func() error {

		newPerson := dc.ScanPerson()

		personInfo := &pb.ManagerInfo{}

		if dc.Fields.Department.Valid {
			personInfo.Department = dc.Fields.Department.String
		}

		if dc.Fields.ManagementExperience.Valid {
			personInfo.ManagementExperienceYears = dc.Fields.ManagementExperience.Int32
		}

		newPerson.PersonInfo = &pb.Person_ManagerInfo{ManagerInfo: personInfo}
		persons = append(persons, newPerson)
		return nil
	})
	return persons, err
}

func (dc *ManagerController) selectQuery() string {
	return "select " + dc.PersonController.Fields.ToStringSelect() +
		", manager.department, manager.management_experience_years from person right join manager on person.id = manager.person_id"
}

func (dc *ManagerController) All(ctx context.Context) ([]*pb.Person, error) {
	return dc.selectManagers(ctx, dc.selectQuery())
}

func (dc *ManagerController) Filtered(ctx context.Context, filter *pb.PersonFilter) ([]*pb.Person, error) {
	return dc.selectManagers(ctx, dc.selectQuery())
}

func (mc *ManagerController) CreateInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	managerInfo := person.GetManagerInfo()
	if managerInfo == nil {
		return errors.New("manager info is required")
	}

	_, err := tx.Exec(ctx, "INSERT INTO manager (person_id, department, management_experience_years)  VALUES ($1, $2, $3)",
		person.Id, managerInfo.Department, managerInfo.ManagementExperienceYears)
	return err
}

func (mc *ManagerController) AlterInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	managerInfo := person.GetManagerInfo()
	if managerInfo == nil {
		return errors.New("manager info is required")
	}

	_, err := tx.Exec(ctx, "UPDATE manager SET  department = $1, management_experience_years = $2 WHERE person_id = $3",
		managerInfo.Department, managerInfo.ManagementExperienceYears, person.GetId())
	return err
}

func (mc *ManagerController) Alter(ctx context.Context, person *pb.Person) error {
	return mc.AlterWrapper(mc, ctx, person)
}

func (mc *ManagerController) Create(ctx context.Context, person *pb.Person) error {
	return mc.CreateWrapper(mc, ctx, person)
}
