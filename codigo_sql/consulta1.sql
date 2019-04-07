/*Juan José Tambo, Jesús Villacampa, Fernando Navarro*/
CREATE VIEW año2004 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2004';
CREATE VIEW año2005 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2005';
CREATE VIEW año2006 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2006';
CREATE VIEW año2007 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2007'
AND Nom_liga = '1';
CREATE VIEW año2008 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada,Nom_liga
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2008';
CREATE VIEW año2009 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2009';
CREATE VIEW año2010 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2010';
CREATE VIEW año2011 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2011';
CREATE VIEW año2012 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2012';
CREATE VIEW año2013 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2013';
CREATE VIEW año2014 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2014';
CREATE VIEW año2015 AS
SELECT Nom_equip,Puntos,Num_jornada,Num_temporada
FROM Participar
WHERE Num_jornada = '38'
AND Num_temporada = '2015';
SELECT Puntos,Nom_equip FROM año2004 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2004);
SELECT Puntos,Nom_equip FROM año2005 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2005);
SELECT Puntos,Nom_equip FROM año2006 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2006);
SELECT Puntos,Nom_equip FROM año2007 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2007);
SELECT Puntos,Nom_equip FROM año2008 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2008);
SELECT Puntos,Nom_equip FROM año2009 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2009);
SELECT Puntos,Nom_equip FROM año2010 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2010);
SELECT Puntos,Nom_equip FROM año2011 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2011);
SELECT Puntos,Nom_equip FROM año2012 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2012);
SELECT Puntos,Nom_equip FROM año2013 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2013);
SELECT Puntos,Nom_equip FROM año2014 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2014);
SELECT Puntos,Nom_equip FROM año2015 WHERE Puntos = (SELECT (MAX(Puntos)) FROM año2015);
