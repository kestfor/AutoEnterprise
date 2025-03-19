create view active_transport as
select *
from transport
where transport.active = true;

