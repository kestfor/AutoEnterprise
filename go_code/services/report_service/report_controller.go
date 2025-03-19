package report_service

import (
	pb "AutoEnterpise/go_code/generated/person"
	. "AutoEnterpise/go_code/generated/report"
	"AutoEnterpise/go_code/services/person_service/controllers/main_persons"
	"AutoEnterpise/go_code/types/person"
	"AutoEnterpise/go_code/types/transport"
	"AutoEnterpise/go_code/utils"
	"context"
	"errors"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
	"os"
	"path"
	"runtime"
)

type ReportController struct {
	DBPool *pgxpool.Pool
}

func NewReportController(DBPool *pgxpool.Pool) *ReportController {
	return &ReportController{DBPool: DBPool}
}

func (r *ReportController) GetDriversByTransport(ctx context.Context, transportId int32) ([]*pb.Person, error) {
	driverController := main_persons.NewDriverController(r.DBPool)
	return driverController.GetByTransportId(ctx, transportId)
}

func (r *ReportController) GetCarMileage(ctx context.Context, req *CarMileageRequest) (map[string]float64, error) {
	var fst pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	var fet pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	if req.DateFrom != nil {
		fst = pgtype.Timestamp{Time: req.DateFrom.AsTime(), Valid: true}
	}
	if req.DateTo != nil {
		fet = pgtype.Timestamp{Time: req.DateTo.AsTime(), Valid: true}
	}

	whereClauses := make([]string, 0)
	var query = "select transport.name, transport.brand, transport.licence_plate, distance  from trip inner join active_transport as transport on trip.transport_id = transport.id"
	args := pgx.NamedArgs{}
	if fst.Valid {
		whereClauses = append(whereClauses, "trip.start_time >= @dateFrom")
		args["dateFrom"] = fst
	}
	if fet.Valid {
		whereClauses = append(whereClauses, "trip.end_time <= @dateTo")
		args["dateTo"] = fet
	}

	if req.TransportId != nil {
		whereClauses = append(whereClauses, "transport.id = @id")
		args["id"] = req.TransportId
	} else if req.Category != nil {
		whereClauses = append(whereClauses, "transport.type = @type")
		args["type"] = req.Category
	}

	var transportName pgtype.Text
	var brand pgtype.Text
	var licensePlate pgtype.Text
	var distance pgtype.Float8

	rows, err := r.DBPool.Query(ctx, query, args)
	if err != nil {
		return nil, err
	}

	mapping := make(map[string]float64)

	_, err = pgx.ForEachRow(rows, []any{&transportName, &brand, &licensePlate, &distance}, func() error {
		tr := transportName.String
		if brand.Valid {
			tr += " " + brand.String
		}
		if licensePlate.Valid {
			tr += " " + licensePlate.String
		}
		var d float64
		if distance.Valid {
			d = distance.Float64
		} else {
			d = 0
		}
		mapping[tr] = d
		return nil
	})

	return mapping, err
}

type Pair[T1 any, T2 any] struct {
	First  T1
	Second T2
}

func (r *ReportController) GetRepairCosts(ctx context.Context, req *RepairCostRequest) (map[string]Pair[int, float64], error) {
	var fst pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	var fet pgtype.Timestamp = pgtype.Timestamp{Valid: false}
	if req.DateFrom != nil {
		fst = pgtype.Timestamp{Time: req.DateFrom.AsTime(), Valid: true}
	}
	if req.DateTo != nil {
		fet = pgtype.Timestamp{Time: req.DateTo.AsTime(), Valid: true}
	}

	var query = "select transport.id, transport.name, transport.brand, transport.licence_plate, sum(repair_cost), count(repair_cost) from repair_work inner join active_transport as transport on transport.id = repair_work.transport_id"
	whereClauses := make([]string, 0)
	args := pgx.NamedArgs{}
	if fst.Valid {
		whereClauses = append(whereClauses, "repair_work.start_time >= @dateFrom")
		args["dateFrom"] = fst
	}
	if fet.Valid {
		whereClauses = append(whereClauses, "repair_work.end_time <= @dateTo")
		args["dateTo"] = fet
	}
	if req.TransportId != nil {
		whereClauses = append(whereClauses, "transport.id = @id")
		args["id"] = req.TransportId

	} else if req.Brand != nil {
		whereClauses = append(whereClauses, "transport.brand = @brand")
		args["brand"] = req.Brand
	} else if req.Category != nil {
		whereClauses = append(whereClauses, "transport.type = @type")
		args["type"] = req.Category
	}
	query = utils.AddWhereClauses(query, whereClauses)
	query += " group by transport.id, transport.name, transport.brand, transport.licence_plate"

	rows, err := r.DBPool.Query(ctx, query, args)
	if err != nil {
		return nil, err
	}

	var transportId pgtype.Int4
	var transportName pgtype.Text
	var brand pgtype.Text
	var licensePlate pgtype.Text
	var cost pgtype.Float8
	var count pgtype.Int4

	mapping := make(map[string]Pair[int, float64])
	_, err = pgx.ForEachRow(rows, []any{&transportId, &transportName, &brand, &licensePlate, &cost, &count}, func() error {
		tr := transportName.String
		if brand.Valid {
			tr += " " + brand.String
		}
		if licensePlate.Valid {
			tr += " " + licensePlate.String
		}
		var totalCount int
		if count.Valid {
			totalCount = int(count.Int32)
		} else {
			totalCount = 0
		}
		var totalCost float64
		if cost.Valid {
			totalCost = cost.Float64
		} else {
			totalCost = 0
		}

		mapping[tr] = Pair[int, float64]{First: totalCount, Second: totalCost}
		return nil
	})
	return mapping, err
}

func (r *ReportController) GetDriversDistribution(ctx context.Context) (map[string]string, error) {
	query := "select person.first_name, person.last_name, transport.name, transport.brand, transport.licence_plate from driver left join person on driver.person_id = person.id left join active_transport as transport on driver.transport_id = transport.id"
	rows, err := r.DBPool.Query(ctx, query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var firstName pgtype.Text
	var lastName pgtype.Text
	var transportName pgtype.Text
	var brand pgtype.Text
	var licensePlate pgtype.Text

	resultMap := make(map[string]string)

	_, err = pgx.ForEachRow(rows, []any{&firstName, &lastName, &transportName, &brand, &licensePlate}, func() error {
		driver := firstName.String + " " + lastName.String
		var tr = transportName.String
		if brand.Valid {
			tr += " " + brand.String
		}
		if licensePlate.Valid {
			tr += " " + licensePlate.String
		}
		resultMap[driver] = tr
		return nil
	})
	return resultMap, err
}

func (r *ReportController) GetPassengerTransportDistribution(ctx context.Context) (map[string]string, error) {
	passengerTransport := []string{string(transport.BusType), string(transport.TaxiType), string(transport.TramType), string(transport.TrolleybusType)}
	args := pgx.NamedArgs{
		"types": passengerTransport,
	}
	query := "select transport.name, transport.brand, transport.licence_plate, route.name from transport_on_route inner join route on route.id = transport_on_route.route_id inner join active_transport as transport on transport.id = transport_on_route.transport_id where transport.type = any(@types)"
	rows, err := r.DBPool.Query(ctx, query, args)
	var transportName pgtype.Text
	var brand pgtype.Text
	var licensePlate pgtype.Text
	var routeName pgtype.Text

	mapping := make(map[string]string)

	_, err = pgx.ForEachRow(rows, []any{&transportName, &brand, &licensePlate, &routeName}, func() error {
		tr := transportName.String
		route := routeName.String
		if brand.Valid {
			tr += " " + brand.String
		}
		if licensePlate.Valid {
			tr += " " + licensePlate.String
		}
		mapping[tr] = route
		return nil
	})
	return mapping, err
}

func (r *ReportController) GetSubordination(ctx context.Context, filter *SubordinationRequest_Filter) ([]*Subordination, error) {
	_, filename, _, ok := runtime.Caller(1)
	if !ok {
		return nil, errors.New("failed to get the current file path")
	}

	filepath := path.Join(path.Dir(filename), "/scripts/subordination.sql")

	bytes, err := os.ReadFile(filepath)
	if err != nil {
		return nil, err
	}

	query := string(bytes)
	rows, err := r.DBPool.Query(ctx, query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var servicePersonId pgtype.Int4
	var servicePersonName pgtype.Text
	var servicePersonRole pgtype.Text
	var foremanId pgtype.Int4
	var foremanName pgtype.Text
	var masterId pgtype.Int4
	var masterName pgtype.Text
	var managerId pgtype.Int4
	var managerName pgtype.Text

	foremans := make(map[int32]*Subordination)
	masters := make(map[int32]*Subordination)
	managers := make(map[int32]*Subordination)
	plug := make(map[int32]*Subordination)

	_, err = pgx.ForEachRow(rows, []any{&servicePersonId, &servicePersonName, &servicePersonRole, &foremanId, &foremanName, &masterId, &masterName, &managerId, &managerName}, func() error {
		if !managerId.Valid {
			return nil
		}

		managerSub, ok := managers[managerId.Int32]

		if !ok {
			managerSub = &Subordination{PersonId: managerId.Int32, PersonName: managerName.String, Subordinates: []*Subordination{}, Role: "manager"}
			managers[managerId.Int32] = managerSub
		}

		if masterId.Valid || filter != nil {
			masterSub := processSub(managerSub, masters, masterId.Int32, masterName.String, "master")

			if foremanId.Valid || filter != nil {
				foremanSub := processSub(masterSub, foremans, foremanId.Int32, foremanName.String, "foreman")
				processSub(foremanSub, plug, servicePersonId.Int32, servicePersonName.String, servicePersonRole.String)
			}

		}

		return nil
	})

	if filter == nil {
		res := make([]*Subordination, 0, len(managers))
		for _, manager := range managers {
			res = append(res, manager)
		}
		return res, nil
	} else {

		returnIfFound := func(id int32, data map[int32]*Subordination) []*Subordination {
			found, ok := data[id]
			if ok {
				return []*Subordination{found}
			} else {
				return []*Subordination{}
			}
		}

		id := filter.PersonId
		role := filter.PersonRole

		switch role {
		case string(person.ManagerRole):
			return returnIfFound(id, managers), nil
		case string(person.MasterRole):
			return returnIfFound(id, masters), nil
		case string(person.ForemanRole):
			return returnIfFound(id, foremans), nil
		default:
			return returnIfFound(id, plug), nil

		}

	}
}

func processSub(main *Subordination, subs map[int32]*Subordination, id int32, name string, role string) *Subordination {
	var sub *Subordination

	sub, ok := subs[id]
	if !ok {
		sub = &Subordination{PersonId: id, PersonName: name, Subordinates: make([]*Subordination, 0), Role: role}
		subs[id] = sub
	}

	var oldSub *Subordination = nil
	if main != nil {
		main.Subordinates, oldSub = addIfNotIn(main.Subordinates, sub)
	}
	if oldSub != nil {
		return oldSub
	} else {
		return sub
	}
}

func addIfNotIn(subs []*Subordination, new *Subordination) (newList []*Subordination, old *Subordination) {
	for _, sub := range subs {
		if sub.PersonId == new.PersonId {
			return subs, sub
		}
	}
	return append(subs, new), nil
}

func (r *ReportController) Transport2GarageMapping(ctx context.Context) (map[string]string, error) {
	query := "SELECT replace(concat(transport.name, ' ', transport.brand, ' ', transport.licence_plate), '  ', ' '), replace(concat(garage_facility.name, ' ', garage_facility.address), '  ', ' ') FROM active_transport as transport left join garage_facility on transport.garage_facility_id = garage_facility.id"
	var transportName pgtype.Text
	var garageName pgtype.Text
	rows, err := r.DBPool.Query(ctx, query)
	if err != nil {
		return nil, err
	}

	mapping := make(map[string]string)
	_, err = pgx.ForEachRow(rows, []any{&transportName, &garageName}, func() error {
		mapping[transportName.String] = garageName.String
		return nil
	})

	return mapping, nil
}
