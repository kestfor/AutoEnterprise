package main_persons

import (
	pb "AutoEnterpise/go_code/generated/person"
	. "AutoEnterpise/go_code/services/person_service/controllers"
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
)

type MasterFields struct {
	ManagerId pgtype.Int4
}

type MasterController struct {
	PersonController
	Fields MasterFields
}

func NewMasterController(DBPool *pgxpool.Pool) Controller {
	return &MasterController{PersonController: *NewPersonController(DBPool)}
}

func (dc *MasterController) GetFields() []any {
	person := dc.PersonController.GetFields()
	return append(person, &dc.Fields.ManagerId)
}

func (dc *MasterController) selectMasters(ctx context.Context, query string, args ...any) ([]*pb.Person, error) {
	rows, err := dc.DBPool.Query(ctx, query, args...)

	if err != nil {
		return nil, err
	}

	persons := make([]*pb.Person, 0)

	_, err = pgx.ForEachRow(rows, dc.GetFields(), func() error {

		newPerson := dc.ScanPerson()

		personInfo := &pb.MasterInfo{}

		if dc.Fields.ManagerId.Valid {
			tmp := dc.Fields.ManagerId.Int32
			personInfo.ManagerId = &tmp
		}

		newPerson.PersonInfo = &pb.Person_MasterInfo{MasterInfo: personInfo}
		persons = append(persons, newPerson)
		return nil
	})
	return persons, err
}

func (dc *MasterController) selectQuery() string {
	return "SELECT person.id, first_name, last_name, person.role, birth_date, phone_number, email, salary, manager_id from person right join master on person.id = master.person_id"
}

func (dc *MasterController) All(ctx context.Context) ([]*pb.Person, error) {
	query := dc.selectQuery()
	return dc.selectMasters(ctx, query)
}

func (dc *MasterController) Filtered(ctx context.Context, filter *pb.PersonFilter) ([]*pb.Person, error) {
	query := dc.selectQuery()
	return dc.selectMasters(ctx, query)
}

func (mc *MasterController) CreateInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	masterInfo := person.GetMasterInfo()
	if masterInfo == nil {
		return errors.New("master info is required")
	}

	_, err := tx.Exec(ctx, "INSERT INTO master (person_id, manager_id)  VALUES ($1, $2)",
		person.Id, masterInfo.ManagerId)
	return err
}

func (mc *MasterController) AlterInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error {
	masterInfo := person.GetMasterInfo()
	if masterInfo == nil {
		return errors.New("master info is required")
	}

	_, err := tx.Exec(ctx, "UPDATE master SET manager_id = $1 WHERE person_id = $2",
		masterInfo.ManagerId, person.GetId())
	return err
}

func (mc *MasterController) Alter(ctx context.Context, person *pb.Person) error {
	return mc.AlterWrapper(mc, ctx, person)
}

func (mc *MasterController) Create(ctx context.Context, person *pb.Person) error {
	return mc.CreateWrapper(mc, ctx, person)
}
