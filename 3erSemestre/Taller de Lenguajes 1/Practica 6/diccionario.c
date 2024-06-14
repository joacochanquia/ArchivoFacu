
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "slist.h"

typedef listaS diccionario;

diccionario newDicc(){
    diccionario d;
    inicializarLS(&d);
    return d;
}

int estaDicc(diccionario d,const char * p){
    int i;
    for(i=0; i<(d.t); i++){
        if (!strcmp(d.l->dato, p)){
            return 1;
        }
        d.l = d.l->sig;
    }
    return 0;
}

int agregarDicc(diccionario * ptrD,const char * p){
    if (!estaDicc(*ptrD, p)){
        agregarInicioLS(ptrD, p);
        return 1;
    }
    return 0;
}

int eliminarDicc(diccionario * ptrD, const char * p){
    int i = posLS(*ptrD, p);
    if (i >= 0){
        eliminarEnLS(ptrD, i);
        return 1;
    }
    return 0;
}

diccionario cargarDicc(FILE * f){
    diccionario d = newDicc();
    char palabra[31];
    fseek(f, 0, SEEK_SET);
    fscanf(f, "%s\n", palabra);
    while(!feof(f)){
        agregarDicc(&d, palabra);
        fscanf(f, "%s\n", palabra);
    }
    return d;
}

void guardarDicc(diccionario d, FILE * f){
    int i;
    for(i=0; i<(d.t); i++){
        fprintf(f, "%s\n", d.l->dato);
        d.l = d.l->sig;
    }
}

void freeDicc(diccionario * d){
    freeLS(d);
}
