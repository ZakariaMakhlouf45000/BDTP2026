CREATE TABLE BdHabitantVoiture (
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
    ImmVoit         VARCHAR2(10)
);


--INSERT INTO BdHabitantVoiture VALUES ('Zakaria', 'Makhlouf', 'M', 'Rue des Fleurs', 12, 'Orleans', 'Renault', 'Clio', 2018, 'Rouge', 'Diesel', 'AB-123-CD');

--select * FROM  BdHabitantVoiture;

--select Nom, Sexe, MarqueVoit
--from BdHabitantVoiture;

-- Relation et shema de relation 
