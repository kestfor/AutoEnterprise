package person

type Brigade struct {
	ID        int `db:"id"`
	ForemanId int `db:"foreman_id"`
}
