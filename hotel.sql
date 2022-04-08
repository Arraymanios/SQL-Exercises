DROP DATABASE IF EXISTS HOTEL;

CREATE DATABASE HOTEL;

USE HOTEL;

CREATE TABLE Station
(
station_num INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
station_nom VARCHAR(50)
);

CREATE TABLE Hotel
(
hotel_capacite TINYINT,
hotel_categorie ENUM ('1','2','3','4','5'),
hotel_nom VARCHAR(50),
hotel_adresse VARCHAR(50),
hotel_num INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
hotel_num_station INT NOT NULL,
FOREIGN KEY (hotel_num_station) REFERENCES Station (station_num)
);

CREATE TABLE Chambre
(
chambre_capacite TINYINT NOT NULL,
chambre_degre_confort ENUM('S','A','B','C'),
chambre_exposition ENUM('Nord','Sud','Est','Ouest'),
chambre_type ENUM ('Simple','Double','Triple','Quadruple'),
chambre_num INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
chambre_num_hotel INT NOT NULL,
FOREIGN KEY (chambre_num_hotel) REFERENCES Hotel (hotel_num)
);


CREATE TABLE Client
(
client_adresse VARCHAR(50),
client_nom VARCHAR(50) NOT NULL,
client_prenom VARCHAR(50) NOT NULL,
client_num INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE Reservation
(
reservation_num_chambre INT NOT NULL,
reservation_num_client INT NOT NULL,
reservation_date_debut DATETIME NOT NULL CHECK (reservation_date_debut < reservation_date_fin),
reservation_date_fin DATETIME NOT NULL CHECK (reservation_date_fin > reservation_date_debut),
reservation_date DATE CHECK (reservation_date < reservation_date_debut),
reservation_montant_arrhes FLOAT NOT NULL,
reservation_prix_total FLOAT NOT NULL CHECK (reservation_prix_total > reservation_montant_arrhes),
PRIMARY KEY(reservation_num_chambre, reservation_num_client),
FOREIGN KEY (reservation_num_chambre) REFERENCES Chambre (chambre_num),
FOREIGN KEY (reservation_num_client) REFERENCES Client (client_num)
);

-- CONTRAINTES D'INTEGRITE :
--
-- Reservation : date reservation < date debut < date fin | prix total > montant arrhes
-- 
-- Clé primaire à deux champs de la table Reservation (reservation_num_chambre,reservation_num_client).
-- 
-- Clés étrangères :
--
-- Degrés de confort : S, A, B, CDROP DATABASE IF EXISTS HOTEL;

CREATE DATABASE HOTEL;

USE HOTEL;

CREATE TABLE Station
(
station_num INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
station_nom VARCHAR(50)
);

CREATE TABLE Hotel
(
hotel_capacite TINYINT,
hotel_categorie ENUM ('1','2','3','4','5'),
hotel_nom VARCHAR(50),
hotel_adresse VARCHAR(50),
hotel_num INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
hotel_num_station INT NOT NULL,
FOREIGN KEY (hotel_num_station) REFERENCES Station (station_num)
);

CREATE TABLE Chambre
(
chambre_capacite TINYINT NOT NULL,
chambre_degre_confort ENUM('S','A','B','C'),
chambre_exposition ENUM('Nord','Sud','Est','Ouest'),
chambre_type ENUM ('Simple','Double','Triple','Quadruple'),
chambre_num INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
chambre_num_hotel INT NOT NULL,
FOREIGN KEY (chambre_num_hotel) REFERENCES Hotel (hotel_num)
);


CREATE TABLE Client
(
client_adresse VARCHAR(50),
client_nom VARCHAR(50) NOT NULL,
client_prenom VARCHAR(50) NOT NULL,
client_num INT NOT NULL PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE Reservation
(
reservation_num_chambre INT NOT NULL,
reservation_num_client INT NOT NULL,
reservation_date_debut DATETIME NOT NULL CHECK (reservation_date_debut < reservation_date_fin),
reservation_date_fin DATETIME NOT NULL CHECK (reservation_date_fin > reservation_date_debut),
reservation_date DATE CHECK (reservation_date < reservation_date_debut),
reservation_montant_arrhes FLOAT NOT NULL,
reservation_prix_total FLOAT NOT NULL CHECK (reservation_prix_total > reservation_montant_arrhes),
PRIMARY KEY(reservation_num_chambre, reservation_num_client),
FOREIGN KEY (reservation_num_chambre) REFERENCES Chambre (chambre_num),
FOREIGN KEY (reservation_num_client) REFERENCES Client (client_num)
);

-- CONTRAINTES D'INTEGRITE :
--
-- Reservation : date reservation < date debut < date fin | prix total > montant arrhes
-- 
-- Clé primaire à deux champs de la table Reservation (reservation_num_chambre,reservation_num_client).
-- 
-- Clés étrangères :
--
-- Degrés de confort : S, A, B, C