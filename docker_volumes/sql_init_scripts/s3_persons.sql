create table person
(
    id           serial primary key,
    first_name   varchar(255) not null,
    last_name    varchar(255) not null,
    role         person_role  not null,
    birth_date   DATE,
    phone_number VARCHAR(15),
    email        VARCHAR(100),
    salary       DECIMAL(10, 2),
    constraint unique_person unique (id, role)
);

create table manager
(
    person_id                   int primary key,
    department                  VARCHAR(100),
    management_experience_years INT,
    role                        person_role default 'manager' check ( role = 'manager'),
    constraint unique_manager unique (person_id, role),
    foreign key (person_id, role) references person (id, role) on delete cascade
);

create table master
(
    person_id  int primary key,
    manager_id int,
    role       person_role default 'master' check ( role = 'master'),
    constraint unique_master unique (person_id, role),
    foreign key (person_id, role) references person (id, role) on delete cascade,
    foreign key (manager_id) REFERENCES manager (person_id) on delete set null
);

create table foreman
(
    person_id      int primary key,
    master_id      int,
    service_center VARCHAR(100),
    certification  VARCHAR(100),
    role           person_role default 'foreman' check ( role = 'foreman'),
    constraint unique_foreman unique (person_id, role),
    foreign key (person_id, role) references person (id, role) on delete cascade,
    foreign key (master_id) REFERENCES master (person_id) on delete set null
);

create table brigade
(
    id         serial primary key,
    name       varchar(255) not null unique,
    foreman_id int,
    foreign key (foreman_id) REFERENCES foreman on delete set null
);

create table driver
(
    person_id    int primary key,
    transport_id int,
    brigade_id   int,
    role         person_role default 'driver' check ( role = 'driver'),
    constraint unique_driver unique (person_id, role),
    foreign key (person_id, role) references person (id, role) on delete cascade,
    foreign key (brigade_id) REFERENCES brigade on delete set null,
    foreign key (transport_id) REFERENCES transport (id) on delete set null
);

create table technician
(
    person_id          int primary key,
    field_of_expertise VARCHAR(100),
    certification      VARCHAR(100),
    role               person_role default 'technician' check ( role = 'technician'),
    brigade_id         int,
    foreign key (brigade_id) REFERENCES brigade on delete set null,
    constraint unique_technician unique (person_id, role),
    foreign key (person_id, role) REFERENCES person (id, role) on delete cascade
);

create table welder
(
    person_id       int primary key,
    welding_type    VARCHAR(100),
    certification   VARCHAR(100),
    safety_training BOOLEAN,
    role            person_role default 'welder' check ( role = 'welder'),
    brigade_id      int,
    foreign key (brigade_id) REFERENCES brigade on delete set null,
    constraint unique_welder unique (person_id, role),
    foreign key (person_id, role) REFERENCES person (id, role) on delete cascade
);

create table assembler
(
    person_id        int primary key,
    experience_years INT,
    specialization   VARCHAR(100),
    certification    VARCHAR(100),
    role             person_role default 'assembler' check ( role = 'assembler'),
    brigade_id       int,
    foreign key (brigade_id) REFERENCES brigade on delete set null,
    constraint unique_assembler unique (person_id, role),
    foreign key (person_id, role) REFERENCES person (id, role) on delete cascade
);

create table plumber
(
    person_id       int primary key,
    specialization  VARCHAR(100),
    certification   VARCHAR(100),
    safety_training BOOLEAN,
    role            person_role default 'plumber' check ( role = 'plumber'),
    brigade_id      int,
    foreign key (brigade_id) REFERENCES brigade on delete set null,
    constraint unique_plumber unique (person_id, role),
    foreign key (person_id, role) REFERENCES person (id, role) on delete cascade
);
