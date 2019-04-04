/*Creación de tablas*/
CREATE TABLE Equipo (
    Nom_equip           VARCHAR(50) CONSTRAINT PK_Equipo PRIMARY KEY,
    Nom_oficial         VARCHAR(50) CONSTRAINT NN_nomOf NOT NULL,
    Nom_historicNo      VARCHAR(50),
    Otros_nombres       VARCHAR(50),
    Ciudad              VARCHAR(50) CONSTRAINT NN_city NOT NULL,
    Fundacion           NUMBER(4)   CONSTRAINT NN_fund NOT NULL
);

CREATE TABLE Estadio (
    Nom_estadio              VARCHAR(50) CONSTRAINT PK_Estadio PRIMARY KEY,
    Capacidad           NUMBER(6)   CONSTRAINT NN_capacidad NOT NULL,
    Inaguracion         NUMBER(4)   CONSTRAINT NN_inagur NOT NULL
);

CREATE TABLE Liga (
    Nom_liga              VARCHAR(20) CONSTRAINT PK_Liga PRIMARY KEY
);

CREATE TABLE Tener (
    Nom_equip           VARCHAR(50),
    Nom_estadio         VARCHAR(50),
    CONSTRAINT PK_Tener PRIMARY KEY (Nom_equip,Nom_estadio),
    CONSTRAINT FK_TenerEqui     FOREIGN KEY (Nom_equip) REFERENCES Equipo(Nom_equip)
                                                    ON DELETE CASCADE,  
    CONSTRAINT FK_TenerEstadio  FOREIGN KEY (Nom_estadio) REFERENCES Estadio(Nom_estadio)
                                                    ON DELETE CASCADE
                                                  
);

CREATE TABLE Jornada (
    Num_jornada         NUMBER(2),
    Num_temporada       NUMBER(4), /*No estoy seguro*/
    Nom_liga            VARCHAR(20),
    CONSTRAINT PK_jornada   PRIMARY KEY (Num_jornada,Num_temporada,Nom_liga),
    CONSTRAINT FK_JorTemp   FOREIGN KEY (Num_temporada) REFERENCES Temporada(Num_temporada)
                                                    ON DELETE CASCADE,
    CONSTRAINT FK_JorLig    FOREIGN KEY (Nom_liga)      REFERENCES Liga(Nom_liga)                                                   
                                                    ON DELETE CASCADE
);          

CREATE TABLE Temporada (
    Num_temporada       NUMBER(4),
    Nom_liga            VARCHAR(20),
    CONSTRAINT PK_temporada PRIMARY KEY (Num_temporada,Nom_liga),
    CONSTRAINT FK_TempLig   FOREIGN KEY (Nom_liga) REFERENCES Liga(Nom_liga)
                                                    ON DELETE CASCADE
);

CREATE TABLE Participar (
    /*Tengo dudas*/
);