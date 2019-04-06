#include "equipo.h"
#include <iostream>
#include <fstream>
#include <string.h>


void ponerPuntos(Equipo &equipo_loc, Equipo &equipo_visit,int golLoc, int golVis,int jornada){
    if (jornada != 1){
        if (golLoc > golVis){
            equipo_loc.puntos[jornada-1] = equipo_loc.puntos[jornada-2] + 3;
            equipo_visit.puntos[jornada-1] = equipo_visit.puntos[jornada-2];
        }
        else if(golLoc < golVis){
             equipo_visit.puntos[jornada-1] = equipo_visit.puntos[jornada-2] + 3;
             equipo_loc.puntos[jornada-1] = equipo_loc.puntos[jornada-2];
        }   
        else{
             equipo_visit.puntos[jornada-1] = equipo_visit.puntos[jornada-2] + 1;
             equipo_loc.puntos[jornada-1] = equipo_loc.puntos[jornada-2] + 1;
        }
    }else{
        if (golLoc > golVis){
            equipo_loc.puntos[jornada-1] = 3;
            equipo_visit.puntos[jornada-1] = 0;
        }
        else if(golLoc < golVis){
             equipo_visit.puntos[jornada-1] = 3;
             equipo_loc.puntos[jornada-1] = 0;
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
    return jor1>jor2;
}

// void europa(Equipo &equipo, int jornadas, char liga[]){
//     if (strcmp(liga,equipo.liga) == 0){
//     const int PUESTO = 6;
//     for (int i = 0; i < jornadas; i++){
//         if(equipo.puesto[i] >= PUESTO){
//             equipo.europa[i] = true;
//         }
//         else{
//             equipo.europa[i] = false;
//         }
//     }
//     }
//     else{
//         for (int i = 0; i < jornadas; i++){
//              equipo.europa[i] = false;
//         }
//     }
// }

// void sacarPuestos(Equipo equipos[],int jornadas, int num_eq){
//     for(int i = 0; i < jornadas; i++){
//         for(int j = 0; j < num_eq; j++){
//             equipos[j].puesto[i] = 10;
//         }
//     }
// }
// void asc_des(Equipo equipo,int jornadas, char liga[]){
//     if (strcmp(liga,"1ª") == 0){
//         for (int i = 0; i < jornadas; i++){
//             if(equipo.puesto[i] <= 18){
//                 equipo.asc_des[i] = 1;
//             }else{
//                 equipo.asc_des[i] = 2;
//             }
//     }
//     }else if(strcmp(liga,"2ª") == 0){
//         for (int i = 0; i < jornadas; i++){
//             if(equipo.puesto[i] <= 18){
//                 equipo.asc_des[i] = 1;
//             }else if(equipo.puesto[i] >= 2){
//                 equipo.asc_des[i] = 0;
//             }
//             else if(equipo.puesto[i] >= 6){
//                 equipo.asc_des[i] = 3;
//             }
//             else{
//                 equipo.asc_des[i] = 2;
//             }
//         }
//     }
// }
void escribirFlujo(ofstream &g, Equipo equipo[], int jorMax, int temporadaAct, char ligaAct[], int max_eq){
    //g << "Num_temporada, Nom_liga, Num_jornada, Nom_equip, Puntos" << endl;
        for(int i = 0; i < jorMax; i++){
            for(int j = 0; j < max_eq; j++){
                g << temporadaAct << "," << ligaAct << "," << i+1 << "," << equipo[j].nombre << ","<< equipo[j].puntos[i] << endl;
        }
    }
}

int main(){
    ifstream f("LigaBase.csv");
    ofstream g("Pertenece.csv");
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
    char c;
    f.get(c);
    f.getline(ligaAct,50,DELIM);
    f >> jornadaAct;
    jornadaSig = jornadaAct;
    f.get(c);
    bool sigo_temporada_liga = true;
            while(sigo_temporada_liga){
                f.getline(nombreLocal,100,DELIM);
                f.getline(nombreVisitante,100,DELIM);
                f >> golLoc;
                f.get(c);
                f >> golVis;
                posicionEquipo(equipo,nombreLocal,i,max_eq); //Modifica i con el indice del equipo en el vector de equipos.
                posicionEquipo(equipo,nombreVisitante,j,max_eq);
                ponerPuntos(equipo[i], equipo[j], golLoc, golVis, jornadaSig);
                cout<<jornadaSig <<equipo[i].nombre << equipo[i].puntos[jornadaSig-1]<<endl;
                cout<<jornadaSig <<equipo[j].nombre << equipo[j].puntos[jornadaSig-1]<<endl;
                f >> temporadaSig;
                f.get(c);
                f.getline(ligaSig,50,DELIM);
                f >> jornadaSig;
                f.get(c);
                jornadaMax(jornadaSig,jornadaAct,jorMax);
                sigo_temporada_liga = strcmp(ligaAct,ligaSig) == 0;
                
            }
            // sacarPuestos(equipo,jorMax,max_eq);
            // for (int i = 0; i < max_eq; i++){
            //     asc_des(equipo[i],jorMax,ligaAct);
            //     europa(equipo[i],jorMax,ligaAct);
            // }
            escribirFlujo(g,equipo,jorMax,temporadaAct,ligaAct,max_eq);
}