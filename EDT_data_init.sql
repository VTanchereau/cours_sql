USE edt;
GO

SET IDENTITY_INSERT Formation ON
INSERT INTO Formation (Id, Nom, NbHeuresTotal) VALUES
	(1, 'Développeurs Logiciels', 12),
	(2, 'Concepteurs Développeurs', 156),
	(3, 'Responsable des Ressources Humaines', 132);
SET IDENTITY_INSERT Formation OFF

SET IDENTITY_INSERT Promotion ON
INSERT INTO Promotion (Id, Formation_id, Nom, DateDebut, DateFin) VALUES
	(1, 1, 'La promo des dev log', '20160901 00:00:00 AM', '20170830 00:00:00 AM'),
	(2, 2, 'La promo des con dev', '20160901 00:00:00 AM', '20180228 00:00:00 AM'),
	(3, 3, 'La promo des res res hum', '20160901 00:00:00 AM', '20180228 00:00:00 AM');
SET IDENTITY_INSERT Promotion OFF

SET IDENTITY_INSERT Eleve ON
INSERT INTO Eleve (Id, Promotion_id, Nom, Prenom, Mail) VALUES
	(1, 1, 'Tanchereau', 'Victor', 'victor.tanchereau@gmail.com'),
	(2, 1, 'Pussault', 'Pierre', 'pierre.pussault@gmail.com'),
	(3, 2, 'Abraham', 'Nathan', 'nathan.Abraham@gmail.com'),
	(4, 2, 'Pereira', 'Mickael', 'mickael.pereira@gmail.com'),
	(5, 2, 'Raulo', 'Erwan', 'erwan.raulo@gmail.com'),
	(6, 2, 'Martin', 'Coline', 'coline.martin@gmail.com'),
	(7, 3, 'Grolleau', 'Gwendo', 'gwendo.grolleau@gmail.com'),
    (8, 3, 'Dugeas', 'Chloé', 'dchloe@gmail.com'),
    (9, 3, 'Said Salim', 'Hasna', 'sshasna@gmail.com');
SET IDENTITY_INSERT Eleve OFF

SET IDENTITY_INSERT Formateur ON
INSERT INTO Formateur (Id, Nom, Prenom, Mail, Telephone) VALUES
	(1, 'Jung', 'Jean-François', 'jf-jung@gmail.com', '0702010503');
SET IDENTITY_INSERT Formateur OFF

SET IDENTITY_INSERT Matiere ON
INSERT INTO MATIERE (Id, Nom) VALUES
	(1, 'SQL'),
	(2, 'Modélisation');
SET IDENTITY_INSERT Matiere OFF

SET IDENTITY_INSERT Salle ON
INSERT INTO Salle (Id, Nom, Capacite) VALUES
	(1, '1', 15),
	(2, '2', 24);
SET IDENTITY_INSERT Salle OFF

INSERT INTO Formation_matiere (Formation_id, Matiere_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

INSERT INTO Formateur_matiere (Formateur_id, Matiere_id) VALUES
(1, 1),
(1, 2);

SET IDENTITY_INSERT Session_edt ON
INSERT INTO Session_edt (Id, Promotion_id, Formateur_id, Matiere_id, Salle_id, DateDebut, DateFin) VALUES
	(1, 1, 1, 1, 1, '20161214 09:00:00 AM', '20161214 11:59:00 AM');
SET IDENTITY_INSERT Session_edt OFF

INSERT INTO Absence (Eleve_id, Session_id) VALUES 
	(1, 1);
