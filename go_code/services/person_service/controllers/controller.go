package controllers

import (
	pb "AutoEnterpise/go_code/generated/person"
	"context"
	"github.com/jackc/pgx/v5"
)

type SuperType interface {
	CreateBasic(tx pgx.Tx, ctx context.Context, person *pb.Person) error
	CreateInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error
	AlterInfo(tx pgx.Tx, ctx context.Context, person *pb.Person) error
	AlterBasic(tx pgx.Tx, ctx context.Context, person *pb.Person) error
	CreateWrapper(superType SuperType, ctx context.Context, person *pb.Person) error
	AlterWrapper(superType SuperType, ctx context.Context, person *pb.Person) error
}

type Creater interface {
	Create(ctx context.Context, person *pb.Person) error
}

type Alterer interface {
	Alter(ctx context.Context, person *pb.Person) error
}

type Getter interface {
	All(ctx context.Context) ([]*pb.Person, error)
	Filtered(ctx context.Context, filter *pb.PersonFilter) ([]*pb.Person, error)
}

type Controller interface {
	Creater
	Alterer
	Getter
}
