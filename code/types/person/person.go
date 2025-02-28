package person

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
)

type Role string

const (
	ManagerRole    Role = "manager"
	MasterRole     Role = "master"
	ForemanRole    Role = "foreman"
	DriverRole     Role = "driver"
	TechnicianRole Role = "technician"
	WelderRole     Role = "welder"
	AssemblerRole  Role = "assembler"
	PlumberRole    Role = "plumber"
)

type Person struct {
	ID        pgtype.Int4 `db:"id"`
	FirstName string      `db:"first_name"`
	LastName  string      `db:"last_name"`
	role      Role        `db:"role"`
}

type Driver struct {
	Person
	TransportId pgtype.Int4 `db:"transport_id"`
	Salary      pgtype.Int4 `db:"salary"`
	BrigadeId   pgtype.Int4 `db:"brigade_id"`
}

type Manager struct {
	Person
	Salary pgtype.Int4 `db:"salary"`
}

type Foreman struct {
	Person
	Salary   pgtype.Int4 `db:"salary"`
	MasterId pgtype.Int4 `db:"master_id"`
}

type Master struct {
	Person
	Salary    pgtype.Int4 `db:"salary"`
	ManagerId pgtype.Int4 `db:"manager_id"`
}

func NewMaster() *Master {
	return &Master{Person: Person{role: MasterRole}}
}

func NewDriver() *Driver {
	return &Driver{Person: Person{role: DriverRole}}
}

func NewForeman() *Foreman {
	return &Foreman{Person: Person{role: ForemanRole}}
}

func NewManager() *Manager {
	return &Manager{Person: Person{role: ManagerRole}}
}

type DBInstance interface {
	Save(ctx context.Context, tx pgx.Tx) error
}

func (p *Person) Save(ctx context.Context, tx pgx.Tx) error {
	personStmt := "INSERT INTO person (first_name, last_name, role) VALUES ($1, $2, $3) RETURNING id"
	var id pgtype.Int4
	err := tx.QueryRow(ctx, personStmt, p.FirstName, p.LastName, p.role).Scan(&id)

	if err != nil {
		return err
	}
	p.ID = id
	return nil
}

func (m *Manager) Save(ctx context.Context, tx pgx.Tx) error {
	if err := m.Person.Save(ctx, tx); err != nil {
		return err
	}

	managerStmt := "INSERT INTO person_info_manager (id, salary) VALUES ($1, $2)"
	_, err := tx.Exec(ctx, managerStmt, m.ID, m.Salary)
	return err
}

func (d *Driver) Save(ctx context.Context, tx pgx.Tx) error {

	if err := d.Person.Save(ctx, tx); err != nil {
		return err
	}

	driverStmt := "INSERT INTO person_info_driver (id, salary, transport_id, brigade_id) VALUES ($1, $2, $3, $4)"
	_, err := tx.Exec(ctx, driverStmt, d.ID, d.Salary, d.TransportId, d.BrigadeId)
	return err
}

func (m *Master) Save(ctx context.Context, tx pgx.Tx) error {
	if err := m.Person.Save(ctx, tx); err != nil {
		return err
	}

	managerStmt := "INSERT INTO person_info_master (id, salary, manager_id) VALUES ($1, $2, $3)"
	_, err := tx.Exec(ctx, managerStmt, m.ID, m.Salary, m.ManagerId)
	return err
}

func (f *Foreman) Save(ctx context.Context, tx pgx.Tx) error {

	if err := f.Person.Save(ctx, tx); err != nil {
		return err
	}

	managerStmt := "INSERT INTO person_info_foreman (id, salary, master_id) VALUES ($1, $2, $3)"
	_, err := tx.Exec(ctx, managerStmt, f.ID, f.Salary, f.MasterId)
	return err
}
