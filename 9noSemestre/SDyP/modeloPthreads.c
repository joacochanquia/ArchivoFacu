/*
Paralelizar la búsqueda del mínimo y el máximo 
valor en un vector de N elementos. 
Ejecutar con 2 y 4 Threads.
*/

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#include<sys/time.h>

int T;
int N;

int* vector;
double* A;
double* B;
double* C;

/**********Para calcular tiempo*************************************/
double dwalltime()
{
        double sec;
        struct timeval tv;

        gettimeofday(&tv,NULL);
        sec = tv.tv_sec + tv.tv_usec/1000000.0;
        return sec;
}
/****************************************************************/

/*Calculo de porcion asignada a la funcion*******/
int parte = N / T;
int inicio = tid * parte;
int fin = inicio + parte;
/************************************************/

/*Recorrido de un vector*************************/
for (i = inicio; i < fin; i++){
    if (vector[i] == X){
        cant++;
    }
}
/************************************************/

/*Multiplicacion de matrices*********************/
for (i = inicio; i < fin; i++){   
    iN = i * N;
    for (j = 0; j < N; j++){
        jN = j * N;
        suma = 0;
        for (k = 0; k < N; k++){
            suma += A[iN + k] * B[k + jN];
        }
        C[iN + j] = suma;
    }
}
/************************************************/

/*Declaracion de funcion de un hilo******************************/
void* funcion(void* arg){
    int tid = *(int*) arg;
    printf("Hilo %d\n", tid);
    // Codigo


    // Fin de codigo
    pthread_exit(NULL);
}
/****************************************************************/

int main(int argc, char* argv[]){

    /*Comprobacion de argumentos***********************************/
    if ((argc != 3)){
        printf("Usar: %s T N\n T: Cantidad de Threads\n N: Dimension del vector\n", argv[0]);
        exit(1);
    }
    T = atoi(argv[1]); //Cantidad de Threads
    N = atoi(argv[2]); //Cantidad de elementos del vector
    printf("Threads: %d\n", T);
    printf("Elementos del vector: %d\n", N);
    /***************************************************************/

    /*Declaracion de variables****************************************/
    pthread_t misThreads[T];
    int threads_ids[T];
    double timetick;
    int id;
    /*****************************************************************/

    /*Parte si tengo un vector*******************************/
    //Declaracion del vector
    int* vector;
    //Asignacion de memoria para el vector
    vector = (int*) malloc(sizeof(int) * N);
    //inicializacion del vector con valores aleatorios
    srand(time(NULL));
    for (int i = 0; i < N; i++){
        vector[i] = rand() % 100000;
    }
    /*******************************************************/
    
    /*Parte si tengo una matriz*******************************/
    // Aloca memoria para las matrices
    A = (double *)malloc(sizeof(double) * N * N);
    B = (double *)malloc(sizeof(double) * N * N);
    C = (double *)malloc(sizeof(double) * N * N);
    // Inicializa las matrices A y B en 1, el resultado sera una matriz con todos sus valores en N
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            A[i * N + j] = 1;
            B[i + j * N] = 1;
        }
    }
    /*********************************************************/

    /*Inicio de medicion de tiempo***************************/
    timetick = dwalltime(); 
    /********************************************************/

    /*Creacion de Threads**********************************/
    for(id = 0; id < T; id++){
        threads_ids[id] = id;
        pthread_create(&misThreads[id], NULL, &funcion, (void*)&threads_ids[id]);
    }
    /*******************************************************/
    /*Esperar a que terminen los Threads******************/
    for(id = 0; id < T; id++){
        pthread_join(misThreads[id], NULL);
    }
    /*******************************************************/

    /*Calculo de tiempo****************************************/ 
    double tiempo = dwalltime() - timetick;
    printf("Tiempo en segundos %f\n", tiempo);
    /**********************************************************/

    // Liberar memoria
    free(vector);
    free(A);
    free(B);
    free(C);

    return 0;
}