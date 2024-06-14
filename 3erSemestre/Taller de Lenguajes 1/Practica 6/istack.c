#include <stdlib.h>

typedef struct {
    int * p;
    int t;
} pila;

pila s_create (){// – Retorna una nueva pila. Se debe invocar antes de manipular cualquiera de ellas.
    pila s;
    s.p = (int*) calloc(0, sizeof(int));
    s.t = 0;
    return s;
}

int s_push(pila * s, int n){// – Apila n en s. Retorna el elemento apilado.
    s->p = (int*) realloc(s->p, ++(s->t)*sizeof(int));
    s->p[(s->t)-1] = n;
    return s->p[(s->t)-1];
}

int s_pop (pila * s){// – Desapila un elemento de s.
    (s->t) -= 1;
    int n = s->p[(s->t)];
    s->p = (int*) realloc(s->p, (s->t)*sizeof(int));
    return n;
}

int s_top (pila s){// – Retorna el próximo elemento que será desapilado.
    return s.p[(s.t)-1];
}

int s_empty(pila s){// – Retorna 1 si s está vacía, 0 en caso contrario.
    return ((s.t) == 0);
}

int s_length(pila s){// – Retorna la cantidad de elementos apilados en s.
    return (s.t);
}

void s_free(pila * s){// - libera la memoria
    free(s->p);
}
