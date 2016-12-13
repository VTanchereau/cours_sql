CREATE TABLE Categorie(
	Id INTEGER NOT NULL IDENTITY(1,1),
	Libelle VARCHAR (50),
	CONSTRAINT pk_categorie
		PRIMARY KEY(Id)
);

CREATE TABLE Produit (
	Id INTEGER NOT NULL IDENTITY(1,1),
	Code CHAR(5) UNIQUE,
	Nom VARCHAR (50),
	Categorie_id INTEGER,
	CONSTRAINT pk_produit
		PRIMARY KEY(Id),
	CONSTRAINT fk_produit_categorie
		FOREIGN KEY (Categorie_id)
		REFERENCES Categorie (Id)
);

CREATE TABLE Client (
	Id INTEGER NOT NULL IDENTITY(1,1),
	Nom VARCHAR(50),
	Prenom VARCHAR(50),
	Mail VARCHAR(50),
	CONSTRAINT pk_client
		PRIMARY KEY(Id)
);

CREATE TABLE Commande (
	Id INTEGER NOT NULL IDENTITY(1,1),
	Adresse VARCHAR(100),
	Client_id INTEGER,
	CONSTRAINT pk_commande
		PRIMARY KEY(Id),
	CONSTRAINT fk_commande_client
		FOREIGN KEY (Client_id)
		REFERENCES Client(Id)
);

CREATE TABLE Ligne_commande (
	Commande_id INTEGER NOT NULL,
	Produit_id INTEGER NOT NULL,
	Quantite INTEGER DEFAULT 1,
	CONSTRAINT pk_ligne_commande
		PRIMARY KEY (Commande_id, Produit_id),
	CONSTRAINT fk_commande_Ligne_commande
		FOREIGN KEY (Commande_id)
		REFERENCES Commande(Id),
	CONSTRAINT fk_produit_Ligne_commande
		FOREIGN KEY (Produit_id)
		REFERENCES Produit(Id)
);