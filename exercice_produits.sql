CREATE TABLE Categorie(
	id INTEGER NOT NULL PRIMARY KEY,
	libelle VARCHAR (50)
);

CREATE TABLE Produit (
	id INTEGER NOT NULL PRIMARY KEY,
	code CHAR(5) UNIQUE,
	nom VARCHAR (50),
	categorie_id INTEGER,
	CONSTRAINT fk_produit_categorie
		FOREIGN KEY (categorie_id)
		REFERENCES categorie (id)
);