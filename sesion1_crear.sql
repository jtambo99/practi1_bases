/*Creación de tablas*/
CREATE TABLE Equipo (
    Nombre_corto        VARCHAR(50) PRIMARY KEY,
    Nombre_oficial      VARCHAR(50) NOT NULL,
    Nombre_historico    VARCHAR(50),
    Otros_nombres       VARCHAR(50),
    Ciudad              VARCHAR(50) NOT NULL,
    Fundacion           NUMBER(4) NOT NULL
);

CREATE TABLE Estadio (
    Nombre              VARCHAR(50) PRIMARY KEY,
    Capacidad           NUMBER(6) NOT NULL,
    Inaguracion         NUMBER(4) NOT NULL
);

CREATE TABLE Liga (
    Nombre              VARCHAR(20) PRIMARY KEY
);

