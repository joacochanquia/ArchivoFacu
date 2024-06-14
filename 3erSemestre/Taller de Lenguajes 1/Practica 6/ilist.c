#include <stdlib.h>
#include <stdio.h>

typedef struct nE{
    int dato;
    struct nE *sig;
} nodoE;

typedef struct lE{
    nodoE * l;
    int t;
} listaE;

void inicializarLE(listaE * ptrL){
    ptrL->l = NULL;
    ptrL->t = 0;
}

nodoE * newNodoLE(){
    return (nodoE *)calloc(1, sizeof(nodoE *));
}

void agregarInicioLE(listaE * ptrL, int dato){
    nodoE * nuevo = newNodoLE();
    nuevo->dato = dato;
    nuevo->sig = ptrL->l;
    ptrL->l = nuevo;
    (ptrL->t)++;
}

void agregarFinalLE(listaE * ptrL, int dato){
    nodoE * nuevo = newNodoLE();
    nuevo->dato = dato;
    nuevo->sig = NULL;
    (ptrL->t)++;
    if (ptrL->l == NULL){
        ptrL->l = nuevo;
    }
    else{
        nodoE * aux = ptrL->l;
        int i;
        for(i=1; i<(ptrL->t-1); i++){
            aux = aux->sig;
        }
        aux->sig = nuevo;
    }
}

void agregarAscendenteLE(listaE * ptrL, int dato){
    nodoE * nuevo = newNodoLE();
    nuevo->dato = dato;
    nuevo->sig = NULL;
    (ptrL->t)++;
    if (ptrL->l == NULL){
        ptrL->l = nuevo;
    }
    else{
        if (ptrL->l->dato > dato){
            nuevo->sig = ptrL->l;
            ptrL->l = nuevo;
        }
        else{
            nodoE * aux = ptrL->l;
            while((aux->sig!=NULL)&&(aux->sig->dato < dato)){
                aux = aux->sig;
            }
            nuevo->sig = aux->sig;
            aux->sig = nuevo;
        }
    }
}

void eliminarInicioLE(listaE * ptrL){
    if (ptrL->l!=NULL){
        nodoE * aux = ptrL->l->sig;
        free(ptrL->l);
        ptrL->l = aux;
        (ptrL->t)--;
    }
}

void eliminarFinalLE(listaE * ptrL){
    if (ptrL->l!=NULL){
        nodoE * aux = ptrL->l;
        nodoE * ant;
        while (aux->sig != NULL){
            ant = aux;
            aux = aux->sig;
        }
        free(aux);
        ant->sig = NULL;
        (ptrL->t)--;
    }
}

void eliminarEnLE(listaE * ptrL, int pos){
    if (((ptrL->t)!=0)&&(ptrL->t > pos)){
        (ptrL->t)--;
        if(pos == 0){
            eliminarInicioLE(ptrL);
        }
        else{
            nodoE * aux = ptrL->l;
            nodoE * ant;
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

void vaciarLE(listaE * ptrL){
    while (ptrL->l!=NULL){
        eliminarInicioLE(ptrL);
    }
}
void freeLE(listaE * ptrL){
    vaciarLE(ptrL);
    free(ptrL->l);
}

int estaLE(listaE l, int dato){
    while(l.l!=NULL){
        if(l.l->dato == dato){
            return 1;
        }
        l.l = l.l->sig;
    }
    return 0;
}

int tamanioLE(listaE l){
    return l.t;
}

void imprimirLE(listaE l){
    if (l.l != NULL){
        int i;
        for(i=1; i<l.t; i++){
            printf("%d - ", l.l->dato);
            l.l = l.l->sig;
        }
        printf("%d\n", l.l->dato);
    }
}

listaE inversaLE(listaE l){
    listaE aux;
    inicializarLE(&aux);
    while (l.l != NULL){
        agregarInicioLE(&aux, l.l->dato);
        l.l = l.l->sig;
    }
    return aux;
}

void eliminarMultiplosLE(listaE * ptrL, int n){
    if (ptrL->l!=NULL){
        nodoE * aux = ptrL->l;
        nodoE * prox;
        int pos = 0;
        while (aux != NULL){
            prox = aux->sig;
            if ((aux->dato % n) == 0){
                eliminarEnLE(ptrL, pos);
            }
            else{
                pos++;
            }
            aux = prox;
        }
    }
}

void paresImpares(listaE l, listaE * pares, listaE * impares){
    int i;
    for(i=0; i<l.t; i++){
        agregarFinalLE(((l.l->dato&1)? impares : pares) , l.l->dato);
        l.l = l.l->sig;
    }
}
