/*
Paralelizar la búsqueda del mínimo y el máximo
valor en un vector de N elementos.
Ejecutar con 2 y 4 Threads.
*/

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#include <sys/time.h>

#define ORDENXFILAS 0
#define ORDENXCOLUMNAS 1

// Matrices
double *A, *B, *C;
// Dimension por defecto de las matrices
int N = 100;

int T;
int *vector;

/**********Para calcular tiempo*************************************/
double dwalltime()
{
    double sec;
    struct timeval tv;

    gettimeofday(&tv, NULL);
    sec = tv.tv_sec + tv.tv_usec / 1000000.0;
    return sec;
}
/****************************************************************/

void *funcion(void *arg)
{
    int tid = *(int *)arg;
    printf("Hilo %d\n", tid);
    // Codigo

    int i,j,k;
    int parte = N / T;
    int inicio = tid * parte;
    int fin = inicio + parte;

    // Si no es divisible, el último hilo toma el resto
    if (tid == T - 1)
    {
        fin = N; // El último hilo toma el resto
    }

    // Multiplicacion de matrices
    for (i = inicio; i < fin; i++)
    {
        for (j = 0; j < N; j++)
        {
            C[i * N + j] = 0;
            for (k = 0; k < N; k++)
            {
                C[i * N + j] += A[i * N + k] * B[k + j * N];
            }
        }
    }

    // Fin de codigo
    pthread_exit(NULL);
}

int main(int argc, char *argv[])
{

    if ((argc != 3))
    {
        printf("Usar: %s T N\n T: Cantidad de Threads\n N: Dimension de la matriz\n", argv[0]);
        exit(1);
    }
    T = atoi(argv[1]); // Cantidad de Threads
    N = atoi(argv[2]); // Dimension matriz
    printf("Threads: %d\n", T);
    printf("Dimension de la matriz: %d\n", N);

    pthread_t misThreads[T];
    int threads_ids[T];
    double timetick;
    int id;

    int i, j;
    int check = 1;

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

    timetick = dwalltime(); // Inicio de medicion de tiempo
    // Realiza la multiplicacion
    for (id = 0; id < T; id++)
    {
        threads_ids[id] = id;
        pthread_create(&misThreads[id], NULL, &funcion, (void *)&threads_ids[id]);
    }
    //Espero a la finalizacion de los hilos
    for (id = 0; id < T; id++)
    {
        pthread_join(misThreads[id], NULL);
    }

    // Calculo de tiempo
    double tiempo = dwalltime() - timetick;
    printf("Tiempo en segundos %f\n", tiempo);

    // Verifica el resultado
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            check = check && (C[i * N + j] == N);
        }
    }

    if (check)
    {
        printf("Multiplicacion de matrices resultado correcto\n");
    }
    else
    {
        printf("Multiplicacion de matrices resultado erroneo\n");
    }

    free(A);
    free(B);
    free(C);
    return 0;
}