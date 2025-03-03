package fabric

import (
	pb "AutoEnterpise/go_code/generated/transport"
	"AutoEnterpise/go_code/services/transport_service/controllers"
	. "AutoEnterpise/go_code/services/transport_service/controllers/transport_types"
	types "AutoEnterpise/go_code/types/transport"
	"context"
	"errors"
	"github.com/jackc/pgx/v5/pgxpool"
	"sync"
)

type TransportControllerFabric struct {
	dbpool  *pgxpool.Pool
	mapping map[types.TypeOfTransport]controllers.Controller
}

func NewTransportControllerFabric(dbpool *pgxpool.Pool) *TransportControllerFabric {
	var mapping = map[types.TypeOfTransport]controllers.Controller{
		types.TruckType:      NewTruckController(dbpool),
		types.BusType:        NewBusController(dbpool),
		types.TramType:       NewTramController(dbpool),
		types.TrolleybusType: NewTrolleybusController(dbpool),
		types.TaxiType:       NewTaxiController(dbpool),
	}

	return &TransportControllerFabric{dbpool: dbpool, mapping: mapping}
}

func (c *TransportControllerFabric) Create(ctx context.Context, person *pb.Transport) error {
	cnt, ok := c.mapping[types.TypeOfTransport(person.GetType())]
	if !ok {
		return errors.New("there is no controller for this role: %s" + person.GetType())
	}
	return cnt.Create(ctx, person)
}

func (c *TransportControllerFabric) Alter(ctx context.Context, person *pb.Transport) error {
	cnt, ok := c.mapping[types.TypeOfTransport(person.GetType())]
	if !ok {
		return errors.New("there is no controller for this role: %s" + person.GetType())
	}

	return cnt.Alter(ctx, person)
}

func (c *TransportControllerFabric) selectTransport(ctx context.Context, filter *pb.TransportFilter) ([]*pb.Transport, error) {
	var wg sync.WaitGroup
	resChan := make(chan []*pb.Transport, len(c.mapping))
	errChan := make(chan error, len(c.mapping))

	for _, collector := range c.mapping {
		wg.Add(1)
		go func(c controllers.Controller) {
			defer wg.Done()
			var persons []*pb.Transport
			var err error
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

	res := make([]*pb.Transport, 0)
	for persons := range resChan {
		res = append(res, persons...)
	}

	return res, nil
}

func (c *TransportControllerFabric) All(ctx context.Context) ([]*pb.Transport, error) {
	return c.selectTransport(ctx, nil)
}

func (c *TransportControllerFabric) Filtered(ctx context.Context, filter *pb.TransportFilter) ([]*pb.Transport, error) {
	return c.selectTransport(ctx, filter)
}
