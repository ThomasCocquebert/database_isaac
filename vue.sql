CREATE VIEW V_player_Obj_dmg(Nom, Effet)
AS SELECT objet.nom, objet.descrip
FROM objet
WHERE objet.descrip LIKE '%DMG%';

CREATE VIEW V_player_Obj_devil_deal(Nom, Effet)
AS SELECT objet.nom, objet.descrip
FROM objet
WHERE objet.pool LIKE '%7%';

CREATE VIEW V_player_Obj_complet(Nom, Description, Pool, Transformation)
AS SELECT objet.nom, objet.descrip, item_pool.nom, transformation.nom
FROM objet, item_pool, transformation
WHERE objet.transfo = transformation.id_transfo AND objet.pool = item_pool.id_pool;

CREATE VIEW V_admin_Type_tear_modifier(Nom, Pool, Transformation)
AS SELECT objet.nom, item_pool.nom, transformation.nom
FROM objet, item_pool, transformation, type
WHERE type.nom = 'Tear Modifier' AND type.obj = objet.id_obj 
AND objet.transfo = transformation.id_transfo AND objet.pool = item_pool.id_pool;