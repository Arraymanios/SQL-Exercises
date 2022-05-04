/*Exercice 1 - La base Clicom*/

/*DROP DATABASE IF EXISTS Clicom;

CREATE DATABASE Clicom; 

USE Clicom; 

CREATE TABLE produit(
   pro_num INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
   pro_libelle VARCHAR (50),
   pro_description VARCHAR (50)
);

CREATE TABLE CLIENT (
cli_num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cli_nom VARCHAR (50),
cli_adresse VARCHAR (50),
cli_tel VARCHAR (30)
);

CREATE TABLE commande (
	com_num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cli_num INT,
	com_date DATETIME,
	com_obs VARCHAR (50),
	FOREIGN KEY (cli_num) REFERENCES CLIENT(cli_num)
);

CREATE TABLE est_compose (
	com_num INT NOT NULL,
	pro_num INT NOT NULL,
	est_qte INT,
	PRIMARY KEY (com_num, pro_num),
	FOREIGN KEY (pro_num) REFERENCES produit (pro_num),
	FOREIGN KEY (com_num) REFERENCES commande (com_num)
);

CREATE UNIQUE INDEX `UI_nom` ON `CLIENT` (`cli_nom`);*/

/*Exercice 2 - La base Northwind*/

/*USE northwind;

SELECT CompanyName AS'Société', ContactName AS'contact', ContactTitle AS'Fonction',Phone  AS'Téléphone' FROM customers WHERE Country = 'France';

SELECT ProductName AS 'Produit', UnitPrice AS 'Prix' FROM products JOIN suppliers ON products.SupplierID = suppliers.SupplierID AND CompanyName = 'Exotic Liquids';

SELECT CompanyName AS 'Fournisseur', COUNT(ProductName) AS 'Nbre produits' 
FROM suppliers JOIN products ON suppliers.SupplierID = products.SupplierID 
WHERE Country = 'France' GROUP BY CompanyName ORDER BY COUNT(ProductName) DESC;*/

/*SELECT companyname, count(shipvia) commande
FROM customers
JOIN orders ON orders.customerid = customers.customerid
WHERE country = 'france'
GROUP BY companyname
HAVING commande > 10

SELECT CompanyName AS 'Client', COUNT(OrderID) AS 'Nbre commandes' 
FROM customers JOIN orders ON customers.CustomerID = orders.CustomerID WHERE Country = 'France' GROUP BY CompanyName HAVING COUNT(OrderID) > 10;

SELECT CompanyName AS 'Client', SUM(UnitPrice * Quantity) AS 'CA', Country AS 'Pays' FROM customers 
JOIN orders ON customers.CustomerID = orders.CustomerID
JOIN order_details ON orders.OrderID = order_details.OrderID 
GROUP BY CompanyName HAVING SUM(UnitPrice * Quantity) > 30000 ORDER BY CA DESC;
 
SELECT DISTINCT ShipCountry AS 'Pays' FROM orders 
JOIN order_details ON orders.OrderID = order_details.OrderID
JOIN products ON order_details.ProductID = products.ProductID
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids' ORDER BY ShipCountry ASC;

SELECT SUM(UnitPrice * Quantity) AS 'Montant Ventes 97' FROM order_details
JOIN orders ON order_details.OrderID = orders.OrderID WHERE ShippedDate LIKE '1997%';

SELECT MONTH(ShippedDate) AS 'Mois 97', SUM(UnitPrice * Quantity) AS 'Montant Ventes' FROM orders
JOIN order_details ON orders.OrderID = order_details.OrderID GROUP BY MONTH(ShippedDate);

SELECT MAX(RequiredDate) AS 'Date de dernière commande' FROM orders
JOIN customers ON orders.CustomerID = customers.CustomerID  WHERE CompanyName = 'Du monde entier';

SELECT AVG(DATEDIFF(RequiredDate, ShippedDate)) AS 'Délai moyen de livraison en jours' FROM orders;*/