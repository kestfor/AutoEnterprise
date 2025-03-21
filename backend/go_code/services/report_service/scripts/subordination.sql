WITH service_personnell AS (SELECT id, plumber.brigade_id, person.first_name, person.last_name, person.role
                            FROM plumber
                                     left join person on plumber.person_id = person.id
                            UNION ALL
                            SELECT id, welder.brigade_id, person.first_name, person.last_name, person.role
                            FROM welder
                                     left join person on welder.person_id = person.id
                            UNION ALL
                            SELECT id, assembler.brigade_id, person.first_name, person.last_name, person.role
                            FROM assembler
                                     left join person on assembler.person_id = person.id
                            UNION ALL
                            SELECT id, technician.brigade_id, person.first_name, person.last_name, person.role
                            FROM technician
                                     left join person on technician.person_id = person.id
                            UNION ALL
                            SELECT id, driver.brigade_id, person.first_name, person.last_name, person.role
                            FROM driver
                                     left join person on driver.person_id = person.id),

     brig_subordination As (SELECT f.id                                   as foreman_id,
                                   concat(f.first_name, ' ', f.last_name) as foreman_name,
                                   brigade.name                           as brigade_name,
                                   concat(service_personnell.first_name, ' ',
                                          service_personnell.last_name)   as service_personnell_name,
                                   service_personnell.id                  as service_personnell_id,
                                   service_personnell.role                as service_personnell_role
                            from service_personnell
                                     left join brigade on brigade.id = service_personnell.brigade_id
                                     left join person as f on f.id = brigade.foreman_id),

     manager_subordination AS (SELECT person.id                                        as manager_id,
                                      concat(person.first_name, ' ', person.last_name) as manager_name,
                                      master.person_id                                 as master_id,
                                      concat(master.first_name, ' ', master.last_name) as master_name

                               from manager
                                        left join person on manager.person_id = person.id
                                        inner join
                                    (select *
                                     from master
                                              left join person on master.person_id = person.id)
                                        as master on manager.person_id = master.manager_id),


     master_subordination AS (SELECT person.id                                        as master_id,
                                     concat(person.first_name, ' ', person.last_name) as master_name,
                                     f.person_id                                      as foreman_id,
                                     concat(f.first_name, ' ', f.last_name)           as foreman_name

                              from master
                                       left join person on master.person_id = person.id
                                       left join (select *
                                                  from foreman
                                                           left join person on foreman.person_id = person.id)
                                  as f on f.master_id = master.person_id)

SELECT brig_subordination.service_personnell_id,
       brig_subordination.service_personnell_name,
       brig_subordination.service_personnell_role,
       brig_subordination.foreman_id,
       brig_subordination.foreman_name,
       master_subordination.master_id,
       master_subordination.master_name,
       manager_subordination.manager_id,
       manager_subordination.manager_name
from brig_subordination
         left join master_subordination on brig_subordination.foreman_id = master_subordination.foreman_id
         left join manager_subordination on master_subordination.master_id = manager_subordination.master_id;






