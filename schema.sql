-- ===================== Création de la base =====================


CREATE DATABASE IF NOT EXISTS tifosi;
USE tifosi;


-- ===================== Création utilisateur MySQL pour la base tifosi =====================

-- Note : Dans un contexte professionnel, le mot de passe et
-- l'identifiant seraient stocké dans un fichier sécurisé (.env)

CREATE USER IF NOT EXISTS 'tifosi_user'@'localhost'
IDENTIFIED BY 'Tifosi2026!';

GRANT ALL PRIVILEGES
ON tifosi.*
TO 'tifosi_user'@'localhost';

FLUSH PRIVILEGES;



-- ===================== Création des tables MySQL pour la base de donnée tifosi =====================

-- Table des Marques
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

-- Table des Boissons
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL, 
    id_marque INT,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

-- Table des Focaccias
CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL
);

-- Table des Ingrédients
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

-- Table des Clients
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
    date_achat DATE NOT NULL,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);