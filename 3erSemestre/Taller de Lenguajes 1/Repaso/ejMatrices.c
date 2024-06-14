#include <stdio.h>
#include <stdlib.h>
#define FIL 3
#define COL 4
int sumaUltimaFila(int *, int, int);

int  sumaUltimaFila(int * m, int , int );
void imprimir(int * m, int fil, int col);

int hola()
{ int V[FIL][COL] = {0}, *ptr, *p;
int * m = (int*) calloc(FIL*COL,sizeof(int));
printf("%d %d\n", (int)sizeof(V), (int)sizeof(m));
V[1][1]=10;
printf("V[1][1]=10;\n");
imprimir(V, FIL, COL);
//m[1][1]=10;
p = &V;
ptr = &V[1][0];
V[1][0] = 3;
printf("ptr = &V[1][0];   (*ptr=%d)\n", *ptr);
printf("V[1*COL+0] = %d\n", V[1*COL+0]);
printf("p[1*COL+0] = %d\n", p[1*COL+0]);
*(ptr-2)=21;
printf("*(ptr-2)=21;\n");
imprimir(V, FIL, COL);
*(m+5)=21;
printf("*(m+5)=21;\n");
imprimir(m, FIL, COL);
*(ptr+5)=22;
printf("*(ptr+5)=22;\n");
imprimir(V, FIL, COL);
*(m+12*COL/4-1)=22;
printf("*(m+12*COL/4-1)=22;    (segTerm=%d)\n", 12*COL/4-1);
imprimir(m, FIL, COL);

printf("La suma de los nros. ");
printf("de la ultima fila de m es = \n");
printf("%d\n",sumaUltimaFila(m, FIL, COL));
printf("La suma de los nros. ");
printf("de la ultima fila de V es = \n");
printf("%d\n",sumaUltimaFila(V, FIL, COL));

printf("m:\n");
imprimir(m, FIL, COL);

printf("V:\n");
imprimir(V, FIL, COL);

free(m);
//free(V);
return 0;
}

int  sumaUltimaFila(int * m, int fil, int col){
    int i, suma = 0;
    for (i=0; i<fil; i++){
        suma += m[((col-1)*fil) + i];
    }
    return suma;
}

void imprimir(int * m, int fil, int col){
    int i,j;
    for (j=0; j<fil; j++){
        for (i=0; i<col; i++){
            printf("%4d ", m[(j*col) + i]);
        }
        printf("\n");
    }
}
