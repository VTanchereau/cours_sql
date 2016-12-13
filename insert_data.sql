

SET IDENTITY_INSERT Categorie ON
INSERT INTO Categorie (id, libelle) VALUES 
	(1,'Fruits et légumes'),
	(2, 'Informatique'),
	(3, 'Electroménagé');

SET IDENTITY_INSERT Categorie OFF

INSERT INTO Produit (code, nom, categorie_id) VALUES 
	('FL001', 'Tomates', (SELECT id FROM Categorie WHERE libelle = 'Fruits et légumes')),
	('FL002', 'Concombre', (SELECT id FROM Categorie WHERE libelle = 'Fruits et légumes')),
	('FL003', 'Radis', (SELECT id FROM Categorie WHERE libelle = 'Fruits et légumes')),
	('FL004', 'Pommes de Terre', (SELECT id FROM Categorie WHERE libelle = 'Fruits et légumes')),
	('FL005', 'Courgette', (SELECT id FROM Categorie WHERE libelle = 'Fruits et légumes')),
	('FL006', 'Poivron', (SELECT id FROM Categorie WHERE libelle = 'Fruits et légumes')),

	('INF01', 'ASUS RoG', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	('INF02', 'Medion Erazer', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	('INF03', 'HP Spectre', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	('INF04', 'Macbook pro', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	('INF05', 'Macbook air', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	('INF06', 'iPad', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	
	('EL001', 'Four Siemens', (SELECT id FROM Categorie WHERE libelle = 'Electroménagé')),
	('EL002', 'Four Bosch', (SELECT id FROM Categorie WHERE libelle = 'Electroménagé')),
	('EL003', 'Sèche-linge Samsung', (SELECT id FROM Categorie WHERE libelle = 'Electroménagé')),
	('EL004', 'Sèche-linge Electrolux', (SELECT id FROM Categorie WHERE libelle = 'Electroménagé')),
	('EL005', 'Machine à laver Samsung', (SELECT id FROM Categorie WHERE libelle = 'Electroménagé')),
	('EL006', 'Machine à laver Bosch', (SELECT id FROM Categorie WHERE libelle = 'Electroménagé'));

SELECT 
	CONCAT (p.categorie_id, ' - ', cat.libelle) AS 'Catégorie',
	CONCAT (nom, ' (', code, ')') AS 'Produit'
FROM Categorie cat INNER JOIN Produit p
ON p.categorie_id = cat.id
ORDER BY cat.libelle;

--SELECT id AS 'Numéro', code AS 'Code Prouit', categorie_id AS 'Numéro de Catégorie' FROM Produit WHERE categorie_id IN (SELECT id FROM Categorie WHERE libelle = 'Sites de bool');