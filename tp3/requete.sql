-- 1. Lister les destinations propos´ees 
--`a partir de Paris.
--
select VilleArrivee
from VOYAGES
where VilleDepart = 'Paris';

--2. Lister tous les voyages pour Amsterdam.
select *
from VOYAGES
where VilleArrivee = 'Amsterdam';

-- 3. Lister les villes de d´epart, les dates et les heures 
--de d´epart pour tous les voyages pour Amsterdam

select VilleDepart, to_char(Depart,'DD/MM/YYYY') as jourDepart, to_char(Depart,'hh:mi') as heureDepart
from VOYAGES
where VilleArrivee = 'Amsterdam';

-- 4. Lister des noms des clients ayant une r´eservation en informant leur destination et le
-- prix du voyage. La r´eponse est en ordre alphab´etique du nom et un ordre d´ecroissante
-- de prix
select Nom, VilleArrivee as destination, prix
From CLIENTS natural join RESERVATIONS natural join VOYAGES
order by nom asc, prix desc;

--5
select Nom, VilleDepart, Code
from CLIENTS natural join RESERVATIONS natural join VOYAGES
where Ville = VilleDepart;

--7
select VilleDepart, VilleArrivee , to_char(Depart,'DD/MM/YYYY') as jourDepart, to_char(Depart,'hh:mi') as heureDepart
from VOYAGES
where months_between(Depart, SYSDATE) >= 3 
order by Depart;

--8
select VilleDepart  as villes
from VOYAGES
union 
select VilleArrivee
from VOYAGES;

--9
select Prenom, Nom
from Clients
where ville <> 'Paris';

--10
select Id, Prenom, Nom, Code
from Clients natural join Reservations natural join Voyages
where VilleDepart = 'Paris' and ville <> 'Paris';

--11

select id, Prenom, Nom
from Clients
Minus
select id, Prenom, Nom
from Clients natural join Reservations;

--12

select Code, Prix
from Voyages
Minus
select Code, Prix
from Voyages natural join Reservations;

--13

select id,Nom, Prenom , VilleDepart , VilleArrivee
from Clients natural join VOYAGES natural join Reservations
where VilleDepart = 'Paris' and VilleArrivee = 'Amsterdam'
Minus
select id,Nom, Prenom , VilleDepart , VilleArrivee
from Clients natural join VOYAGES natural join Reservations
where  VilleArrivee <> 'Amsterdam';

--14
select id, Nom, Prenom
from CLIENTS natural join VOYAGES natural join Reservations
where VilleArrivee = 'Amsterdam'
intersect
select id, Nom, Prenom
from CLIENTS natural join VOYAGES natural join RESERVATIONS
where VilleArrivee = 'Rio de Janeiro'
;

-- 15 
select id, Nom, Prenom
from CLIENTS natural join VOYAGES natural join Reservations
where VilleArrivee = 'Amsterdam'
union
select id, Nom, Prenom
from CLIENTS natural join VOYAGES natural join RESERVATIONS
where VilleArrivee = 'Rio de Janeiro'
;

--16
select C1.id,c1.Prenom, C2.id, c2.Prenom
from  CLIENTS c1 ,Clients c2
where C1.ville = C2.ville and c1.id < c2.id;


--17
select v1.code,v1.Prix, v2.code, v2.Prix
from  voyages v1 ,Voyages v2
where v1.Prix = v2.Prix  and v1.code < v2.code;

--18
select r1.Id , r1.Code, r2.Code 
from RESERVATIONS r1, RESERVATIONS r2 
where r1.Id = r2.Id 
and r1.Code < r2.Code;

--19 
select Id 
from RESERVATIONS
minus 
select r1.Id
from RESERVATIONS r1, RESERVATIONS r2 
where r1.Id = r2.Id 
and r1.Code < r2.Code;

--20 couple de client ayant fait des reservation le meme jour 
select distinct r1.Id, r2.Id , to_char(r1.DateReserv,'DD/MM/YYYY') as jourReservation, r1.Code, r2.Code
from RESERVATIONS r1, RESERVATIONS r2
where to_char(r1.DateReserv,'DD/MM/YYYY') = to_char(r2.DateReserv,'DD/MM/YYYY')
and r1.Id < r2.Id;


--TP4
--1 les client n'ayant fait aucune reservation aucun voyage
select id, Nom, Prenom
from CLIENTS
where id not in (select id from RESERVATIONS);

--ou 

select id, Nom, Prenom
from CLIENTS 
where not exists (select *
                  from RESERVATIONS 
                  where RESERVATIONS.id = CLIENTS.id);

--2 trouver kes voyages n'ayant aucune reservation
select Code, VilleDepart, VilleArrivee
from VOYAGES
where Code not in (select Code from RESERVATIONS);

--ou 
select Code, VilleDepart, VilleArrivee
from VOYAGES 
where not exists (select *
                  from RESERVATIONS 
                  where RESERVATIONS.Code = VOYAGES.Code);   

--3 3. Trouver les noms des clients ayant r´eserv´e seulement un voyage (une seule r´eservation)
--3 
select id, nom
from RESERVATIONS natural join Clients
where id not in( 
select r1.id
from RESERVATIONS r1, RESERVATIONS r2 
where r1.Id = r2.Id 
and (r1.Code < r2.Code or  r1.DateReserv != r2.DateReserv)
);

--4 
select Code
from Voyages
where prix >=  ALL (
    select prix
    from Voyages
);

-- 5 
select Code
from Voyages
where prix <=  ALL (
    select prix
    from Voyages
);

--6 
select code, VilleArrivee, VilleDepart, prix
from voyages v1
where exists (
    select *
    from Voyages v2
    where v1.VilleArrivee = v2.VilleArrivee
    and v1.VilleDepart = v2.VilleDepart
    and v1.code != v2.code 
);

--7
select code, VilleArrivee, VilleDepart, prix
from voyages v1
where not exists (
    select *
    from Voyages v2
    where v1.VilleArrivee = v2.VilleArrivee
    and v1.VilleDepart = v2.VilleDepart
    and v1.code ! = v2.code 
);