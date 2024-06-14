#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct nS{
    char * dato;
    struct nS *sig;
} nodoS;

typedef struct {
    nodoS * l;
    int t;
} listaS;

void inicializarLS(listaS * ptrL){
    ptrL->l = NULL;
    ptrL->t = 0;
}

nodoS * newNodoLS(){
    nodoS * nuevo = (nodoS *) calloc(1, sizeof(nodoS *));
    nuevo->dato = (char *) calloc(50, sizeof(char));
    return nuevo;
}

void agregarInicioLS(listaS * ptrL, const char * dato){
    nodoS * nuevo = newNodoLS();
    strcpy(nuevo->dato, dato);
    nuevo->sig = ptrL->l;
    ptrL->l = nuevo;
    (ptrL->t)++;
}

void agregarFinalLS(listaS * ptrL, const char * dato){
    nodoS * nuevo = newNodoLS();
    strcpy(nuevo->dato, dato);
    nuevo->sig = NULL;
    (ptrL->t)++;
    if (ptrL->l == NULL){
        ptrL->l = nuevo;
    }
    else{
        nodoS * aux = ptrL->l;
        int i;
        for(i=1; i<(ptrL->t-1); i++){
            aux = aux->sig;
        }
        aux->sig = nuevo;
    }
}

void agregarAscendenteLS(listaS * ptrL,const char * dato){
    nodoS * nuevo = newNodoLS();
    strcpy(nuevo->dato, dato);
    nuevo->sig = NULL;
    (ptrL->t)++;
    if (ptrL->l == NULL){
        ptrL->l = nuevo;
    }
    else{
        if (strcmp(ptrL->l->dato, dato) > 0){
            nuevo->sig = ptrL->l;
            ptrL->l = nuevo;
        }
        else{
            nodoS * aux = ptrL->l;
            while((aux->sig!=NULL)&&(strcmp(aux->sig->dato, dato) < 0)){
                aux = aux->sig;
            }
            nuevo->sig = aux->sig;
            aux->sig = nuevo;
        }
    }
}

void eliminarInicioLS(listaS * ptrL){
    if (ptrL->l!=NULL){
        nodoS * aux = ptrL->l->sig;
        free(ptrL->l);
        ptrL->l = aux;
        (ptrL->t)--;
    }
}

void eliminarFinalLS(listaS * ptrL){
    if (ptrL->l!=NULL){
        nodoS * aux = ptrL->l;
        nodoS * ant;
        while (aux->sig != NULL){
            ant = aux;
            aux = aux->sig;
        }
        free(aux);
        ant->sig = NULL;
        (ptrL->t)--;
    }
}

void eliminarEnLS(listaS * ptrL, int pos){
    if (((ptrL->t)!=0)&&(ptrL->t > pos)){
        (ptrL->t)--;
        if(pos == 0){
            eliminarInicioLS(ptrL);
        }
        else{
            nodoS * aux = ptrL->l;
            nodoS * ant;
            int posAct = 0;
            while ((aux != NULL) && (posAct != pos)){
                ant = aux;
                posAct++;
                aux = aux->sig;
            }
            if (aux != NULL){
                ant->sig = aux->sig;
                free(aux);
            }
        }
    }
}

void vaciarLS(listaS * ptrL){
    while (ptrL->l!=NULL){
        eliminarInicioLS(ptrL);
    }
}
void freeLS(listaS * ptrL){
    vaciarLS(ptrL);
    free(ptrL->l);
}

int estaLS(listaS l, const char * dato){
    while(l.l!=NULL){
        if(!(strcmp(l.l->dato, dato))){
            return 1;
        }
        l.l = l.l->sig;
    }
    return 0;
}

int posLS(listaS l, const char * dato){
    int i = 0;
    while(l.l!=NULL){
        if(!(strcmp(l.l->dato, dato))){
            return i;
        }
        i++;
        l.l = l.l->sig;
    }
    return -1;
}

int tamanioLS(listaS l){
    return l.t;
}

void imprimirLS(listaS l){
    if (l.l != NULL){
        int i;
        for(i=1; i<l.t; i++){
            printf("%s - ", l.l->dato);
            l.l = l.l->sig;
        }
        printf("%s\n", l.l->dato);
    }
}

listaS inversaLS(listaS l){
    listaS aux;
    inicializarLS(&aux);
    while (l.l != NULL){
        agregarInicioLS(&aux, l.l->dato);
        l.l = l.l->sig;
    }
    return aux;
}
