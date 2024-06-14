#ifndef ILIST_H_INCLUDED
#define ILIST_H_INCLUDED

typedef struct nE{
    int dato;
    struct nE *sig;
} nodoE;

typedef struct {
    nodoE * l;
    int t;
} listaE;

void inicializarLE(listaE * ptrL);
nodoE * newNodoLE();
void vaciarLE(listaE * ptrL);
void freeLE(listaE * ptrL);
int estaLE(listaE l, int dato);
void eliminarInicioLE(listaE * ptrL);
void eliminarFinalLE(listaE * ptrL);
void eliminarEnLE(listaE * ptrL, int pos);
void agregarInicioLE(listaE * ptrL, int dato);
void agregarFinalLE(listaE * ptrL, int dato);
void agregarAscendenteLE(listaE * ptrL, int dato);
int tamanioLE(listaE l);
void imprimirLE(listaE l);
listaE inversaLE(listaE l);
void eliminarMultiplosLE(listaE * l, int n);
void paresImpares(listaE l, listaE* pares, listaE* impares);

#endif // ILIST_H_INCLUDED
