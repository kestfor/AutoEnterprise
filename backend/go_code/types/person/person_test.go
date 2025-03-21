package person

import (
	"AutoEnterpise/go_code/utils"
	"context"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
	"testing"
)

func TestInsert(t *testing.T) {

	config := utils.GetConfig("../../../.env")
	dsn := config.DSN()
	dbpool, err := pgxpool.New(context.Background(), dsn)
	if err != nil {
		t.Fatalf("Failed to create connection pool: %v", err)
	}
	defer dbpool.Close()

	tx, err := dbpool.Begin(context.Background())
	if err != nil {
		t.Fatalf("Failed to begin transaction: %v", err)
	}

	defer tx.Rollback(context.Background())

	var persons = []DBInstance{
		&Manager{Person: Person{FirstName: "John", LastName: "Doe", role: ManagerRole}, Salary: pgtype.Int4{Int32: 2000, Valid: true}},
		&Driver{Person: Person{FirstName: "John", LastName: "Doe", role: DriverRole}, Salary: pgtype.Int4{
			Int32: 2000,
			Valid: true,
		}},
		&Foreman{Person: Person{FirstName: "John", LastName: "Doe", role: ForemanRole}, Salary: pgtype.Int4{Int32: 2000, Valid: true}},
		&Master{Person: Person{FirstName: "John", LastName: "Doe", role: ForemanRole}, Salary: pgtype.Int4{Int32: 2000, Valid: true}},
	}

	for _, pers := range persons {
		if err := pers.Save(context.Background(), tx); err != nil {
			t.Fatalf("Failed to add person: %v", err)
		}
	}

}
