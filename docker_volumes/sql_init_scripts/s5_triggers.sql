CREATE OR REPLACE FUNCTION handle_role_change_after()
    RETURNS TRIGGER AS
$$
DECLARE
    table_name Text := NEW.role;
BEGIN
    EXECUTE format('INSERT INTO %I (person_id, role) VALUES ($1, $2)', table_name)
        USING NEW.id, New.role;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION handle_role_change_before()
    RETURNS TRIGGER AS
$$
DECLARE
    oldRoleTable TEXT := OLD.role;
BEGIN
    EXECUTE format('DELETE FROM %I WHERE person_id = $1', oldRoleTable)
        USING OLD.id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION handle_transport_type_change_after()
    RETURNS TRIGGER AS
$$
DECLARE
    table_name Text := NEW.type;
BEGIN
    EXECUTE format('INSERT INTO %I (transport_id, type) VALUES ($1, $2)', table_name)
        USING NEW.id, New.type;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION handle_transport_type_change_before()
    RETURNS TRIGGER AS
$$
DECLARE
    table_name_for_delete text := OLD.type;
BEGIN
    EXECUTE format('DELETE FROM %I WHERE transport_id = $1', table_name_for_delete)
        USING OLD.id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION handle_trip_type_change_before()
    RETURNS TRIGGER AS
$$
DECLARE
    table_name_for_delete text := 'trip_info_' || (cast(OLD.type as text));
BEGIN
    EXECUTE format('DELETE FROM %I WHERE trip_id = $1', table_name_for_delete)
        USING OLD.id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION handle_trip_type_change_after()
    RETURNS TRIGGER AS
$$
DECLARE
    table_name Text := 'trip_info_' || (cast(OLD.type as text));
BEGIN
    EXECUTE format('INSERT INTO %I (trip_id, type) VALUES ($1, $2)', table_name)
        USING NEW.id, New.type;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER person_role_change_trigger_before
    BEFORE UPDATE OF role
    ON person
    FOR EACH ROW
    WHEN (OLD.role IS DISTINCT FROM NEW.role)
EXECUTE FUNCTION handle_role_change_before();

create TRIGGER person_role_change_trigger_after
    AFTER UPDATE OF role
    ON person
    FOR EACH ROW
    WHEN (OLD.role IS DISTINCT FROM NEW.role)
EXECUTE FUNCTION handle_role_change_after();

CREATE TRIGGER transport_type_change_trigger_before
    before UPDATE OF type
    ON transport
    FOR EACH ROW
    WHEN (OLD.type IS DISTINCT FROM NEW.type)
EXECUTE FUNCTION handle_transport_type_change_before();

CREATE TRIGGER transport_type_change_trigger_after
    after UPDATE OF type
    ON transport
    FOR EACH ROW
    WHEN (OLD.type IS DISTINCT FROM NEW.type)
EXECUTE FUNCTION handle_transport_type_change_after();

CREATE TRIGGER trip_type_change_trigger_before
    before UPDATE OF type
    ON trip
    FOR EACH ROW
    WHEN (OLD.type IS DISTINCT FROM NEW.type)
EXECUTE FUNCTION handle_trip_type_change_before();

CREATE TRIGGER trip_type_change_trigger_after
    after UPDATE OF type
    ON trip
    FOR EACH ROW
    WHEN (OLD.type IS DISTINCT FROM NEW.type)
EXECUTE FUNCTION handle_trip_type_change_after();