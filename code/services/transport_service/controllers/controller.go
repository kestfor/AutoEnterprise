package controllers

import (
	pb "AutoEnterpise/code/generated/transport"
	"context"
	"github.com/jackc/pgx/v5"
)

type SuperType interface {
	CreateBasic(tx pgx.Tx, ctx context.Context, person *pb.Transport) error
	CreateInfo(tx pgx.Tx, ctx context.Context, person *pb.Transport) error
	AlterInfo(tx pgx.Tx, ctx context.Context, person *pb.Transport) error
	AlterBasic(tx pgx.Tx, ctx context.Context, person *pb.Transport) error
	CreateWrapper(superType SuperType, ctx context.Context, person *pb.Transport) error
	AlterWrapper(superType SuperType, ctx context.Context, person *pb.Transport) error
}

type Creater interface {
	Create(ctx context.Context, person *pb.Transport) error
}

type Alterer interface {
	Alter(ctx context.Context, person *pb.Transport) error
}

type Getter interface {
	All(ctx context.Context) ([]*pb.Transport, error)
	Filtered(ctx context.Context, filter *pb.TransportFilter) ([]*pb.Transport, error)
}

type Controller interface {
	Creater
	Alterer
	Getter
}
