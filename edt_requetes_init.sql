CREATE TABLE Eleve (
	nom		VARCHAR(20),
	prenom	VARCHAR(20),
	mail	VARCHAR(50)	-- primaty key
);

CREATE TABLE Promotion (
	-- Ici la primary key est le nom si le nom de la promotion est obligatoire et unique
	-- sinon il faut un ID
	nom			VARCHAR(20),
	dateDebut	DATETIME,
	dateFin		DATETIME
);


CREATE TABLE Formateur (
	nom			VARCHAR(20),
	prenom		VARCHAR(20),
	mail		VARCHAR(50), -- primaty key
	telephone	VARCHAR(16)
);

CREATE TABLE Formation (
	nom				VARCHAR(20), -- primaty key (a valider par le client)
	nbHeuresTotal	FLOAT
);

CREATE TABLE Salle (
	nom			VARCHAR(20), -- primaty key (a valider par le client)
	capacite	INTEGER
);

CREATE TABLE EmploiDuTemps (
	-- Need ID
	dateDebut	DATETIME,
	dateFin		DATETIME
);

CREATE TABLE Session_edt (
	-- Need ID
	dateDebut	DATETIME,
	dateFin		DATETIME
);