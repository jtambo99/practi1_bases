SELECT Num_temporada,Num_jornada,max(Gol_local+Gol_visitante)
FROM Partido
-- WHERE Num_temporada BETWEEN 2016 AND 2011
group by Num_temporada,Num_jornada