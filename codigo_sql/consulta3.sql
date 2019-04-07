/*Juan José Tambo, Jesús Villacampa, Fernando Navarro*/
SELECT Num_temporada,max(Gol_local+Gol_visitante) AS GOLES
FROM Partido
group by Num_temporada
HAVING Num_temporada BETWEEN 2011 AND 2016;