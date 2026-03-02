-- 1. Afficher la liste des noms des focaccias par ordre alphabétique
-- Résultat attendu : une liste de noms de focaccias triée de A à Z
-- Résultat obtenu : La liste des noms des foccacias est bien triée de A à Z
-- Écart: Aucun. Le tri correspond à l'ordre alphabétique attendu.
-- Requête SQL :

SELECT nom
FROM focaccia
ORDER BY nom ASC;




-- 2. Afficher le nombre total d'ingrédients,
-- Résultat attendu : Champ avec le nombre total d'ingrédients égale à 25
-- Résultat obtenu : 25 ingrédients sont présents dans la table des ingrédients
-- Écart: Aucun. Le résultat correspond aux données présentes dans la base.
-- Requête SQL :

SELECT COUNT(*) AS total_ingredients
FROM ingredient;



-- 3. Afficher le prix moyen des focaccias,
-- Résultat attendu : Calcul du prix moyen des focaccias soit 10.37€
-- Résultat obtenu : 10.38 est le prix moyen des focaccias
-- Écart: L'arrondi à deux décimales donne un résultat arrondi avec SQL au nombre supérieur
-- Requête SQL :

SELECT ROUND(AVG(prix), 2) AS prix_moyen
FROM focaccia;



-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson,
-- Résultat attendu : une liste de noms des boissons avec leur marque triée de A à Z
-- Résultat obtenu : Un tableau avec en colonne 1 le nom des boissons triée par ordre alphabetique et en colonne 2 leurs marques
-- Écart: Aucun. Le tri correspond à l'ordre alphabétique attendu avec le bon nom de marque associé aux boissons.
-- Requête SQL :

SELECT b.nom AS nom_boisson, m.nom AS nom_marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom;



-- 5. Afficher la liste des ingrédients pour une Raclaccia,
-- Résultat attendu : une liste des ingrédients utilisés dans la focaccia Raclaccia
-- Résultat obtenu : Ail ; Base Tomate ; Champignon ; Cresson ; Parmesan ; Poivre ; Raclette
-- Écart: Aucun. La requête retourne la liste des ingrédients de la Raclaccia
-- Requête SQL :

SELECT i.nom AS nom_ingredient
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE f.nom = 'Raclaccia';



-- 6. Afficher le nom et le nombre d'ingrédients pour chaque foccacia,
-- Résultat attendu : les listes des noms de focaccias avec le nombre d'ingrédients associés
-- Résultat obtenu : Un tableau de deux colonnes avec d'un coté le nom des focaccias et en face le nombres d'ingrédient
-- Écart: Aucun. Le résultat correspond aux données présentes dans la base.
-- Requête SQL :

SELECT f.nom AS nom_focaccia, 
COUNT(fi.id_ingredient) AS nombre_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi
ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia, f.nom;



-- 7. Afficher le nom de la focaccia qui a le plus d'ingrédients,
-- Résultat attendu : Champ avec le nom de la focaccia qui a le plus d'ingrédients soit la "Paysanne"
-- Résultat obtenu : Paysanne
-- Écart: Aucun. Le résultat correspond aux données présentes dans la base.
-- Requête SQL :

SELECT f.nom AS nom_focaccia
FROM focaccia f
JOIN focaccia_ingredient fi
ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY COUNT(fi.id_ingredient) DESC
LIMIT 1;



-- 8. Afficher la liste des focaccia qui contiennent de l'ail,
-- Résultat attendu : Liste des noms de focaccias qui contiennent de l'ail
-- Résultat obtenu : Une liste des 4 focaccias contenant de l’ail
-- Écart: Aucun. Le résultat correspond aux données présentes dans la base.
-- Requête SQL :

SELECT DISTINCT f.nom AS nom_focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';



-- 9. Afficher la liste des ingrédients inutilisés,
-- Résultat attendu : une liste de tous les ingrédients qui ne sont pas utilisés soit le salami et les tomate cerises
-- Résultat obtenu : Salami ; Tomate cerise
-- Écart: Aucun. Le résultat correspond aux données présentes dans la base.
-- Requête SQL :

SELECT i.nom AS nom_ingredient
FROM ingredient i
LEFT JOIN focaccia_ingredient fi
ON i.id_ingredient = fi.id_ingredient
WHERE fi.id_ingredient IS NULL;



-- 10. Afficher la liste des focaccia qui n'ont pas de champignons.
-- Résultat attendu : Liste des noms de focaccias qui ne contiennent pas de champignons
-- Résultat obtenu : Américaine ; Hawaienne
-- Écart: Aucun. Le résultat correspond aux données présentes dans la base.
-- Requête SQL :

SELECT f.nom AS nom_focaccia
FROM focaccia f
WHERE f.id_focaccia NOT IN (
    SELECT fi.id_focaccia
    FROM focaccia_ingredient fi
    JOIN ingredient i
    ON fi.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
);