CREATE TABLE Equipo ( /*Poblador Works*/
    Nom_equip           VARCHAR(50) CONSTRAINT PK_Equipo PRIMARY KEY,
    Nom_oficial         VARCHAR(50) CONSTRAINT NN_nomOf NOT NULL,
    Nom_historico       VARCHAR(50),
    Otros_nombres       VARCHAR(50),
    Ciudad              VARCHAR(50) CONSTRAINT NN_city NOT NULL,
    Fundacion           NUMBER(4)   CONSTRAINT NN_fund NOT NULL
);

CREATE TABLE Estadio ( /*Poblador Works*/
    Nom_estadio         VARCHAR(50) CONSTRAINT PK_Estadio PRIMARY KEY,
    Capacidad           NUMBER(6)   CONSTRAINT NN_capacidad NOT NULL,
    Inaguracion         NUMBER(4),
    Comunidad           VARCHAR(50) CONSTRAINT NN_Comun  NOT NULL 
);

CREATE TABLE Liga ( /*Poblador Works*/
    Nom_liga            VARCHAR(20) CONSTRAINT PK_Liga PRIMARY KEY
);

CREATE TABLE Tener ( /*Poblador Works*/
    Nom_equip           VARCHAR(50),
    Nom_estadio         VARCHAR(50),
    CONSTRAINT PK_Tener PRIMARY KEY (Nom_equip,Nom_estadio),
    CONSTRAINT FK_TenerEqui     FOREIGN KEY (Nom_equip) REFERENCES Equipo(Nom_equip)
                                                    ON DELETE CASCADE,  
    CONSTRAINT FK_TenerEstadio  FOREIGN KEY (Nom_estadio) REFERENCES Estadio(Nom_estadio)
                                                    ON DELETE CASCADE                                
);

CREATE TABLE Temporada ( /*Poblador Works*/
    Num_temporada       VARCHAR(12),
    Nom_liga            VARCHAR(20),
    CONSTRAINT PK_temporada PRIMARY KEY (Num_temporada,Nom_liga),
    CONSTRAINT FK_TempLig   FOREIGN KEY (Nom_liga) REFERENCES Liga(Nom_liga)
                                                    ON DELETE CASCADE
);

CREATE TABLE Jornada ( /*Poblador Works*/
    Num_jornada         NUMBER(2),
    Num_temporada       VARCHAR(12),
    Nom_liga            VARCHAR(20),
    CONSTRAINT PK_jornada      PRIMARY KEY (Num_jornada,Num_temporada,Nom_liga),
    CONSTRAINT FK_JorTempLig   FOREIGN KEY (Num_temporada,Nom_liga) REFERENCES Temporada(Num_temporada,Nom_liga)
                                                    ON DELETE CASCADE
);     

CREATE TABLE Participar (
    Nom_equip           VARCHAR(50),
    Num_jornada         NUMBER(2),
    Num_temporada       VARCHAR(12),
    Nom_liga            VARCHAR(20),
    Europa              NUMBER(1),
    Puntos              NUMBER(3) CONSTRAINT NN_puntos  NOT NULL,
    Puesto              NUMBER(2),
    asc_desc            NUMBER(1),
    CONSTRAINT PK_participar    PRIMARY KEY (Nom_equip,Num_jornada,Num_temporada,Nom_liga),
    CONSTRAINT FK_partEquip     FOREIGN KEY (Nom_equip)  REFERENCES Equipo(Nom_equip)
                                                    ON DELETE CASCADE,
    CONSTRAINT FK_particJor     FOREIGN KEY (Num_jornada,Num_temporada,Nom_liga) REFERENCES Jornada(Num_jornada,Num_temporada,Nom_liga)
                                                    ON DELETE CASCADE
);

CREATE TABLE Partido (
    Nom_eqloc          VARCHAR(50),
    Nom_eqvis          VARCHAR(50),
    Num_jornada         NUMBER(2),
    Num_temporada       VARCHAR(12),
    Nom_liga            VARCHAR(20),
    Gol_local           NUMBER(2) CONSTRAINT NN_local NOT NULL,
    Gol_visitante       NUMBER(2) CONSTRAINT NN_visit NOT NULL,
    CONSTRAINT PK_partido          PRIMARY KEY (Nom_eqloc,Nom_eqvis,Num_jornada,Num_temporada,Nom_liga),
    CONSTRAINT FK_nomEqParLoc      FOREIGN KEY (Nom_eqloc) REFERENCES Equipo(Nom_equip)
                                                    ON DELETE CASCADE,  
    CONSTRAINT FK_nomEqParVis      FOREIGN KEY (Nom_eqvis) REFERENCES Equipo(Nom_equip)
                                                    ON DELETE CASCADE,
    CONSTRAINT FK_jorPar           FOREIGN KEY (Num_jornada,Num_temporada,Nom_liga) REFERENCES Jornada(Num_jornada,Num_temporada,Nom_liga)
                                                    ON DELETE CASCADE
);