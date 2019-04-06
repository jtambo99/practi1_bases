#ifndef EQUIPO_H
#define EQUIPO_H
#include <string>
using namespace std;
const int MAX_JOR = 50;
const char DELIM = ',';
const int MAX_EQUI = 300;
class Equipo{
    public:
        char nombre[100];
        int jornada[MAX_JOR];
        int temporada;
        char liga[100];
        bool europa[MAX_JOR];
        int asc_des[MAX_JOR]; //ascenso = 0, descenso = 1, permanencia=2 promocion = 3
        int puesto[MAX_JOR];
        int puntos[MAX_JOR];
        int golesFavor[MAX_JOR];
        int golesContra[MAX_JOR];
    public:
        string give_nombre();
};
#endif