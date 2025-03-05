package routes

import (
	pb "AutoEnterpise/go_code/generated/transport"
	"AutoEnterpise/go_code/services/transport_service/fabric"
	"context"
	"fmt"
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgtype"
	"github.com/jackc/pgx/v5/pgxpool"
	"log"
)

type RoutesController struct {
	DBPool *pgxpool.Pool
}

func NewRoutesController(DBPool *pgxpool.Pool) *RoutesController {
	return &RoutesController{DBPool: DBPool}
}

func (rc *RoutesController) addTransports(ctx context.Context, tx pgx.Tx, routeId int32, transports []int32) error {
	if len(transports) == 0 {
		return nil
	}

	batch := &pgx.Batch{}
	for _, r := range transports {
		batch.Queue("INSERT INTO transport_on_route (route_id, transport_id) VALUES ($1, $2)", routeId, r)
	}
	br := tx.SendBatch(ctx, batch)
	defer br.Close()
	for i := 0; i < len(transports); i++ {
		_, err := br.Exec()
		if err != nil {
			return err
		}
	}
	return nil
}

func (rc *RoutesController) Create(ctx context.Context, route *pb.Route) (*pb.Route, error) {
	tx, err := rc.DBPool.Begin(ctx)

	if err != nil {
		log.Println("Error in creating transaction")
		return nil, err
	}

	defer func() {
		if err != nil {
			tx.Rollback(ctx)
		}
	}()

	err = tx.QueryRow(context.Background(), "insert into route (name) values ($1) returning id", route.Name).Scan(&route.Id)
	if err != nil {
		log.Println("Error in getting nextval")
		return nil, err
	}

	ids := make([]int32, 0)
	for _, t := range route.Transport {
		ids = append(ids, *t.Id)
	}

	err = rc.addTransports(ctx, tx, *route.Id, ids)

	if err != nil {
		return nil, err
	}

	err = tx.Commit(ctx)

	return route, err
}

func (rc *RoutesController) Alter(ctx context.Context, route *pb.Route) (*pb.Route, error) {
	_, err := rc.DBPool.Exec(ctx, "UPDATE route SET name = $1 WHERE id = $2", route.Name, route.Id)
	if err != nil {
		return nil, err
	}
	return route, nil
}

func (rc *RoutesController) AddTransportToRoute(ctx context.Context, mr *pb.ModifyRouteRequest) error {
	tx, err := rc.DBPool.Begin(ctx)

	if err != nil {
		log.Println("Error in creating transaction")
		return err
	}

	defer func() {
		if err != nil {
			tx.Rollback(ctx)
		}
	}()

	fmt.Println(mr)

	err = rc.addTransports(ctx, tx, mr.Id, mr.TransportId)

	if err != nil {
		return err
	}

	err = tx.Commit(ctx)

	return err
}

func (rc *RoutesController) RemoveTransportFromRoute(ctx context.Context, mr *pb.ModifyRouteRequest) error {
	tx, err := rc.DBPool.Begin(ctx)

	if err != nil {
		log.Println("Error in creating transaction")
		return err
	}

	defer func() {
		if err != nil {
			tx.Rollback(ctx)
		}
	}()

	batch := &pgx.Batch{}
	for _, r := range mr.TransportId {
		batch.Queue("INSERT INTO transport_on_route (route_id, transport_id) VALUES ($1, $2)", mr.Id, r)
	}
	br := rc.DBPool.SendBatch(ctx, batch)
	defer br.Close()
	for i := 0; i < len(mr.TransportId); i++ {
		_, err := br.Exec()
		if err != nil {
			return err
		}
	}

	err = tx.Commit(ctx)

	return err
}

func (rc *RoutesController) selectRoutes(ctx context.Context, tx pgx.Tx, query string, args ...any) ([]*pb.Route, error) {
	rows, err := tx.Query(ctx, query, args...)
	if err != nil {
		return nil, err
	}

	routes := make([]*pb.Route, 0)
	var id pgtype.Int4
	var name pgtype.Text
	_, err = pgx.ForEachRow(rows, []any{&id, &name}, func() error {
		var idN = new(int32)
		*idN = id.Int32
		newRoute := &pb.Route{Id: idN, Name: name.String}
		routes = append(routes, newRoute)
		return nil
	})

	return routes, err
}

func (rc *RoutesController) GetAllRoutes(ctx context.Context) ([]*pb.Route, error) {
	tx, err := rc.DBPool.Begin(ctx)
	if err != nil {
		return nil, err
	}
	defer tx.Rollback(ctx)

	query := "SELECT id, name FROM route"
	routes, err := rc.selectRoutes(ctx, tx, query)
	if err != nil {
		return nil, err
	}

	transportFabric := fabric.NewTransportControllerFabric(rc.DBPool)
	for _, r := range routes {
		transports, err := transportFabric.Filtered(ctx, &pb.TransportFilter{RouteId: r.Id})
		if err != nil {
			return nil, err
		}
		r.Transport = transports
	}

	err = tx.Commit(ctx)
	return routes, err
}

func (rc *RoutesController) GetRouteByTransportId(ctx context.Context, transportId int32) (*pb.Route, error) {
	tx, err := rc.DBPool.Begin(ctx)
	if err != nil {
		return nil, err
	}
	defer tx.Rollback(ctx)

	args := pgx.NamedArgs{"transport_id": transportId}
	query := "SELECT id, name FROM route where id = (SELECT route_id FROM transport_on_route WHERE transport_id = @transport_id LIMIT 1)"
	routes, err := rc.selectRoutes(ctx, tx, query, args)
	if err != nil {
		return nil, err
	}

	transportFabric := fabric.NewTransportControllerFabric(rc.DBPool)
	for _, r := range routes {
		transports, err := transportFabric.Filtered(ctx, &pb.TransportFilter{RouteId: r.Id})
		if err != nil {
			return nil, err
		}
		r.Transport = transports
	}

	err = tx.Commit(ctx)
	if len(routes) == 0 {
		return nil, err
	} else {
		return routes[0], err
	}
}
