/*Juan José Tambo, Jesús Villacampa, Fernando Navarro*/
/*Muestra los puntos de cada equipo de cada temporada*/
SELECT Num_temporada,Nom_equip,max(Puntos) AS Puntos
FROM Participar
GROUP BY Nom_equip,Num_temporada;
