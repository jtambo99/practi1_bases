#include "equipo.h"
#include <iostream>
#include <fstream>
#include <string.h>


void ponerPuntos(Equipo &equipo_loc, Equipo &equipo_visit,int golLoc, int golVis,int jornada){
    if (jornada != 1){
        if (golLoc > golVis){
            equipo_loc.puntos[jornada-1] = equipo_loc.puntos[jornada-2] + 3;
        }
        else if(golLoc < golVis){
             equipo_visit.puntos[jornada-1] = equipo_visit.puntos[jornada-2] + 3;
        }   
        else{
             equipo_visit.puntos[jornada-1] = equipo_visit.puntos[jornada-2] + 1;
             equipo_loc.puntos[jornada-1] = equipo_loc.puntos[jornada-2] + 1;
        }
    }else{
        if (golLoc > golVis){
            equipo_loc.puntos[jornada-1] = 3;
        }
        else if(golLoc < golVis){
             equipo_visit.puntos[jornada-1] = 3;
        }   
        else{
             equipo_visit.puntos[jornada-1] = 1;
             equipo_loc.puntos[jornada-1] = 1;
        }
    }
}
bool posicionEquipo(Equipo equipos[],char nombre[],int &i,int &max_eq){
    bool encontrado = false;
    i = 0;
    while(!encontrado && i < max_eq){
        if(strcmp(equipos[i].nombre,nombre) == 0){
            return true;
        }
        else{
            i++;
        }
    }
    if(!encontrado){
        strcpy(equipos[i].nombre,nombre);
        max_eq++;
        return false;
    }
}
bool jornadaMax(int jor1, int jor2,int &max){
    if(jor1 > jor2){
        max = jor1;
    }
    else{
        max = jor2;
    }
    return jor1>jor2;
}

void europa(Equipo &equipo, int jornadas, char liga[]){
    if (strcmp(liga,equipo.liga) == 0){
    const int PUESTO = 6;
    for (int i = 0; i < jornadas; i++){
        if(equipo.puesto[i] >= PUESTO){
            equipo.puntos[i] = true;
        }
        else{
            equipo.puntos[i] = false;
        }
    }
    }
    else{
        for (int i = 0; i < jornadas; i++){
             equipo.puntos[i] = false;
        }
    }
}

int main(){
    ifstream f("LigaHost.csv");
    ofstream g("Pernetece.csv");
    f.ignore(500,'\n');
    int i,j = 0;
    int max_eq;
    Equipo equipo[MAX_EQUI];
    char nombreLocal[100];
    char nombreVisitante[100];
    int golLoc;
    int golVis;
    int temporadaAct;
    int temporadaSig;
    int jornadaAct;
    int jornadaSig;
    int jorMax = 0;
    char ligaAct [100];
    char ligaSig [100];
    f >> temporadaAct;
    f.getline(ligaAct,50,DELIM);
    f >> jornadaAct;
    bool sigo_temporada_liga = true;
    while(!f.eof()){
            while(sigo_temporada_liga){
                f.getline(nombreLocal,100,DELIM);
                f.getline(nombreVisitante,100,DELIM);
                f >> golLoc;
                f >> golVis;
                posicionEquipo(equipo,nombreLocal,i,max_eq); //Modifica i con el indice del equipo en el vector de equipos.
                posicionEquipo(equipo,nombreVisitante,j,max_eq);
                ponerPuntos(equipo[i], equipo[j], golLoc, golVis, jornadaAct);
                f >> temporadaSig;
                f.getline(ligaAct,50,DELIM);
                f >> jornadaSig;
                sigo_temporada_liga = jornadaMax(jornadaSig,jornadaAct,jorMax);
            }
    }

}