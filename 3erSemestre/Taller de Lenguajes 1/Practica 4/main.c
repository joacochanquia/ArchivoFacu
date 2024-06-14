#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

typedef struct nodoE{
    int dato;
    struct nodoE *sig;
} listaE;

void reservarArregloDouble(double ** ptrF, int n);
void reservarArregloFloat(float ** f, int n);
void iniciarArregloFloat(float * f, int n);
void imprimirArregloFloat(float * f, int n);
float maxFloat(float * f, int n);
float promFloat(float * f, int n);
void reservarArregloChar(char ** f, int n);
void acomodarArregloChar(char ** ptrC);
void mayusYminus(char * c, int * may, int * min);

// listas
void reservarNodoLE(listaE ** ptrL);
listaE * newNodoLE();
void vaciarLE(listaE ** ptrL);
void freeLE(listaE ** ptrL);
void eliminarInicioLE(listaE ** ptrL);
void eliminarFinalLE(listaE ** ptrL);
void eliminarEnLE(listaE ** ptrL, int pos);
void agregarInicioLE(listaE ** ptrL, int dato);
void agregarFinalLE(listaE ** ptrL, int dato);
void agregarAscendenteLE(listaE ** ptrL, int dato);
int tamanioLE(listaE * l);
void imprimirLE(listaE * l);
listaE * inversaLE(listaE * l);
void eliminarMultiplosLE(listaE ** l, int n);
void paresImpares(listaE * l, listaE ** pares, listaE ** impares);

//matriz
void reservarME(int *** mat, int n, int m);
int ** newME(int n, int m);
void cargarME(int ** mat, int fil, int col);
void imprimirME(int ** mat, int  fil, int col);
void freeME(int ** mat, int fil);
void posMultiplos(int ** mat, int fil, int col, int n);
//matriz triangular
void reservarTriInfME(int *** mat, int n);
int ** newTriInfME(int n);
void cargarTriInfME(int ** mat, int n);
void imprimirTriInfME(int ** mat, int n);
void freeTriInfME(int ** mat, int n);
void piramidePascalME(int ** mat, int n);

int * divisores(int n, int * cant);

int main()
{
/*
    float * f = NULL;
    int n, i;
    scanf("%d", &n);
    reservarArregloFloat(&f, n);
    if (f == NULL)
        printf("ptr es NULL\n");
    else
        printf("ptr no es NULL\n");
    srand(time(NULL));
    iniciarArregloFloat(f, n);
    imprimirArregloFloat(f, n);
    printf("%.2f", promFloat(f, n));
    free(f);
*/
/*
    float * f = NULL;
    int n;
    scanf("%d", &n);
    reservarArregloFloat(&f, n);
    srand(time(NULL));
    iniciarArregloFloat(f, n);
    imprimirArregloFloat(f, n);
    printf("%.2f", promFloat(f, n));
    free(f);
*/
/*
    char * c = NULL;
    int i, may=0, min=0;
    for (i=0; i<10; i++){
        reservarArregloChar(&c, 100);
        gets(c);
        acomodarArregloChar(&c);
        may=0;
        min=0;
        mayusYminus(c, &may, &min);
        printf("Mayusculas = %d; Minusculas = %d\n", may, min);
        puts(c);
        free(c);
    }
*/
/*
    listaE * l = NULL;
    agregarInicioLE(&l, 5);
    agregarInicioLE(&l, 4);
    agregarInicioLE(&l, 3);
    agregarInicioLE(&l, 2);
    agregarInicioLE(&l, 1);
    agregarFinalLE(&l, 6);
    imprimirLE(l);

    eliminarInicioLE(&l);
    eliminarFinalLE(&l);
    imprimirLE(l);

    vaciarLE(&l);
    imprimirLE(l);

    agregarInicioLE(&l, 32);
    agregarFinalLE(&l, 7);
    agregarFinalLE(&l, 8);
    agregarFinalLE(&l, 9);
    imprimirLE(l);

    freeLE(&l);
*/
/*
    listaE * l = NULL;
    int n;
    printf("Ingrese un numero: ");
    scanf("%d", &n);
    while (n!=0){
        agregarFinalLE(&l, n);
        imprimirLE(l);
        printf("\n");
        printf("Ingrese un numero: ");
        scanf("%d", &n);
    }
    imprimirLE(l);
    printf("tamanio: %d\n", tamanioLE(l));

    listaE * inv = inversaLE(l);
    imprimirLE(inv);
    printf("tamanio: %d\n", tamanioLE(inv));
*/
/*
    listaE * l = NULL;
    int n;
    printf("Ingrese un numero: ");
    scanf("%d", &n);
    while (n!=0){
        agregarFinalLE(&l, n);
        imprimirLE(l);
        printf("\n");
        printf("Ingrese un numero: ");
        scanf("%d", &n);
    }

    printf("posicion del numero a eliminar: ");
    scanf("%d", &n);

    eliminarEnLE(&l, n);
    imprimirLE(l);
    printf("tamanio: %d\n", tamanioLE(l));
    printf("\n");

    scanf("%d", &n);
    eliminarEnLE(&l, n);
    imprimirLE(l);
    printf("tamanio: %d\n", tamanioLE(l));
    printf("\n");

    eliminarMultiplosLE(&l, 2);
    imprimirLE(l);
    printf("tamanio: %d\n", tamanioLE(l));
*/
/*
    int n, i;
    printf("Ingrese un numero: ");
    scanf("%d", &n);
    double a[n], num, suma;
    for (i=0; i<n; i++){
        printf("Ingrese el valor en a[%d]: ", i);
        scanf("%lf", &num);
        a[i] = num;
    }
    //imprimir
    for (i=0; i<n; i++){
        printf("a[%d] = %lf\n", i, a[i]);
    }
    for (i=0; i<n; i++){
        suma += a[i];
    }
    printf("promedio = %lf\n", suma/n);
*/
/*
    int n, i;
    printf("Ingrese un numero: ");
    scanf("%d", &n);
    double *a, num, suma;
    reservarArregloDouble(&a, n);
    for (i=0; i<n; i++){
        printf("Ingrese el valor en a[%d]: ", i);
        scanf("%lf", &num);
        *(a+i) = num;
    }
    //imprimir
    for (i=0; i<n; i++){
        printf("a[%d] = %lf\n", i, *(a+i));
    }
    for (i=0; i<n; i++){
        suma += *(a+i);
    }
    printf("promedio = %lf\n", suma/n);
    free(a);
*/
/*
    int fil, col, **mat;
    printf("Ingrese num de fil y col: ");
    scanf("%d", &fil);
    scanf("%d", &col);
    mat = newME(fil, col);
    cargarME(mat, fil, col);
    imprimirME(mat, fil, col);
    printf("\n");

    posMultiplos(mat, fil, col, 3);

    freeME(mat, fil);
*/
/*
    int x=2, y=3, fil, col, n;
    int * m= (int*) malloc(x*y*sizeof(int));
    for(fil=0; fil<y; fil++){
        for(col=0; col<x; col++){
            printf("ingrese numero: ");
            scanf("%d", &n);
            m[col+fil*x] = n;
        }
    }
    for(fil=0; fil<y; fil++){
        for(col=0; col<x; col++){
            printf("%d - ", m[col+fil*x]);
        }
        printf("\n");
    }
*/
/*
    int x=2, y=3, i, fil, col, n;
    int * m= (int*) malloc(x*y*sizeof(int));
    for(i=0; i<(y*x); i++){
        printf("ingrese numero: ");
        scanf("%d", &n);
        m[i] = n;
    }
    for(fil=0; fil<y; fil++){
        for(col=0; col<x; col++){
            printf("%d - ", m[col+fil*x]);
        }
        printf("\n");
    }
*/
/*
    int n, **mat;
    printf("Ingrese tamaño triangulo: ");
    scanf("%d", &n);
    mat = newTriInfME(n);
    cargarTriInfME(mat, n);
    imprimirTriInfME(mat, n);
    printf("\n");

    freeTriInfME(mat, n);
*/
/*
    int n, **mat;
    printf("Ingrese tamaño triangulo: ");
    scanf("%d", &n);
    mat = newTriInfME(n);
    piramidePascalME(mat, n);
    imprimirTriInfME(mat, n);
    printf("\n");

    freeTriInfME(mat, n);
*/
/*
    int n, i, cant, *div=NULL;
    printf("Ingrese numero: ");
    scanf("%d", &n);
    div = divisores(n, &cant);
    for(i=0; i<cant; i++){
        fprintf(stdout, "%d  ", div[i]);
    }
*/

    listaE * l = NULL;
    int n;
    printf("Ingrese un numero: ");
    scanf("%d", &n);
    while (n!=0){
        agregarAscendenteLE(&l, n);
        imprimirLE(l);
        printf("\n");
        printf("Ingrese un numero: ");
        scanf("%d", &n);
    }
    imprimirLE(l);
    printf("tamanio: %d\n", tamanioLE(l));
    listaE * pares = NULL;
    listaE * impares = NULL;

    paresImpares(l, &pares, &impares);

    imprimirLE(l);
    imprimirLE(pares);
    imprimirLE(impares);


    freeLE(&l);
    freeLE(&pares);
    freeLE(&impares);


    return 0;
}

int * divisores(int n, int * cant){
    int tam=0, i, * div=NULL;
    for (i=1; i<=n; i++){
        if(!(n%i)){
            tam++;
            div = (int *) realloc(div, tam*sizeof(*div));
            div[tam-1] = i;
        }
    }
    *cant = tam;
    return div;
}

//matriz
void reservarME(int *** mat, int fil, int col){
    int i=0;
    *mat = (int **) malloc(fil*sizeof(*mat));
    for(i=0; i<fil; i++){
        (*mat)[i] = (int *) malloc(col*sizeof(**mat));
    }
}
int ** newME(int fil, int col){
    int i=0;
    int ** aux = (int **) malloc(fil*sizeof(*aux));
    for(i=0; i<fil; i++){
        aux[i] = (int *) malloc(col*sizeof(**aux));
    }
    return aux;
}

void cargarME(int ** mat, int fil, int col){
    int i, j, num;
    for (i=0; i<fil; i++){
        for (j=0; j<col; j++){
            printf("Ingrese el valor en m[%d][%d]: ", i, j);
            scanf("%d", &num);
            mat[i][j] = num;
        }
    }
}

void imprimirME(int ** mat, int  fil, int col){
    int i, j;
    for (i=0; i<fil; i++){
        for (j=0; j<(col-1); j++){
            printf("%4d - ", mat[i][j]);
        }
        printf("%4d\n", mat[i][j]);
    }
}

void freeME(int ** mat, int fil){
    int i=0;
    for(i=0; i<fil; i++){
        free(mat[i]);
    }
    free(mat);
}

void posMultiplos(int ** mat, int fil, int col, int n){
    int i, j;
    for (i=0; i<fil; i++){
        for (j=0; j<(col-1); j++){
            if (!(mat[i][j]%n)){
                printf("%4d - ", mat[i][j]);
            }
            else{
                printf("     - ");
            }
        }
        if (!(mat[i][j]%n)){
            printf("%4d", mat[i][j]);
        }
        printf("\n");
    }
}
//matriz triangular
void reservarTriInfME(int *** mat, int n){
    int i=0;
    *mat = (int **) malloc(n*sizeof(*mat));
    for(i=0; i<n; i++){
        (*mat)[i] = (int *) malloc((i+1)*sizeof(**mat));
    }
}
int ** newTriInfME(int n){
    int i=0;
    int ** aux = (int **) malloc(n*sizeof(*aux));
    for(i=0; i<n; i++){
        aux[i] = (int *) malloc((i+1)*sizeof(**aux));
    }
    return aux;
}

void cargarTriInfME(int ** mat, int n){
    srand(time(NULL));
    int i, j;
    for (i=0; i<n; i++){
        for (j=0; j<(i+1); j++){
            mat[i][j] = rand()%21;
        }
    }
}

void imprimirTriInfME(int ** mat, int  n){
    int i, j;
    for (i=0; i<n; i++){
        for (j=0; j<i; j++){
            printf("%4d - ", mat[i][j]);
        }
        printf("%4d\n", mat[i][j]);
    }
}

void freeTriInfME(int ** mat, int n){
    int i=0;
    for(i=0; i<n; i++){
        free(mat[i]);
    }
    free(mat);
}

void piramidePascalME(int ** mat, int n){
    srand(time(NULL));
    int i, j;
    for (i=0; i<n; i++){
        mat[i][0] = 1;
        mat[i][i] = 1;
        for (j=1; j<i; j++){
            mat[i][j] = (mat[i-1][j-1]+mat[i-1][j]);
        }
    }
}

// listas
void reservarNodoLE(listaE ** ptrL){
    *ptrL = (listaE *)calloc(1, sizeof(**ptrL));
}
listaE * newNodoLE(){
    return (listaE *)calloc(1, sizeof(listaE *));
}

void agregarInicioLE(listaE ** ptrL, int dato){
    listaE * nuevo = NULL;
    reservarNodoLE(&nuevo);
    nuevo->dato = dato;
    nuevo->sig = *ptrL;
    *ptrL = nuevo;
}

void agregarFinalLE(listaE ** ptrL, int dato){
    listaE * nuevo = NULL;
    reservarNodoLE(&nuevo);
    nuevo->dato = dato;
    nuevo->sig = NULL;
    if (*ptrL == NULL){
        *ptrL = nuevo;
    }
    else{
        listaE * aux = *ptrL;
        while (aux->sig != NULL){
            aux = aux->sig;
        }
        aux->sig = nuevo;
    }
}

void agregarAscendenteLE(listaE ** ptrL, int dato){
    listaE * nuevo = NULL;
    reservarNodoLE(&nuevo);
    nuevo->dato = dato;
    nuevo->sig = NULL;
    if (*ptrL == NULL){
        *ptrL = nuevo;
    }
    else{
        if ((*ptrL)->dato > dato){
            nuevo->sig = *ptrL;
            *ptrL = nuevo;
        }
        else{
            listaE * aux = *ptrL;
            while((aux->sig!=NULL)&&(aux->sig->dato < dato)){
                aux = aux->sig;
            }
            nuevo->sig = aux->sig;
            aux->sig = nuevo;
        }
    }
}

void eliminarInicioLE(listaE ** ptrL){
    if (*ptrL!=NULL){
        listaE * aux = (*ptrL)->sig;
        free(*ptrL);
        *ptrL = aux;
    }
}

void eliminarFinalLE(listaE ** ptrL){
    if (*ptrL!=NULL){
        listaE * aux = *ptrL;
        listaE * ant;
        while (aux->sig != NULL){
            ant = aux;
            aux = aux->sig;
        }
        free(aux);
        ant->sig = NULL;
    }
}

void eliminarEnLE(listaE ** ptrL, int pos){
    if ((*ptrL)!=NULL){
        if(pos == 0){
            eliminarInicioLE(ptrL);
        }
        else{
            listaE * aux = *ptrL;
            listaE * ant;
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

void vaciarLE(listaE ** ptrL){
    while (*ptrL!=NULL){
        eliminarInicioLE(ptrL);
    }
}
void freeLE(listaE ** ptrL){
    vaciarLE(ptrL);
    free(*ptrL);
}

int tamanioLE(listaE * l){
    int t=0;
    while (l != NULL){
        l = l->sig;
        t++;
    }
    return t;
}

void imprimirLE(listaE * l){
    if (l != NULL){
        while (l->sig != NULL){
            printf("%d - ", l->dato);
            l = l->sig;
        }
        printf("%d\n", l->dato);
    }
}

listaE * inversaLE(listaE * l){
    listaE * aux = NULL;
    while (l != NULL){
        agregarInicioLE(&aux, l->dato);
        l = l->sig;
    }
    return aux;
}

void eliminarMultiplosLE(listaE ** ptrL, int n){
    if (*ptrL!=NULL){
        listaE * aux = *ptrL;
        listaE * prox;
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

void paresImpares(listaE * l, listaE ** pares, listaE ** impares){
    int n;
    while (l!= NULL){
        n = l->dato;
        agregarFinalLE(((n&1)? impares : pares) , n);
        l = l->sig;
    }
}


// arreglos dinamicos
void reservarArregloChar(char ** ptrC, int n){
    *ptrC = (char *)malloc(n*sizeof(**ptrC));
}

void acomodarArregloChar(char ** ptrC){
    *ptrC = (char *)realloc(*ptrC, strlen(*ptrC));
}

void mayusYminus(char * c, int * may, int * min){
    int i;
    for(i=0; i<strlen(c); i++){
        if ((c[i]>64)&&(c[i]<91)){
            *may = *may+1;
        }
        else{
            if ((c[i]>='a')&&(c[i]<='z')){
                (*min)++;
            }
        }
    }
}


void reservarArregloDouble(double ** ptrF, int n){
    *ptrF = (double *)malloc(n*sizeof(**ptrF));
}


void reservarArregloFloat(float ** ptrF, int n){
    *ptrF = (float *)malloc(n*sizeof(**ptrF));
}

void iniciarArregloFloat(float * f, int n){
    int i;
    for(i=0; i<n; i++){
        f[i] = (rand()/0.97859595684688611);
    }
}

void imprimirArregloFloat(float * f, int n){
    int i;
    for(i=0; i<n; i++){
        printf("%.2f\n", f[i]);
    }
}

float maxFloat(float * f, int n){
    float max=-30999999;
    int i;
    for(i=0; i<n; i++){
        if (f[i]>max){
            max = f[i];
        }
    }
    return max;
}

float promFloat(float * f, int n){
    float suma;
    int i;
    for(i=0; i<n; i++){
        suma += f[i];
    }
    suma /= n;
    return suma;
}


/*
#include <stdio.h>
#include <stdlib.h>
#define N 10

int*** crearTensor(int t){
    int i,j;
    int*** a;
    a = (int***) calloc(t,sizeof(int**));
    for (i=0; i<t; i++){
        a[i] = (int**) calloc(t, sizeof(int*));
        for (j=0; j<t; j++){
            a[i][j] = (int*) calloc(t, sizeof(int));
        }
    }
    return a;
}

int main(){
    int*** e;
    e = crearTensor(N);
    return 0;
}
*/

/*
#include <stdio.h>
#include <stdlib.h>
void f (int * p);
int main(){
 int * ptr = NULL;
 f(ptr);
 if (ptr == NULL)
 printf("ptr es NULL\n");
 else
 printf("ptr no es NULL\n");
 return 0;
}
void f (int * p) {
 p = (int *) malloc(10*sizeof(int));
}
*/
