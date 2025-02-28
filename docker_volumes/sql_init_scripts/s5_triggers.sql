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


CREATE TRIGGER person_role_change_trigger_before
    BEFORE UPDATE OF role ON person
    FOR EACH ROW
    WHEN (OLD.role IS DISTINCT FROM NEW.role)
EXECUTE FUNCTION handle_role_change_before();

create TRIGGER person_role_change_trigger_after
    AFTER UPDATE OF role ON person
    FOR EACH ROW
    WHEN (OLD.role IS DISTINCT FROM NEW.role)
EXECUTE FUNCTION handle_role_change_after();
