-- Donnée du tableau des marques
INSERT INTO marque (nom) VALUES
("Coca-Cola"),
("Cristaline"),
("Monster"),
("Persico"); 

-- Donnée du tableau des boissons
INSERT INTO boisson (nom, id_marque) VALUES
("Coca-Cola zéro", 1),
("Coca-Cola original", 1),
("Fanta citron", 1),
("Fanta orange", 1),
("Capri-Sun", 1),
("Pepsi", 4),
("Pepsi Max Zéro", 4),
("Lipton zéro citron", 4),
("Lipton Peach", 4),
("Monster energy ultra gold", 3),
("Monster energy ultra blue", 3),
("Eau de source ", 2);

-- Donnée du tableau des focaccias
INSERT INTO focaccia (nom, prix) VALUES
("Mozaccia", 9.80),
("Gorgonzollaccia", 10.80),
("Raclaccia", 8.90),
("Emmentalaccia", 9.80),
("Tradizione", 8.90),
("Hawaienne", 11.20),
("Américaine", 10.80),
("Paysanne", 12.80);

-- Donnée du tableau des ingrédients
INSERT INTO ingredient (nom) VALUES
("Ail"),
("Annanas"),
("Artichaut"),
("Bacon"),
("Base Tomate"),
("Base Crème"),
("Champignon"),
("Chèvre"),
("Cresson"),
("Emmental"),
("Gorgonzola"),
("Jambon cuit"),
("Jambon fumé"),
("Oeuf"),
("Oignon"),
("Olive noire"),
("Olive verte"),
("Parmesan"),
("Piment"),
("Poivre"),
("Pomme de terre"),
("Raclette"),
("Salami"),
("Tomate cerise"),
("Mozzarella");

-- Donnée du tableau de liaison focaccia-ingredient
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES

-- Mozaccia
(1, 5, 200),    -- Base tomate
(1, 25, 50),    -- Mozarella
(1, 9, 20),     -- Cresson
(1, 13, 80),    -- Jambon fumé
(1, 1, 2),      -- Ail
(1, 3, 20),     -- Artichaut
(1, 7, 40),     -- Champignon
(1, 18, 50),    -- Parmesan
(1, 20, 1),     -- Poivre
(1, 16, 20),    -- Olive noire

-- Gorgonzollaccia
(2, 5, 200),    -- Base tomate
(2, 11, 50),    -- Gorgonzola
(2, 9, 20),     -- Cresson
(2, 1, 2),      -- Ail
(2, 7, 40),     -- Champignon
(2, 18, 50),    -- Parmesan
(2, 20, 1),     -- Poivre
(2, 16, 20),    -- Olive noire

-- Raclaccia
(3, 5, 200),    -- Base tomate
(3, 22, 50),    -- Raclette
(3, 9, 20),     -- Cresson
(3, 1, 2),      -- Ail
(3, 7, 40),     -- Champignon
(3, 18, 50),    -- Parmesan
(3, 20, 1),     -- Poivre

-- Emmentalaccia
(4, 6, 200),    -- Base crème
(4, 10, 50),    -- Emmental
(4, 9, 20),     -- Cresson
(4, 7, 40),     -- Champignon
(4, 18, 50),    -- Parmesan
(4, 20, 1),     -- Poivre
(4, 15, 20),    -- Oignon

-- Tradizione
(5, 5, 200),    -- Base tomate
(5, 25, 50),    -- Mozzarella
(5, 9, 20),     -- Cresson
(5, 12, 80),    -- Jambon cuit
(5, 7, 80),     -- Champignon (modification par rapport au standard)
(5, 18, 50),    -- Parmesan
(5, 20, 1),     -- Poivre
(5, 16, 10),    -- Olive noire (modification)
(5, 17, 10),    -- Olive verte (modification)

-- Hawaienne
(6, 5, 200),    -- Base tomate
(6, 25, 50),    -- Mozzarella
(6, 9, 20),     -- Cresson
(6, 4, 80),     -- Bacon
(6, 2, 40),     -- Ananas
(6, 18, 50),    -- Parmesan
(6, 20, 1),     -- Poivre
(6, 16, 20),    -- Olive noire
(6, 19, 2),     -- Piment

-- Américaine
(7, 5, 200),    -- Base tomate
(7, 25, 50),    -- Mozzarella
(7, 9, 20),     -- Cresson
(7, 4, 80),     -- Bacon
(7, 21, 80),    -- Pomme de terre (modification)
(7, 18, 50),    -- Parmesan
(7, 20, 1),     -- Poivre
(7, 16, 20),    -- Olive noire

-- Paysanne
(8, 6, 200),    -- Base crème
(8, 8, 50),     -- Chèvre
(8, 9, 20),     -- Cresson
(8, 21, 80),    -- Pomme de terre
(8, 13, 80),    -- Jambon fumé
(8, 1, 2),      -- Ail
(8, 6, 20),     -- Artichaut
(8, 7, 40),     -- Champignon
(8, 18, 50),    -- Parmesan
(8, 20, 1),     -- Poivre
(8, 16, 20),    -- Olive noire
(8, 14, 50);    -- Œuf

--Donnée test

--Clients
INSERT INTO client (nom, email, code_postal) VALUES
('Alice Dupont', 'alice@mail.com', '69001'),
('Bob Martin', 'bob@mail.com', '69002'),
('Chloé Bernard', 'chloe@mail.com', '69003');

--Commandes
INSERT INTO commande (id_client, id_focaccia, id_boisson, date_achat) VALUES
(1, 3, 1, '2026-02-25'),  -- Alice achète Raclaccia + Coca-Cola zéro
(2, 1, 10, '2026-02-26'), -- Bob achète Mozaccia + Monster energy ultra gold
(3, 5, 5, '2026-02-27');  -- Chloé achète Tradizione + Capri-Sun