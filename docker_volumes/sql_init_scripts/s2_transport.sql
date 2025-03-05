create table garage_facility
(
    id      serial primary key,
    type    garage_facility_type not null,
    name    varchar(255),
    address varchar(255)
);

create table transport
(
    id                 serial primary key,
    name               varchar(255)   not null,
    licence_plate      varchar(20)    not null unique,
    type               transport_type not null,
    garage_facility_id int,
    brand              varchar(255),
    constraint unique_transport unique (id, type),
    foreign key (garage_facility_id) references garage_facility (id) on delete set null
);


create table truck
(
    transport_id        int primary key ,
    type                transport_type default 'truck' check ( type = 'truck'),
    cargo_capacity_kg   DECIMAL(10, 2),
    fuel_consumption    DECIMAL(10, 2),
    truck_type          VARCHAR(50),
    years_of_manufacture INT,
    constraint unique_truck unique (transport_id, type),
    foreign key (transport_id, type) references transport (id, type) on delete cascade
);

create table bus
(
    transport_id   int primary key ,
    passengers_num int,
    type           transport_type default 'bus' check ( type = 'bus'),
    constraint unique_bus unique (transport_id, type),
    foreign key (transport_id, type) references transport (id, type) on delete cascade
);

create table taxi
(
    transport_id        int primary key ,
    is_available        BOOLEAN,
    years_of_manufacture INT,
    type                transport_type default 'taxi' check ( type = 'taxi'),
    constraint unique_taxi unique (transport_id, type),
    foreign key (transport_id, type) references transport (id, type) on delete cascade
);

create table tram
(
    transport_id        int primary key ,
    passengers_num       int,
    years_of_manufacture INT,
    is_operational      BOOLEAN,
    type                transport_type default 'tram' check ( type = 'tram'),
    constraint unique_tram unique (transport_id, type),
    foreign key (transport_id, type) references transport (id, type) on delete cascade
);

create table trolleybus
(
    transport_id        int primary key ,
    passengers_num       int,
    years_of_manufacture INT,
    is_operational      BOOLEAN,
    type                transport_type default 'trolleybus' check ( type = 'trolleybus'),
    constraint unique_trolleybus unique (transport_id, type),
    foreign key (transport_id, type) references transport (id, type) on delete cascade
);