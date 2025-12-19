CREATE TABLE BdHabitantVoiture (
    id NUMBER(2),
    Prenom          VARCHAR2(20),
    Nom             VARCHAR2(20),
    Sexe            VARCHAR2(1),
    Rue             VARCHAR2(20),
    Num             NUMBER(2),
    Ville           VARCHAR2(10),
    MarqueVoit      VARCHAR2(10),
    NomVoit         VARCHAR2(10),
    AnneeVoit       NUMBER(4),
    CouleurVoit     VARCHAR2(10),
    TypeMoteurVoit  VARCHAR2(10),
    ImmVoit         VARCHAR2(10),
    constraint CleGrandeTableVoiture Primary Key (ImmVoit)
);
insert into BdHabitantVoiture values (1, 'Arlette', 'Fort', 'F',
 'des Allouettes', 15, 'Olivet', 'Renault', 'Zoe', 2016, 
 'blanche', 'electrique', 'AD-123-EF');

insert into BdHabitantVoiture values (2, 'Arlette', 'Fort', 'F', 
'Alesia', 4, 'Paris', 'Renault', 'Clio', 2017, 
'blanche', 'essence', 'AB-333-CC');

insert into BdHabitantVoiture values (3, 'Arlette', 'Fort', 'F', 
'Alesia', 4, 'Paris', 'Renault', 'Clio', 2015,
 'noir', 'essence', 'AB-333-CC');

-- Mari et femme ont la meme voiture
insert into BdHabitantVoiture values (4, 'Julien', 'Dupont', 'M',
 'Cherche Midi', 4, 'Paris', 'Renault', 'Clio', 2017, 
 'bleu', 'essence', 'MM-222-XY');

insert into BdHabitantVoiture values (5, 'Marie', 'Dupont', 'F', 
'Cherche Midi', 4, 'Paris', 'Renault', 'Clio', 2017, 
'bleu', 'essence', 'MM-222-XY');
