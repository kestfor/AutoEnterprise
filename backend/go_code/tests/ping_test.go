package tests

import (
	"AutoEnterpise/go_code/utils"
	"context"
	"testing"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
)

func TestPingDatabase(t *testing.T) {

	config := utils.GetConfig("../../.env")
	dsn := config.DSN()
	dbpool, err := pgxpool.New(context.Background(), dsn)
	if err != nil {
		t.Fatalf("Failed to create connection pool: %v", err)
	}
	defer dbpool.Close()

	ctx, cancel := context.WithTimeout(context.Background(), 3*time.Second)
	defer cancel()

	if err := dbpool.Ping(ctx); err != nil {
		t.Fatalf("Database ping failed: %v", err)
	}
}
