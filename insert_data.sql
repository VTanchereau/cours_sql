

SET IDENTITY_INSERT Categorie ON
INSERT INTO Categorie (id, libelle) VALUES 
	(1,'Fruits et l�gumes'),
	(2, 'Informatique'),
	(3, 'Electrom�nag�');

SET IDENTITY_INSERT Categorie OFF

INSERT INTO Produit (code, nom, categorie_id) VALUES 
	('FL001', 'Tomates', (SELECT id FROM Categorie WHERE libelle = 'Fruits et l�gumes')),
	('FL002', 'Concombre', (SELECT id FROM Categorie WHERE libelle = 'Fruits et l�gumes')),
	('FL003', 'Radis', (SELECT id FROM Categorie WHERE libelle = 'Fruits et l�gumes')),
	('FL004', 'Pommes de Terre', (SELECT id FROM Categorie WHERE libelle = 'Fruits et l�gumes')),
	('FL005', 'Courgette', (SELECT id FROM Categorie WHERE libelle = 'Fruits et l�gumes')),
	('FL006', 'Poivron', (SELECT id FROM Categorie WHERE libelle = 'Fruits et l�gumes')),

	('INF01', 'ASUS RoG', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	('INF02', 'Medion Erazer', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	('INF03', 'HP Spectre', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	('INF04', 'Macbook pro', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	('INF05', 'Macbook air', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	('INF06', 'iPad', (SELECT id FROM Categorie WHERE libelle = 'Informatique')),
	
	('EL001', 'Four Siemens', (SELECT id FROM Categorie WHERE libelle = 'Electrom�nag�')),
	('EL002', 'Four Bosch', (SELECT id FROM Categorie WHERE libelle = 'Electrom�nag�')),
	('EL003', 'S�che-linge Samsung', (SELECT id FROM Categorie WHERE libelle = 'Electrom�nag�')),
	('EL004', 'S�che-linge Electrolux', (SELECT id FROM Categorie WHERE libelle = 'Electrom�nag�')),
	('EL005', 'Machine � laver Samsung', (SELECT id FROM Categorie WHERE libelle = 'Electrom�nag�')),
	('EL006', 'Machine � laver Bosch', (SELECT id FROM Categorie WHERE libelle = 'Electrom�nag�'));

SELECT 
	CONCAT (p.categorie_id, ' - ', cat.libelle) AS 'Cat�gorie',
	CONCAT (nom, ' (', code, ')') AS 'Produit'
FROM Categorie cat INNER JOIN Produit p
ON p.categorie_id = cat.id
ORDER BY cat.libelle;

--SELECT id AS 'Num�ro', code AS 'Code Prouit', categorie_id AS 'Num�ro de Cat�gorie' FROM Produit WHERE categorie_id IN (SELECT id FROM Categorie WHERE libelle = 'Sites de bool');