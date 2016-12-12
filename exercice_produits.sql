CREATE TABLE Categorie(
	libelle VARCHAR (25)
);

CREATE TABLE Produit (
	nom VARCHAR (25),
	code CHAR(5)
);

ALTER TABLE Categorie ADD id INTEGER NOT NULL IDENTITY(1,1);
ALTER TABLE Categorie 
	ADD CONSTRAINT categorie_pk
	PRIMARY KEY (id);

ALTER TABLE Produit ADD id INTEGER NOT NULL IDENTITY(1,1);
ALTER TABLE Produit 
	ADD CONSTRAINT produit_pk
	PRIMARY KEY (id);

ALTER TABLE Produit ADD id_categorie INTEGER;
ALTER TABLE Produit 
	ADD CONSTRAINT produit_fk
	FOREIGN KEY (id_categorie)
	REFERENCES Categorie (id);
