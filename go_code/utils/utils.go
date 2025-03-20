package utils

import (
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
)

func JoinStrings(arr []string, sep string) string {
	result := ""
	for i, s := range arr {
		if i > 0 {
			result += sep
		}
		result += s
	}
	return result
}

func AddWhereClauses(query string, whereClauses []string) string {
	if len(whereClauses) > 0 {
		query += " WHERE " + fmt.Sprintf("%s", JoinStrings(whereClauses, " AND "))
	}
	return query
}

func DeleteByIds(ctx context.Context, pool *pgxpool.Pool, ids []int32, table string) error {
	if len(ids) == 0 {
		return nil
	}

	args := pgx.NamedArgs{"ids": ids, "tableName": table}
	query := "delete from @tableName where person.id=ANY(@ids)"

	_, err := pool.Exec(ctx, query, args)
	return err
}
