SELECT 
	Commande.Id AS 'Numéro de commande', 
	CONCAT(Client.Prenom, ' ', Client.Nom) AS 'Client',
	Commande.Adresse AS 'Adresse de livraison',
	CONCAT (Categorie.Libelle, ' : ', Produit.Nom, ' (', Produit.Code, ')') AS 'Produit',
	Ligne_commande.Quantite
FROM 
	Ligne_commande 
	INNER JOIN Commande ON Ligne_commande.Commande_id = Commande.Id 
	INNER JOIN Client ON Client.Id = Commande.Client_Id
	INNER JOIN Produit ON Produit.Id = Ligne_commande.Produit_id
	INNER JOIN Categorie ON Categorie.Id = Produit.Categorie_id
ORDER BY Commande.Id, Categorie.Libelle;

SELECT 
	Commande.Id AS 'Numéro de commande', 
	CONCAT(Client.Prenom, ' ', Client.Nom) AS 'Client',
	Commande.Adresse AS 'Adresse de livraison',
	CONCAT (Categorie.Libelle, ' : ', Produit.Nom, ' (', Produit.Code, ')') AS 'Produit',
	Ligne_commande.Quantite
FROM 
	Ligne_commande 
	INNER JOIN Commande ON Ligne_commande.Commande_id = Commande.Id 
	INNER JOIN Client ON Client.Id = Commande.Client_Id
	INNER JOIN Produit ON Produit.Id = Ligne_commande.Produit_id
	INNER JOIN Categorie ON Categorie.Id = Produit.Categorie_id
WHERE 
	Commande.Id IN (SELECT Commande.Id FROM Commande INNER JOIN Ligne_commande ON Ligne_commande.Commande_id = Commande.Id GROUP BY Commande.Id HAVING SUM(Ligne_commande.Quantite) BETWEEN 0 AND 30)
ORDER BY Commande.Id, Categorie.Libelle;

SELECT 
	Commande.Id AS 'Numéro de commande',
	CONCAT(Client.Nom, ' ', Client.Prenom) AS 'Client',
	SUM(Ligne_commande.Quantite) AS 'Quantité totale'
FROM 
	Ligne_commande 
	INNER JOIN Commande ON Ligne_commande.Commande_id = Commande.Id
	INNER JOIN Client ON Client.Id = Commande.Client_Id
GROUP BY Commande.Id, CONCAT(Client.Nom, ' ', Client.Prenom)

SELECT DISTINCT
	CONCAT(Client.Prenom, ' ', Client.Nom) AS 'Client'
FROM 
	Ligne_commande
	INNER JOIN Commande ON Ligne_commande.Commande_id = Commande.Id
	INNER JOIN Client ON Client.Id = Commande.Client_Id
WHERE Ligne_commande.Quantite > 10;

SELECT Produit.Id, SUM(Ligne_commande.Quantite)
FROM Produit
	INNER JOIN Ligne_commande ON Produit.Id = Ligne_commande.Produit_id
	INNER JOIN Commande ON Ligne_commande.Commande_id = Commande.Id 
GROUP BY Produit.Id
HAVING 
ORDER BY Produit.Id;

SELECT CONCAT(Client.Nom, ' ', Client.Prenom) AS 'Client', COUNT(DISTINCT Commande.Id) AS 'NB commandes', COUNT(Produit.Id) AS 'nb produits'
FROM Produit
	INNER JOIN Ligne_commande ON Produit.Id = Ligne_commande.Produit_id
	INNER JOIN Commande ON Ligne_commande.Commande_id = Commande.Id
	INNER JOIN Client ON Client.Id = Commande.Client_Id
GROUP BY Client.Nom, Client.Prenom, Produit.Id
ORDER BY Client.Nom;

SELECT DISTINCT CONCAT(Client.Prenom, ' ', Client.Nom) AS 'Client'
FROM Produit
	INNER JOIN Ligne_commande ON Produit.Id = Ligne_commande.Produit_id
	INNER JOIN Commande ON Ligne_commande.Commande_id = Commande.Id
	INNER JOIN Client ON Client.Id = Commande.Client_Id
GROUP BY Client.Prenom, Client.Nom, Produit.Id
HAVING SUM (Ligne_commande.Quantite) > 9;



-- Nombre total de produits commandé par client :
SELECT CONCAT(Client.Prenom, ' ', Client.Nom) AS 'Client', SUM(Ligne_commande.Quantite)
FROM Produit
	INNER JOIN Ligne_commande ON Produit.Id = Ligne_commande.Produit_id
	INNER JOIN Commande ON Ligne_commande.Commande_id = Commande.Id
	INNER JOIN Client ON Client.Id = Commande.Client_Id
GROUP BY Client.Nom, Client.Prenom
ORDER BY Client.Nom;