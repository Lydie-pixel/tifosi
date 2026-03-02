CREATE DATABASE tifosi;
USE tifosi;

-- Table Marques
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- Table Boissons
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL, 
    id_marque INT,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

-- Table Focaccias
CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL
);

-- Table Ingrédients
CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- Table de liaison Focaccia-Ingrédient
CREATE TABLE focaccia_ingredient (
    id_focaccia INT,
    id_ingredient INT,
    quantite INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);

-- Table Clients
CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal VARCHAR(6) NOT NULL
);

-- Table de liaison Client-Boisson-Focaccia
CREATE TABLE commande (
    id_commande INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT NOT NULL,
    id_focaccia INT,
    id_boisson INT,
    date_achat DATE,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);