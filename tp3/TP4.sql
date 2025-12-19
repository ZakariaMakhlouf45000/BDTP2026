--1 les client n'ayant fait aucune reservation aucun voyage
select id, Nom, Prenom
from CLIENTS
where id not in (select id from RESERVATIONS);


--1 les client n'ayant fait aucune reservation aucun voyage
select id, Nom, Prenom
from CLIENTS
where id not in (select id from RESERVATIONS);