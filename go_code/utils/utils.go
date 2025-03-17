package utils

import "fmt"

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
