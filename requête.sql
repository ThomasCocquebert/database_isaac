#Simple requête

#Affiche tout les objets avec leur numéro de transformation et leur numero de pool
SELECT objet.nom, objet.transfo, objet.pool
FROM objet;

#Affiche tout les types possible
SELECT DISTINCT type.nom
FROM type;

#Affiche tout les consommables
SELECT consommable.nom, consommable.descrip
FROM consommable;

#Requête avec jointure

#Affiche le nom des objets, leur transforamtion et la desciption de celle ci
SELECT objet.nom, transformation.nom, transformation.descrip
FROM objet
INNER JOIN transformation
ON objet.transfo = transformation.id_transfo;

#Affiche tout les consommables de type = Card
SELECT DISTINCT consommable.nom, consommable.descrip
FROM consommable
INNER JOIN type
ON consommable.nom_type = 'Card';

#Affiche le type des objets et leur nom
SELECT type.nom, objet.nom
FROM type
INNER JOIN objet
ON type.obj = objet.id_obj;

#Requête avec sous-requête

#Affiche tout les objets qui ne sont pas dans la pool item room
SELECT DISTINCT objet.nom, transformation.nom, item_pool.nom
FROM objet, transformation, item_pool
WHERE objet.transfo = transformation.id_transfo AND objet.pool = item_pool.id_pool
AND (objet.pool) NOT IN(
    SELECT objet.pool
    FROM objet
    WHERE objet.pool LIKE '%1%'
    );

#Affiche les objets ayant speed dans leur description de toute les pool sauf ITM
SELECT DISTINCT objet.nom, objet.descrip
FROM objet, transformation, item_pool
WHERE objet.descrip LIKE '%Speed%' OR objet.descrip LIKE '%speed%'
AND (objet.nom, transformation.nom, item_pool.nom) IN
(SELECT DISTINCT objet.nom, transformation.nom, item_pool.nom
FROM objet, transformation, item_pool
WHERE objet.transfo = transformation.id_transfo AND objet.pool = item_pool.id_pool
AND (objet.pool) NOT IN(
    SELECT objet.pool
    FROM objet
    WHERE objet.pool LIKE '%1%'
    )
 );


#Requête avec agréat

#Affiche le nombre d objet dans chaque pool
SELECT item_pool.nom, COUNT(objet.id_obj)
FROM item_pool, objet
WHERE item_pool.id_pool = objet.pool
GROUP BY item_pool.nom;

#Affiche le nombre d objet, de trinket et de consommable
SELECT COUNT(DISTINCT objet.id_obj) AS nb_objet, COUNT(DISTINCT trinket.id_trin) AS nb_trin, COUNT(DISTINCT consommable.nom) AS nb_conso
FROM objet, trinket, consommable

#MàJ de la base
INSERT INTO objet VALUES
(999, 'test', 'Ceci est une description', 0, 999);

UPDATE objet
SET objet.nom = 'SQL 4 3V3R', objet.descrip = UPPER(objet.descrip)
WHERE objet.id_obj = 999;

DELETE FROM objet
WHERE objet.id_obj = 999;

ALTER TABLE objet
ADD COLUMN testsql int (1);

ALTER TABLE objet
DROP objet.testsql;
