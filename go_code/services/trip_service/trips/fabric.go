package trips

import (
	pb "AutoEnterpise/go_code/generated/trips"
	types "AutoEnterpise/go_code/types/route"
	"context"
	"errors"
	"github.com/jackc/pgx/v5/pgxpool"
	"sync"
)

type TripControllerFabric struct {
	dbpool  *pgxpool.Pool
	mapping map[types.TypeOfTrip]Controller
}

func NewTripControllerFabric(dbpool *pgxpool.Pool) *TripControllerFabric {
	var mapping = map[types.TypeOfTrip]Controller{
		types.CargoType:     NewCargoTripController(dbpool),
		types.PassengerType: NewPassengersTripController(dbpool),
	}

	return &TripControllerFabric{
		dbpool:  dbpool,
		mapping: mapping,
	}
}

func (c *TripControllerFabric) Create(ctx context.Context, trip *pb.Trip) error {
	cnt, ok := c.mapping[types.TypeOfTrip(trip.GetType())]
	if !ok {
		return errors.New("there is no controller for this role: %s" + trip.GetType())
	}
	return cnt.Create(ctx, trip)
}

func (c *TripControllerFabric) Alter(ctx context.Context, trip *pb.Trip) error {
	cnt, ok := c.mapping[types.TypeOfTrip(trip.GetType())]
	if !ok {
		return errors.New("there is no controller for this role: %s" + trip.GetType())
	}
	return cnt.Alter(ctx, trip)
}

func (c *TripControllerFabric) selectTrip(ctx context.Context, filter *pb.TripFilter) ([]*pb.Trip, error) {
	var wg sync.WaitGroup
	resChan := make(chan []*pb.Trip, len(c.mapping))
	errChan := make(chan error, len(c.mapping))

	for _, collector := range c.mapping {
		wg.Add(1)
		go func(c Controller) {
			defer wg.Done()
			var persons []*pb.Trip
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

	res := make([]*pb.Trip, 0)
	for persons := range resChan {
		res = append(res, persons...)
	}

	return res, nil
}

func (c *TripControllerFabric) All(ctx context.Context) ([]*pb.Trip, error) {
	return c.selectTrip(ctx, nil)
}

func (c *TripControllerFabric) Filtered(ctx context.Context, filter *pb.TripFilter) ([]*pb.Trip, error) {
	return c.selectTrip(ctx, filter)
}
