-- EQUIPES [NomEquipe, DirecteurSportif]
-- COUREURS [NumCoureur, NomCoureur, PrenomCoureur, NomEquipe, CodePays]
-- ETAPES [NumEtape, DateEtape, VilleD´epart, VilleArrivee, NbKm]
-- TEMPS [NumCoureur, NumEtape, TempsRealise]
-- PAYS [CodePays, NPays]

-- ´Ecrire les requˆetes suivantes en SQL :
-- 1. Lister les noms des ´equipes.

select NomEquipe
from EQUIPES;

-- 2. Lister les noms des directeurs sportifs.
select DirecteurSportif
from EQUIPES;
-- 3. Lister les noms et les pr´enoms des coureurs.
select NomCoureur, PrenomCoureur
from coureurs;

-- 4. Trouver l’´equipe du coureur ULLRICH.
select NomEquipe
from COUREURS
where NomCoureur = 'ULLRICH';

-- 5. Donner les noms des coureurs de l’´equipe COFIDIS.
select NomCoureur
from COUREURS
where NomEquipe = 'COFIDIS';

-- 6. Lister tous les coureurs fran¸cais.
select NomCoureur
from COUREURS natural join PAYS
where NPays = 'FRANCE';

-- 7. Quel temps le coureur ’JALABERT’ a fait dans l’´etape 3 ?
select to_char(TempsRealise,'hh:mi:ss')
from TEMPS natural join COUREURS
where NomCoureur = 'JALABERT' and NumEtape = 3;


-- 8. Trouver le temps r´ealis´e par les coureurs sous l’encadrement de Manolo SAIZ dans les ´etapes dont la ville de d´epart est Rouen.
select NomCoureur , NumEtape, to_char(TempsRealise,'hh:mi:ss') as temps
from TEMPS natural join COUREURS natural join EQUIPES natural join ETAPES
where DirecteurSportif = 'Manolo SAIZ' and VilleDepart = 'Rouen';

-- 9. Lister les pays ayant des coureurs dans l’´etape dont l’arriv´ee est Plumelec.
select CodePays, NPays
from  ETAPES natural join PAYS natural join COUREURS natural join TEMPS 
where VilleArrivee = 'Plumelec';


-- 10. Trouver des couples de coureurs du mˆeme pays.
select C1.NomCoureur, C2.NomCoureur
from COUREURS C1, COUREURS C2
where C1.CodePays = C2.CodePays and C1.NumCoureur < C2.NumCoureur;

-- 11. Lister tous les coureurs fran¸cais. Afficher (en concat´enant) pr´enom et nom. La colonne
-- doit afficher Coureur.
select NomCoureur ||' '|| PrenomCoureur as Coureur
from COUREURS natural join PAYS
where NPays = 'FRANCE';
-- 12. Afficher les coureurs dont les pr´enoms commence par J.
select NomCoureur ||' '|| PrenomCoureur as Coureur
from COUREURS
where PrenomCoureur like 'J%';
-- 13. Afficher les noms des coureurs en ordre alphab´etique.
select PrenomCoureur
from COUREURS
order by NomCoureur;

-- 14. Afficher les r´esultats des ´etapes ordonn´es par le num´ero de l’´etape, le temps r´ealis´e et
-- le nom du coureur.
select 