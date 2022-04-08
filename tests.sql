-- LMD : Ajouter, modifier, supprimer des données

-- INSERT INTO Employes (emp_matricule, emp_nom, emp_prenom, emp_dep)
-- VALUES
-- (152,'CONDA','Anna',41)

-- INSERT INTO Employes VALUES (13, 567, 'BAMBEL', 'Lary', 43, Null)

-- INSERT INTO Employes (emp_matricule, emp_nom, emp_prenom, emp_dep, emp_salaire)
-- VALUES
-- (666, 'FER', 'Lucie', 42, 2130),
-- (42, 'MATIK', 'Otto', 50, Null)

-- UPDATE Employes
-- SET emp_salaire = 3150
-- WHERE ( emp_nom = 'CONDA' AND emp_prenom = 'Anna' )

-- UPDATE Employes
-- SET emp_salaire = emp_salaire * 1.2

-- UPDATE Employes
-- SET emp_salaire = 4130, emp_dep = 44
-- WHERE emp_matricule = 42

-- DELETE FROM Employes
-- WHERE (emp_dep = 'E21' OR emp_salaire IS NULL)

/*DROP DATABASE IF EXISTS papyrus;

CREATE DATABASE papyrus;

USE papyrus;

CREATE TABLE `fournis` (
  `numfou` int NOT NULL,
  `nomfou` varchar(25) NOT NULL,
  `ruefou` varchar(50) NOT NULL,
  `posfou` char(5) NOT NULL,
  `vilfou` varchar(30) NOT NULL,
  `confou` varchar(15) NOT NULL,
  `satisf` tinyint(4) DEFAULT NULL, 
  CHECK (`satisf` >=0 AND `satisf` <=10),
  PRIMARY KEY (`numfou`)
);

CREATE TABLE `produit` (
  `codart` char(4) NOT NULL,
  `libart` varchar(30) NOT NULL,
  `stkale` int(11) NOT NULL,
  `stkphy` int(11) NOT NULL,
  `qteann` int(11) NOT NULL,
  `unimes` char(5) NOT NULL,
  PRIMARY KEY (`codart`)
) ;

CREATE TABLE `entcom` (
  `numcom` int(11) NOT NULL AUTO_INCREMENT,
  `obscom` varchar(50) DEFAULT NULL,
  `datcom` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `numfou` int(11) DEFAULT NULL,
  PRIMARY KEY (`numcom`),
  KEY `numfou` (`numfou`),
  CONSTRAINT `entcom_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`)
);

CREATE TABLE `ligcom` (
  `numcom` int(11) NOT NULL,
  `numlig` tinyint(4) NOT NULL,
  `codart` char(4) NOT NULL,
  `qtecde` int(11) NOT NULL,
  `priuni` decimal(5,0) NOT NULL,
  `qteliv` int(11) DEFAULT NULL,
  `derliv` date NOT NULL,
  PRIMARY KEY (`numcom`,`numlig`),
  KEY `codart` (`codart`),
  CONSTRAINT `ligcom_ibfk_1` FOREIGN KEY (`numcom`) REFERENCES `entcom` (`numcom`),
  CONSTRAINT `ligcom_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`)
);

CREATE TABLE `vente` (
  `codart` char(4) NOT NULL,
  `numfou` int(11) NOT NULL,
  `delliv` smallint(6) NOT NULL,
  `qte1` int(11) NOT NULL,
  `prix1` decimal(5,0) NOT NULL,
  `qte2` int(11) DEFAULT NULL,
  `prix2` decimal(5,0) DEFAULT NULL,
  `qte3` int(11) DEFAULT NULL,
  `prix3` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`codart`,`numfou`),
  KEY `numfou` (`numfou`),
  CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`),
  CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`)
) ;

INSERT INTO fournis (numfou, nomfou, ruefou, posfou, vilfou, confou, satisf)
VALUES
(120, 'GROBRIGAN', '20 rue du papier', '92200', 'papercity', 'Georges', 8),
(540, 'ECLIPSE', '53 rue laisse flotter les rubans', '78250', 'Bugbugville', 'Nestor', 7),
(8700,'MEDICIS','120 rue des plantes','75014','Paris','Lison',0),
(9120,'DISCOBOL','11 rue des sports','85100','La Roche sur Yon','Hercule',8),
(9150,'DEPANPAP','26 avenue des locomotives','59987','Coroncountry','Pollux',5),
(9180,'HURRYTAPE','68 boulevard des octets','4044','Dumpville','Track',0)

INSERT INTO entcom (numcom, obscom, datcom, numfou)
VALUES
(70010,'', 20180423155951, 120),
(70011,'Commande urgente', 20180423155951, 540),
(70020,'', 20180423155951, 9120),
(70025,'Commande urgente', 20180423155951, 9150),
(70210,'Commande cadencée', 20180423155951, 120),
(70250,'Commande cadencée', 20180423155951, 8700),
(70300,'', 20180423155951, 9120),
(70620,'', 20180423155951, 540),
(70625,'', 20180423155951, 120),
(70629,'', 20180423155951, 9180)

INSERT INTO ligcom (numcom, numlig, codart, qtecde, priuni, qteliv, derliv)
VALUES
(70010, 1, 'I100', 3000, 470, 3000, 20070315),
(70010, 2, 'I105', 2000, 485, 2000, 20070705),
(70010, 3, 'I108', 1000, 680, 1000, 20070820),
(70010, 4, 'D035', 200, 40, 250, 20070220),
(70010, 5, 'P220', 6000, 3500, 6000, 20070331),
(70010, 6, 'P240', 6000, 2000, 2000, 20070331),
(70011, 1, 'I105', 1000, 600, 1000, 20070516),
(70011, 2, 'P220', 10000, 3500, 10000, 20070831),
(70020, 1, 'B001', 200, 140, 0, 20071231),
(70020, 2, 'B002', 200, 140, 0, 20071231),
(70025, 1, 'I100', 1000, 590, 1000, 20070515),
(70025, 2, 'I105', 500, 590, 500, 20070315),
(70210, 1, 'I100', 1000, 470, 1000, 20070715),
(70250, 1, 'P230', 15000, 4900, 12000, 20071215),
(70250, 2, 'P220', 10000, 3350, 10000, 20071110),
(70300, 1, 'I100', 50, 790, 50, 20071031),
(70620, 1, 'I105', 200, 600, 200, 20071101),
(70625, 1, 'I100', 1000, 470, 1000, 20071015),
(70625, 2, 'P220', 10000, 3500, 10000, 20071031),
(70629, 1, 'B001', 200, 140, 0, 20071231),
(70629, 2, 'B002', 200, 140, 0, 20071231)

LOAD DATA LOCAL INFILE 'Z:\\home\\avicenne\\Bureau\\vente.csv'

INTO TABLE vente

FIELDS TERMINATED BY ';'

LINES TERMINATED BY '\n'

IGNORE 1 LINES

(NUMFOU,CODART,DELLIV,QTE1,PRIX1,QTE2,PRIX2,QTE3,PRIX3);

1.UPDATE vente
SET
prix1 = prix1 * 1.04
WHERE (numfou = 9180)

UPDATE vente
SET
prix2 = prix2 * 1.02
WHERE (numfou = 9180)

2.UPDATE vente
SET prix2 = prix1
WHERE (prix2 = 0)

3.UPDATE entcom
JOIN fournis ON entcom.numfou = fournis.numfou
SET obscom ='*****'
WHERE (satisf < 5)


4. DELETE FROM ligcom WHERE (codart='I110')

DELETE FROM vente WHERE (codart='I110')


DELETE FROM produit
WHERE (codart = 'I110')*/

-- Il est nécessaire de remplir dans l'ordre les tables : 'fournis', 'produit', 'entcom', 'ligcom', 'vente' pour que les clés étrangères soient définies et accessibles pour toutes
-- les tables concernées afin d'éviter des erreurs d'éxécution du script.