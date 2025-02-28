CREATE TYPE person_role as ENUM ('manager', 'master', 'foreman', 'driver', 'technician', 'welder', 'assembler', 'plumber');
CREATE TYPE transport_transaction_type AS ENUM ('purchase', 'sale', 'write-off');
CREATE TYPE garage_facility_type AS ENUM ('attached garage', 'detached garage', 'carport');
CREATE TYPE transport_type AS ENUM ('taxi', 'bus', 'trolleybus', 'tram', 'truck');
create type repair_work_state as enum ('not started', 'in progress', 'finished');
CREATE TYPE trip_type AS ENUM ('cargo', 'passenger');