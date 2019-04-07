CREATE VIEW PUNTOS_TEMPORADA AS
SELECT Num_temporada,Nom_equip,max(Puntos) AS Puntos
FROM Participar
WHERE Nom_liga='1'
GROUP BY Nom_equip,Num_temporada;

SELECT Num_temporada,Nom_equip,max(Puntos)
FROM PUNTOS_TEMPORADA
GROUP BY Num_temporada;