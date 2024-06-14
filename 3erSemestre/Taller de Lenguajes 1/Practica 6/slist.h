#ifndef SLIST_H_INCLUDED
#define SLIST_H_INCLUDED

typedef struct nS{
    char * dato;
    struct nS *sig;
} nodoS;

typedef struct {
    nodoS * l;
    int t;
} listaS;

void inicializarLS(listaS * ptrL);
nodoS * newNodoLS();
void agregarInicioLS(listaS * ptrL, const char * dato);
void agregarFinalLS(listaS * ptrL, const char * dato);
void agregarAscendenteLS(listaS * ptrL,const char * dato);
void eliminarInicioLS(listaS * ptrL);
void eliminarFinalLS(listaS * ptrL);
void eliminarEnLS(listaS * ptrL, int pos);
void vaciarLS(listaS * ptrL);
void freeLS(listaS * ptrL);
int estaLS(listaS l, const char * dato);
int posLS(listaS l, const char * dato);
int tamanioLS(listaS l);
void imprimirLS(listaS l);
listaS inversaLS(listaS l);


#endif // SLIST_H_INCLUDED
