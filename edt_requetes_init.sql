USE edt;
GO
CREATE TABLE Formation (
	Id INTEGER NOT NULL IDENTITY(1,1),
	Nom VARCHAR(100) NOT NULL UNIQUE, -- primaty key (a valider par le client)
	NbHeuresTotal FLOAT,
	CONSTRAINT pk_formation
		PRIMARY KEY(Id)
);

CREATE TABLE Promotion (
	-- Ici la primary key est le nom si le nom de la promotion est obligatoire et unique
	-- sinon il faut un ID
	Id INTEGER NOT NULL IDENTITY(1,1),
	Formation_id INTEGER NOT NULL ,
	Nom VARCHAR(50) NOT NULL,
	DateDebut DATETIME NOT NULL,
	DateFin	DATETIME NOT NULL,
	CONSTRAINT pk_promotion
		PRIMARY KEY(Id),
	CONSTRAINT fk_formation_promotion
		FOREIGN KEY (Formation_id)
		REFERENCES Formation(Id)
);

CREATE TABLE Eleve (
	Id INTEGER NOT NULL IDENTITY(1,1),
	Promotion_id INTEGER NOT NULL,
	Nom	VARCHAR(20) NOT NULL,
	Prenom VARCHAR(20) NOT NULL,
	Mail VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT pk_eleve
		PRIMARY KEY(Id),
	CONSTRAINT fk_promotion_eleve
		FOREIGN KEY (Promotion_id)
		REFERENCES Promotion(Id)
);

CREATE TABLE Formateur (
	Id INTEGER NOT NULL IDENTITY(1,1),
	Nom VARCHAR(20) NOT NULL,
	Prenom VARCHAR(20) NOT NULL,
	Mail VARCHAR(50) NOT NULL UNIQUE,
	Telephone VARCHAR(16),
	CONSTRAINT pk_formateur
		PRIMARY KEY(Id)
);

CREATE TABLE Matiere (
	Id INTEGER NOT NULL IDENTITY(1,1),
	Nom	VARCHAR(100) NOT NULL UNIQUE, -- primaty key (a valider par le client)
	CONSTRAINT pk_matiere
		PRIMARY KEY(Id)
);

CREATE TABLE Salle (
	Id INTEGER NOT NULL IDENTITY(1,1),
	Nom	VARCHAR(20) NOT NULL UNIQUE, -- primaty key (a valider par le client)
	Capacite INTEGER NOT NULL,
	CONSTRAINT pk_salle
		PRIMARY KEY(Id)
);

CREATE TABLE Session_edt (
	Id INTEGER NOT NULL IDENTITY(1,1),
	Promotion_id INTEGER NOT NULL,
	Formateur_id INTEGER NOT NULL,
	Matiere_id INTEGER NOT NULL,
	Salle_id INTEGER NOT NULL,
	DateDebut DATETIME NOT NULL,
	DateFin DATETIME NOT NULL,
	CONSTRAINT pk_session
		PRIMARY KEY(Id),
	CONSTRAINT fk_promotion_session
		FOREIGN KEY (Promotion_id)
		REFERENCES Promotion(Id),
	CONSTRAINT fk_salle_session
		FOREIGN KEY (Salle_id)
		REFERENCES Salle(Id),
	CONSTRAINT fk_formateur_session
		FOREIGN KEY (Formateur_id)
		REFERENCES Formateur(Id),
	CONSTRAINT fk_matiere_session
		FOREIGN KEY (Matiere_id)
		REFERENCES Matiere(Id)
);

CREATE TABLE Formation_matiere (
	Formation_id INTEGER NOT NULL,
	Matiere_id INTEGER NOT NULL,
	CONSTRAINT pk_formation_matiere
		PRIMARY KEY (Formation_id, Matiere_id),
	CONSTRAINT fk_formation_FormationMatiere
		FOREIGN KEY (Formation_id)
		REFERENCES Formation(Id),
	CONSTRAINT fk_matiere_FormationMatiere
		FOREIGN KEY (Matiere_id)
		REFERENCES Matiere(Id)
);

CREATE TABLE Formateur_matiere (
	Formateur_id INTEGER NOT NULL,
	Matiere_id INTEGER NOT NULL,
	CONSTRAINT pk_formateur_matiere
		PRIMARY KEY (Formateur_id, Matiere_id),
	CONSTRAINT fk_formateur_FormateurMatiere
		FOREIGN KEY (Formateur_id)
		REFERENCES Formateur(Id),
	CONSTRAINT fk_matiere_FormateurMatiere
		FOREIGN KEY (Matiere_id)
		REFERENCES Matiere(Id)
);

CREATE TABLE Absence (
	Eleve_id INTEGER NOT NULL,
	Session_id INTEGER NOT NULL,
	CONSTRAINT pk_absence
		PRIMARY KEY (Eleve_id, Session_id),
	CONSTRAINT fk_eleve_absence
		FOREIGN KEY (Eleve_id)
		REFERENCES Eleve(Id),
	CONSTRAINT fk_session_absence
		FOREIGN KEY (Session_id)
		REFERENCES Session_edt(Id)
);
