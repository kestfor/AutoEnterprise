package transport

type FacilityType string

const (
	AttachedGarage FacilityType = "attached garage"
	DetachedGarage FacilityType = "detached garage"
	Carport        FacilityType = "carport"
)

type GarageFacility struct {
	ID      int          `db:"id"`
	Type    FacilityType `db:"type"`
	Name    string       `db:"name"`
	Address string       `db:"address"`
}
