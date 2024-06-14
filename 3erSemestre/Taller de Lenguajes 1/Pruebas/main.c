#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#define FIL 5
#define COL 5

void imprimirM (const int m[][COL], int fil, int col);
void OrdenarColumnas(int * m, int fil, int col);
void swap(int * ptra, int * ptrb);
void SumaColumnas(int * m, int fil, int col, int v[]);
void imprimir (const int a[], int cant);


int main()
{

    int c;
    pid_t pid;
    printf("Comienzo.:\n");
    for (c=0;c<3;c++){
        pid = fork();
    }
    printf("Proceso\n");

    /*int i = 2;
    switch (i){
        case 1 : printf("1");
        case 2 : printf("2");
        case 3 : printf("3");
    }*/

/*
    int matriz[FIL][COL] = {{4,3,2,5,4},{3,2},{1,2,3,4,5},{6,1,0,8,2},{0,0,2,0,5}};
    imprimirM(matriz, FIL, COL);
    OrdenarColumnas(matriz, FIL, COL);
    printf("\n");
    imprimirM(matriz, FIL, COL);
    printf("\n");
    int v[COL];
    SumaColumnas(matriz, FIL, COL, v);
    imprimir(v, COL);*/
    return 0;
}

void imprimirM (const int m[][COL], int fil, int col){
    int i, j;
    for (i=0; i<fil; i++) {
        for (j=0; j<col; j++) printf("%d   ", m[i][j]);
        printf("\n");
    }
}

void swap(int * ptra, int * ptrb){
    int aux = *ptra;
    *ptra = *ptrb;
    *ptrb = aux;
}
void OrdenarColumnas(int * m, int fil, int col){
    int i, j, k,*posMin;
    //recorro cada columna
    for(i=0; i<col; i++){
        //en cada posicion busco y pongo el minimo de los que quedan
        for(j=0;j<fil-1; ++j){
            posMin = &(m[j*col + i]);
            for(k=j+1;k<fil; k++){
                if(m[k*col + i]< *posMin)
                    posMin = &(m[k*col + i]);
            }
            if (posMin != &(m[j*col + i])){
                swap(&(m[j*col + i]), posMin);
            }

        }
    }

}

void SumaColumnas(int * m, int fil, int col, int v[]){
    int i, j, suma;
    //recorro cada columna
    for(i=0; i<col; i++){
        suma = 0;
        for(j=0; j<fil; ++j){
            suma = suma + m[j*col + i];
        }
        v[i] = suma;
    }
}

void imprimir (const int a[], int cant){
    int i;
    for (i=0; i<cant; i++)
        printf("%d ----> %d\n", i, a[i]);
}
