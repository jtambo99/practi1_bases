SELECT DISTINCT Nom_equip
FROM Participar
WHERE Puntos = (SELECT (MAX(Puntos)) FROM Participar) AND Num_jornada = '38' AND Nom_liga = '1'
GROUP BY Nom_equip
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) AS total
                    FROM Participar
                    WHERE Puntos = (SELECT (MAX(Puntos)) FROM Participar) AND Num_jornada = '38' AND Nom_liga = '1'
                    GROUP BY Nom_equip);