#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#include "imath.h"
#include "slist.h"
#include "istack.h"
#include "slist.h"
#include "diccionario.h"

#define PI 3.14159
#define AREA_CIRCULO(r) ((r)*(r)*PI)

#define CANT 100000
#define DEBUG 1


int buscar(int v[], int tam, int num);

int main(int argc, char * argv[])
{
/*
    if (argc > 4){
        int i;
        float suma;
        for (i=1; i<argc; i++){
            suma += atoi(argv[i]);
        }
        suma /= (argc-1);
        printf("el promedio de los argumentos del main es %.2f", suma);
    }
    else{
        printf ("NO HAY SUFICIENTES ARGUMENTOS");
        return 4;
    }
*/
/*
    if (argc > 3){
        float res;
        switch(argv[3][0]){
        case ('+') : res = atoi(argv[1]) + atoi(argv[2]); break;
        case ('-') : res = atoi(argv[1]) - atoi(argv[2]); break;
        case ('x') : res = atoi(argv[1]) * atoi(argv[2]); break;
        case ('/') : res = atoi(argv[1]) / (float)atoi(argv[2]); break;
        default : printf("ERROR NO SE RECIBIO UN OPERADOR VALIDO"); return 23;
        }
        printf("%s %s %s = %.2f",argv[1], argv[3], argv[2], res);
    }
    else{
        printf ("NO HAY SUFICIENTES ARGUMENTOS");
        return 4;
    }
*/
/*
    int i;
    float radio;
    srand(time(NULL));
    for (i=0; i<10; i++){
        radio = rand()/0.979888556582862628;
        printf("area con radio %f es %f\n", radio, AREA_CIRCULO(radio));
    }
*/
/*
    int i, v[CANT];
    srand(time(NULL));
    for (i=0; i<CANT; i++){
        v[i] = rand();
    }
    printf("El elemento %d se encuentra en la posicion %d\n", 123456, buscar(v, CANT, 12345));
    printf("El elemento %d se encuentra en la posicion %d\n", 14321, buscar(v, CANT, 14321));
    printf("El elemento %d se encuentra en la posicion %d\n", 8235, buscar(v, CANT, 8235));
*/
/*
    int n;
    printf("Ingrese un numero: ");
    scanf("%s", s);
    do{
        if(par(n)){
            printf("%d^2 = %d\n", n, cuadrado(n));
            printf("%d^3 = %d\n", n, cubo(n));
        }
        if(impar(n)){
            printf("%d! = %d\n", n, factorial(n));
        }
        printf("\n|%d| = %d\n", n, absoluto(n));
        printf("\nE{0-n}%d = %d\n", n, sumatoria(n));
        printf("\n%d^5 = %d\n", n, potencia(n, 5));
        printf("\n%d es multiplo de 0? = %d\n", n, multiplo(n, 0));
        printf("\n%d es divisor de 0? = %d\n", n, divisor(n, 0));
        printf("Ingrese un numero: ");
        scanf("%s", s);
    }while (n);
*/
/*
    int n, num;
    pila p;
    do{
        printf("Ingrese un numero: \n");
        printf("Crear pila \t[0]\n");
        printf("Apilar \t\t[1]\n");
        printf("Desapilar \t[2]\n");
        printf("Tope \t\t[3]\n");
        printf("Vacia? \t\t[4]\n");
        printf("Tamanio \t[5]\n");
        printf("SALIR \t\t[6]\n");
        scanf("%s", s);
        switch (n){
        case(0) : p = s_create(); break;
        case(1) : printf("Ingrese un valor: ");
            scanf("%d", &num);
            printf("Se apilo %d\n", s_push(&p, num));
            break;
        case(2) : if(!s_empty(p)) printf("Valor desapilado = %d\n", s_pop(&p)); break;
        case(3) : if(!s_empty(p)) printf("Valor en el tope = %d\n", s_top(p)); break;
        case(4) : if(s_empty(p)){
                printf("La pila esta vacia\n");
            }
            else{
                printf("La pila tiene datos\n");
            }
            ; break;
        case(5) : printf("La pila tiene %d elementos\n", s_length(p)); break;
        }
        printf("\n");
    }while (n!=6);
    s_free(&p);
*/

    diccionario d = newDicc();
    char palabra[100];
    FILE * f = fopen("diccionario.txt", "w");
    int i;
/*    printf("Ingrese una palabra: ");
    scanf("%s", palabra);
    while (agregarDicc(&d, palabra)){
        printf("Ingrese una palabra: ");
        fflush(stdin);
        scanf("%s", palabra);
    }
    printf("\n");
    for (i=0; i<3; i++){
        printf("Ingrese la palabra que quiere BUSCAR: ");
        scanf("%s", palabra);
        if (estaDicc(d, palabra)){
            printf("La palabra esta\n");
        }
        else{
            printf("La palabra NO esta\n");
        }
    }
    guardarDicc(&d, f);
    printf("\nSe guardo el diccionario.\n\n");
    fclose(f);
    for (i=0; i<3; i++){
        printf("\nIngrese la palabra que quiere ELIMINAR: ");
        scanf("%s", palabra);
        if (eliminarDicc(&d, palabra)){
            printf("El eliminar dice que si se elimino\n");
        }
        else{
            printf("El eliminar dice que NO se elimino\n");
        }
        if (estaDicc(d, palabra)){
            printf("La palabra esta\n");
        }
        else{
            printf("La palabra NO esta\n");
        }
    }*/ fclose(f);
    f = fopen("diccionario.txt", "r");
    d = cargarDicc(f);
    printf("\nSe CARGO el diccionario.\n\n");
    for (i=0; i<3; i++){
        printf("\nConfirme que palabras eliminadas estan en el diccionario: ");
        scanf("%s", palabra);
        if (estaDicc(d, palabra)){
            printf("La palabra esta\n");
        }
        else{
            printf("La palabra NO esta\n");
        }
    }
    freeDicc(&d);
    fclose(f);


/*
    listaS l;
    inicializarLS(&l);
    char * s = (char *) calloc(50, sizeof(char));
    int n;
    printf("Ingrese un string (Final): ");
    scanf("%s", s);
    while (strcmp(s, "ZZZ")){
        agregarFinalLS(&l, s);
        imprimirLS(l);
        printf("\n");
        printf("Ingrese un (Final): ");
        scanf("%s", s);
    }
    imprimirLS(l);
    printf("tamanio: %d\n", tamanioLS(l));
    listaS inv;
    inicializarLS(&inv);
    inv = inversaLS(l);
    imprimirLS(inv);
    printf("tamanio: %d\n", tamanioLS(inv));


    printf("Ingrese un string (Inicio): ");
    scanf("%s", s);
    while (strcmp(s, "ZZZ")){
        agregarInicioLS(&l, s);
        imprimirLS(l);
        printf("\n");
        printf("Ingrese un string: ");
        scanf("%s", s);
    }

    printf("posicion del string a eliminar: ");
    scanf("%d", &n);

    eliminarEnLS(&l, n);
    imprimirLS(l);
    printf("tamanio: %d\n", tamanioLS(l));
    printf("\n");

    scanf("%d", &n);
    eliminarEnLS(&l, n);
    imprimirLS(l);
    printf("tamanio: %d\n", tamanioLS(l));
    printf("\n");
*/
    return 0;
}


int buscar(int v[], int tam, int num){
    int i;
    #if DEBUG
    static int accesos;
    #endif // DEBUG
    for(i=0; i<tam; i++){
        #if DEBUG
        accesos++;
        #endif // DEBUG
        if (v[i]==num){
            #if DEBUG
            printf("CANTIDAD DE ACCESOS AL VECTOR = %d\n", accesos);
            #endif // DEBUG
            return i;
        }
    }
    #if DEBUG
    printf("CANTIDAD DE ACCESOS AL VECTOR = %d\n", accesos);
    #endif // DEBUG
    return -1;
}

/*
#include <stdio.h>
#include <stdlib.h>
#define DEBUG 1
int main(){
 int x= 15;
 while (x<50){
 #if DEBUG
printf("x= %d\n", x);
int y= y+1;
 #endif
 x++;
 }
 return 0;
}
*/
/*
#include <stdio.h>
#include <stdlib.h>
#define MAX(x,y) (((x)>(y)) ? (x) : (y))
int main () {
 int a, b;
 scanf("%d%d", &a, &b);
 printf("\nMAX(%d, %d) = %d", a, b, MAX(a,b));
 return 0;
}
*/

/*
#include <stdio.h>
#include <stdlib.h>
#define SIZE 25
void imprimir(int * v, int size){
 int i;
 for (i=0; i<size; i++){
 printf("v[%d]= %d\n", i, v[i]);
 }
}
int main(){
 int v[SIZE];
 imprimir(v, SIZE);
 return 0;
}
*/

/*
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define SQUAREOF(x) ((x)*(x))
int main() {
    int xin=3;
    printf("\nxin=%i",xin);
    printf("\nSQUAREOF(xin)=%i", SQUAREOF(xin));
    printf("\nSQUAREOF(xin+4)=%i", SQUAREOF(xin+4));
    printf("\nSQUAREOF(xin+xin)=%i", SQUAREOF(xin+xin));
}
*/
/*
#include <stdio.h>
#include <stdlib.h>
int main (int argc, char * argv[]) {
    printf("\nargc = %d",argc);
    printf("\nargv[0] => %s",argv[0]);
    return 0;
}
*/
