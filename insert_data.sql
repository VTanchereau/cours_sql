USE COUCOU;
GO

SET IDENTITY_INSERT Categorie ON
INSERT INTO Categorie (Id, Libelle) VALUES 
(1,'Fruits et légumes'),
(2, 'Informatique'),
(3, 'Electroménagé');
SET IDENTITY_INSERT Categorie OFF

SET IDENTITY_INSERT Produit ON
INSERT INTO Produit (Id, Code, Nom, Categorie_id) VALUES 
(1, 'FL001', 'Tomates', 1),
(2, 'FL002', 'Concombre', 1),
(3, 'FL003', 'Radis',1),
(4, 'FL004', 'Pommes de Terre', 1),
(5, 'FL005', 'Courgette', 1),
(6, 'FL006', 'Poivron', 1),

(7, 'INF01', 'ASUS RoG', 2),
(8, 'INF02', 'Medion Erazer', 2),
(9, 'INF03', 'HP Spectre', 2),
(10, 'INF04', 'Macbook pro', 2),
(11, 'INF05', 'Macbook air', 2),
(12, 'INF06', 'iPad', 2),
	
(13, 'EL001', 'Four Siemens', 3),
(14, 'EL002', 'Four Bosch', 3),
(15, 'EL003', 'Sèche-linge Samsung', 3),
(16, 'EL004', 'Sèche-linge Electrolux', 3),
(17, 'EL005', 'Machine à laver Samsung', 3),
(18, 'EL006', 'Machine à laver Bosch', 3);
SET IDENTITY_INSERT Produit OFF

SET IDENTITY_INSERT Client ON
INSERT INTO Client (Id, Nom, Prenom, Mail) VALUES
(1, 'Tanchereau', 'Victor', 'unmail-1@gmail.com'),
(2, 'Laplaud', 'Clément', 'unmail-2@gmail.com'),
(3, 'Sejourne', 'Thibault', 'unmail-3@gmail.com'),
(4, 'Crossouard', 'Rémi', 'unmail-4@gmail.com'),
(5, 'Poireau', 'Marie', 'unmail-5@gmail.com'),
(6, 'Chazarain', 'Camille', 'unmail-6@gmail.com');
SET IDENTITY_INSERT Client OFF

SET IDENTITY_INSERT Commande ON
INSERT INTO Commande (Id, Adresse, Client_id) VALUES
(1, 'Adresse de Victor', 1),
(2, 'Adresse de Clément', 2),
(3, 'Adresse de Thibault', 3),
(4, 'Adresse de Rémi', 4),
(5, 'Adresse de Marie', 5),
(6, 'Adresse de Camille', 6);
SET IDENTITY_INSERT Commande OFF

INSERT INTO Ligne_commande (Commande_id, Produit_id, Quantite) VALUES
(1, 8, 1),
(1, 9, 1),
(1, 10, 3),
(1, 14, 1),
(1, 6, 12),

(2, 18, 1),
(2, 4, 6),
(2, 1, 13),
(2, 15, 1),
(2, 13, 2),

(3, 9, 1),
(3, 5, 2),
(3, 16, 3),
(3, 11, 1),
(3, 7, 5),

(4, 4, 4),
(4, 2, 15),
(4, 17, 3),
(4, 12, 3),
(4, 8, 2),

(5, 8, 6),
(5, 9, 1),
(5, 10, 4),
(5, 14, 15),
(5, 6, 2),

(6, 18, 1),
(6, 17, 1),
(6, 16, 1),
(6, 15, 1),
(6, 14, 2);