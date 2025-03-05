create table transport_operation
(
    id           serial primary key,
    type         transport_transaction_type not null,
    date         timestamp                  not null,
    description  text,
    transport_id int,
    foreign key (transport_id) REFERENCES transport (id) on delete set null
);



create table route
(
    id   serial unique not null,
    name varchar(255)  not null,
    PRIMARY KEY (id)
);

create table transport_on_route
(
    transport_id int,
    route_id     int,
    PRIMARY KEY (transport_id, route_id),
    foreign key (transport_id) references transport on delete cascade,
    foreign key (route_id) references route on delete cascade
);

create table trip
(
    id           serial primary key,
    route_id     int            not null,
    driver_id    int            not null,
    transport_id int            not null,
    start_time   timestamp      not null,
    end_time     timestamp      not null,
    type         trip_type      not null,
    distance     DECIMAL(10, 2) null,
    constraint unique_trip unique (id, type),
    foreign key (driver_id) REFERENCES person on delete set null,
    foreign key (transport_id) references transport on delete set null,
    foreign key (route_id) references route on delete set null
);

create table transport_unit
(
    id          serial unique,
    name        varchar(255) primary key,
    description text,
    type        varchar(255)
);

create table repair_work
(
    id                   serial primary key,
    start_time           timestamp,
    end_time             timestamp,
    transport_id         int               not null,
    service_personnel_id int               not null,
    unit_id              int               not null,
    description          text,
    repair_cost          DECIMAL(10, 2)    not null,
    state                repair_work_state not null,
    foreign key (unit_id) references transport_unit (id) on delete set null,
    foreign key (transport_id) references transport on delete set null,
    foreign key (service_personnel_id) references person on delete set null
);

create table trip_info_passenger
(
    trip_id        int primary key,
    passengers_num int            not null,
    type           trip_type default 'passenger' check ( type = 'passenger'),
    constraint unique_trip_info_passenger unique (trip_id, type),
    foreign key (trip_id, type) references trip (id, type) on delete cascade
);

create table trip_info_cargo
(
    trip_id      int primary key default -1,
    cargo_name   varchar(255)   not null,
    cargo_type   varchar(255)   not null,
    cargo_cost   DECIMAL(10, 2) not null,
    cargo_weight DECIMAL(10, 2) not null,
    type         trip_type default 'cargo' check ( type = 'cargo'),
    constraint unique_trip_info_cargo unique (trip_id, type),
    foreign key (trip_id, type) references trip (id, type) on delete cascade
);
