package fabric

import (
	pb "AutoEnterpise/go_code/generated/person"
	"AutoEnterpise/go_code/services/person_service/controllers"
	. "AutoEnterpise/go_code/services/person_service/controllers/main_persons"
	. "AutoEnterpise/go_code/services/person_service/controllers/service_personnel"
	types "AutoEnterpise/go_code/types/person"
	"context"
	"errors"
	"github.com/jackc/pgx/v5/pgxpool"
	"sync"
)

type PersonControllerFabric struct {
	dbpool  *pgxpool.Pool
	mapping map[types.Role]controllers.Controller
}

func NewPersonControllerFabric(dbpool *pgxpool.Pool) *PersonControllerFabric {
	var mapping = map[types.Role]controllers.Controller{
		types.ManagerRole: NewManagerController(dbpool),
		types.DriverRole:  NewDriverController(dbpool),
		types.ForemanRole: NewForemanController(dbpool),
		types.MasterRole:  NewMasterController(dbpool),

		types.WelderRole:     NewWelderController(dbpool),
		types.TechnicianRole: NewTechnicianController(dbpool),
		types.AssemblerRole:  NewAssemblerController(dbpool),
		types.PlumberRole:    NewPlumberController(dbpool),
	}

	return &PersonControllerFabric{dbpool: dbpool, mapping: mapping}
}

func (c *PersonControllerFabric) Create(ctx context.Context, person *pb.Person) error {
	cnt, ok := c.mapping[types.Role(person.GetRole())]
	if !ok {
		return errors.New("there is no controller for this role: %s" + person.GetRole())
	}
	return cnt.Create(ctx, person)
}

func (c *PersonControllerFabric) Alter(ctx context.Context, person *pb.Person) error {
	cnt, ok := c.mapping[types.Role(person.GetRole())]
	if !ok {
		return errors.New("there is no controller for this role: %s" + person.GetRole())
	}

	return cnt.Alter(ctx, person)
}

func (c *PersonControllerFabric) selectPersons(ctx context.Context, filter *pb.PersonFilter, filteredControllers []controllers.Controller) ([]*pb.Person, error) {
	var wg sync.WaitGroup
	resChan := make(chan []*pb.Person, len(filteredControllers))
	errChan := make(chan error, len(filteredControllers))

	for _, collector := range filteredControllers {
		wg.Add(1)
		go func(c controllers.Controller) {
			defer wg.Done()
			var err error
			var persons []*pb.Person
			if filter != nil {
				persons, err = c.Filtered(ctx, filter)
			} else {
				persons, err = c.All(ctx)
			}
			if err != nil {
				errChan <- err
				return
			}
			resChan <- persons
		}(collector)
	}

	wg.Wait()
	close(resChan)
	close(errChan)

	if len(errChan) > 0 {
		return nil, <-errChan
	}

	res := make([]*pb.Person, 0)
	for persons := range resChan {
		res = append(res, persons...)
	}

	return res, nil
}

func (c *PersonControllerFabric) All(ctx context.Context) ([]*pb.Person, error) {
	cnts := make([]controllers.Controller, 0, len(c.mapping))
	for _, cnt := range c.mapping {
		cnts = append(cnts, cnt)
	}
	return c.selectPersons(ctx, nil, cnts)
}

func (c *PersonControllerFabric) AllByRoles(ctx context.Context) (map[types.Role][]*pb.Person, error) {
	cnts := make([]controllers.Controller, 0, len(c.mapping))
	for _, cnt := range c.mapping {
		cnts = append(cnts, cnt)
	}
	persons, err := c.selectPersons(ctx, nil, cnts)
	if err != nil {
		return nil, err
	}

	res := make(map[types.Role][]*pb.Person)
	for _, person := range persons {
		res[types.Role(person.GetRole())] = append(res[types.Role(person.GetRole())], person)
	}

	return res, nil
}

func (c *PersonControllerFabric) Filtered(ctx context.Context, filter *pb.PersonFilter) ([]*pb.Person, error) {
	cnts := make([]controllers.Controller, 0, len(c.mapping))
	if len(filter.GetRoles()) == 0 {
		for _, cnt := range c.mapping {
			cnts = append(cnts, cnt)
		}
		return c.selectPersons(ctx, filter, cnts)
	}

	for _, role := range filter.GetRoles() {
		if cnt, ok := c.mapping[types.Role(role.String())]; !ok {
			return nil, errors.New("there is no controller for this role: " + role.String())
		} else {
			cnts = append(cnts, cnt)
		}
	}

	return c.selectPersons(ctx, filter, cnts)
}
