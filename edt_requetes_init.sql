CREATE TABLE Eleve (
	nom		VARCHAR(20),
	prenom	VARCHAR(20), 
	mail	VARCHAR(50)
);

CREATE TABLE Promotion (
	nom			VARCHAR(20),
	dateDebut	DATETIME,
	dateFin		DATETIME
);


CREATE TABLE Formateur (
	nom			VARCHAR(20),
	prenom		VARCHAR(20),
	mail		VARCHAR(50),
	telephone	VARCHAR(16)
);

CREATE TABLE Formation (
	nom				VARCHAR(20),
	nbHeuresTotal	FLOAT(5,1)
);

CREATE TABLE Salle (
	nom			VARCHAR(20),
	capacite	INTEGER
);

CREATE TABLE EmploiDuTemps (
	dateDebut	DATETIME,
	dateFin		DATETIME
);

CREATE TABLE Session_edt (
	dateDebut	DATETIME,
	dateFin		DATETIME
);