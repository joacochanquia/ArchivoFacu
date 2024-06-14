#ifndef ISTACK_H_INCLUDED
#define ISTACK_H_INCLUDED

typedef struct {
    int * p;
    int * t;
} pila;

pila s_create ();// – Retorna una nueva pila. Se debe invocar antes de manipular cualquiera de ellas.
int s_push(pila * s, int n);// – Apila n en s. Retorna el elemento apilado.
int s_pop (pila * s);// – Desapila un elemento de s.
int s_top (pila s);// – Retorna el próximo elemento que será desapilado.
int s_empty(pila s);// – Retorna 1 si s está vacía, 0 en caso contrario.
int s_length(pila s);// – Retorna la cantidad de elementos apilados en s.
void s_free(pila * s);// - libera la memoria

#endif // ISTACK_H_INCLUDED
