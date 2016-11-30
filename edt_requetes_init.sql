USE edt 

CREATE TABLE Formation (
	id_formation			INTEGER NOT NULL IDENTITY(1,1),
	nom_formation			VARCHAR(100) NOT NULL UNIQUE, -- primaty key (a valider par le client)
	nbHeuresTotal_formation	FLOAT,
	CONSTRAINT pk_formation
		PRIMARY KEY(id_formation)
);

CREATE TABLE Promotion (
	-- Ici la primary key est le nom si le nom de la promotion est obligatoire et unique
	-- sinon il faut un ID
	id_promotion		INTEGER NOT NULL IDENTITY(1,1),
	id_formation		INTEGER NOT NULL ,
	nom_promotion		VARCHAR(50) NOT NULL,
	dateDebut_promotion	DATETIME NOT NULL,
	dateFin_promotion	DATETIME NOT NULL,
	CONSTRAINT fk_formation_promotion
		FOREIGN KEY (id_formation)
		REFERENCES Formation(id_formation),
	CONSTRAINT pk_promotion
		PRIMARY KEY(id_promotion)
);

CREATE TABLE Eleve (
	id_eleve		INTEGER NOT NULL IDENTITY(1,1),
	id_promotion	INTEGER NOT NULL,
	nom_eleve		VARCHAR(20) NOT NULL,
	prenom_eleve	VARCHAR(20) NOT NULL,
	mail_eleve		VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT fk_promotion_eleve
		FOREIGN KEY (id_promotion)
		REFERENCES Promotion(id_promotion),
	CONSTRAINT pk_eleve
		PRIMARY KEY(id_eleve)
);

CREATE TABLE Formateur (
	id_formateur		INTEGER NOT NULL IDENTITY(1,1),
	nom_formateur		VARCHAR(20) NOT NULL,
	prenom_formateur	VARCHAR(20) NOT NULL,
	mail_formateur		VARCHAR(50) NOT NULL UNIQUE,
	telephone_formateur	VARCHAR(16),
	CONSTRAINT pk_formateur
		PRIMARY KEY(id_formateur)
);

CREATE TABLE Matiere (
	id_matiere			INTEGER NOT NULL IDENTITY(1,1),
	nom_matiere			VARCHAR(100) NOT NULL UNIQUE, -- primaty key (a valider par le client)
	CONSTRAINT pk_matiere
		PRIMARY KEY(id_matiere)
);

CREATE TABLE Salle (
	id_salle		INTEGER NOT NULL IDENTITY(1,1),
	nom_salle		VARCHAR(20) NOT NULL UNIQUE, -- primaty key (a valider par le client)
	capacite_salle	INTEGER NOT NULL,
	CONSTRAINT pk_salle
		PRIMARY KEY(id_salle)
);

CREATE TABLE EmploiDuTemps (
	id_edt			INTEGER NOT NULL IDENTITY(1,1),
	dateDebut_edt	DATETIME NOT NULL,
	dateFin_edt		DATETIME NOT NULL,
	CONSTRAINT pk_edt
		PRIMARY KEY(id_edt)
);

CREATE TABLE Session_edt (
	id_session			INTEGER NOT NULL IDENTITY(1,1),
	id_promotion		INTEGER NOT NULL,
	id_formateur		INTEGER NOT NULL,
	id_matiere			INTEGER NOT NULL,
	id_salle			INTEGER NOT NULL,
	dateDebut_session	DATETIME NOT NULL,
	dateFin_session		DATETIME NOT NULL,
	CONSTRAINT fk_promotion_session
		FOREIGN KEY (id_promotion)
		REFERENCES Promotion(id_promotion),
	CONSTRAINT fk_salle_session
		FOREIGN KEY (id_salle)
		REFERENCES Salle(id_salle),
	CONSTRAINT fk_formateur_session
		FOREIGN KEY (id_formateur)
		REFERENCES Formateur(id_formateur),
	CONSTRAINT fk_matiere_session
		FOREIGN KEY (id_matiere)
		REFERENCES Matiere(id_matiere),
	CONSTRAINT pk_session
		PRIMARY KEY(id_session)
);

CREATE TABLE Formation_matiere (
	id_formation INTEGER NOT NULL,
	id_matiere INTEGER NOT NULL,
	CONSTRAINT pk_formation_matiere
		PRIMARY KEY (id_formation, id_matiere),
	CONSTRAINT fk_formation_FormationMatiere
		FOREIGN KEY (id_formation)
		REFERENCES Formation(id_formation),
	CONSTRAINT fk_matiere_FormationMatiere
		FOREIGN KEY (id_matiere)
		REFERENCES Matiere(id_matiere)
);

CREATE TABLE Formateur_matiere (
	id_formateur INTEGER NOT NULL,
	id_matiere INTEGER NOT NULL,
	CONSTRAINT pk_formateur_matiere
		PRIMARY KEY (id_formateur, id_matiere),
	CONSTRAINT fk_formateur_FormateurMatiere
		FOREIGN KEY (id_formateur)
		REFERENCES Formateur(id_formateur),
	CONSTRAINT fk_matiere_FormateurMatiere
		FOREIGN KEY (id_matiere)
		REFERENCES Matiere(id_matiere)
);

CREATE TABLE Session_EmploiDuTemps (
	id_session INTEGER NOT NULL,
	id_edt INTEGER NOT NULL,
	CONSTRAINT pk_session_EDT
		PRIMARY KEY (id_session, id_edt),
	CONSTRAINT fk_session_SessionEdt
		FOREIGN KEY (id_session)
		REFERENCES Session_edt(id_session),
	CONSTRAINT fk_edt_SessionEdt
		FOREIGN KEY (id_edt)
		REFERENCES EmploiDuTemps(id_edt)
);

CREATE TABLE Absence (
	id_eleve INTEGER NOT NULL,
	id_session INTEGER NOT NULL,
	CONSTRAINT pk_absence
		PRIMARY KEY (id_eleve, id_session),
	CONSTRAINT fk_eleve_absence
		FOREIGN KEY (id_eleve)
		REFERENCES Eleve(id_eleve),
	CONSTRAINT fk_session_absence
		FOREIGN KEY (id_session)
		REFERENCES Session_edt(id_session)
);
