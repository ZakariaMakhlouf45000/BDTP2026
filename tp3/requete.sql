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
