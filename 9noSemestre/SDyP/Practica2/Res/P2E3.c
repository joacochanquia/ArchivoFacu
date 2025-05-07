/*
Paralelizar la búsqueda del mínimo y el máximo
valor en un vector de N elementos.
Ejecutar con 2 y 4 Threads.
*/

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#include <sys/time.h>

int T;
int N;
int *vector;
int *vector_min;
int *vector_max;

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

    int i;
    int min = 9999;
    int max = -1;
    int parte = N / T;
    int inicio = tid * parte;
    int fin = inicio + parte;

    for (i = inicio; i < fin; i++)
    {
        if (vector[i] < min)
        {
            min = vector[i];
        }
        if (vector[i] > max)
        {
            max = vector[i];
        }
    }

    vector_min[tid] = min;
    vector_max[tid] = max;

    printf("Maximo de hilo %d: %d\n", tid, max);
    printf("Minimo de hilo %d: %d\n", tid, min);

    // Fin de codigo
    pthread_exit(NULL);
}

int main(int argc, char *argv[])
{

    if ((argc != 3))
    {
        printf("Usar: %s N T\n N: Dimension del vector\n T: Cantidad de Threads\n", argv[0]);
        exit(1);
    }
    N = atoi(argv[1]); // Cantidad de elementos del vector
    T = atoi(argv[2]); // Cantidad de Threads
    printf("Elementos del vector: %d\n", N);
    printf("Threads: %d\n", T);

    pthread_t misThreads[T];
    int threads_ids[T];
    double timetick;
    int check = 1;
    int id;

    int minFinal = 100001; // Valor minimo del vector
    int maxFinal = -1;     // Valor maximo del vector

    vector = (int *)malloc(sizeof(int) * N);
    vector_min = (int *)malloc(sizeof(int) * T);
    vector_max = (int *)malloc(sizeof(int) * T);

    // inicializacion del vector con valores aleatorios
    srand(time(NULL));
    for (int i = 0; i < N; i++)
    {
        vector[i] = rand() % 100000;
    }

    timetick = dwalltime(); // Inicio de medicion de tiempo

    for (id = 0; id < T; id++)
    {
        threads_ids[id] = id;
        pthread_create(&misThreads[id], NULL, &funcion, (void *)&threads_ids[id]);
    }
    for (id = 0; id < T; id++)
    {
        pthread_join(misThreads[id], NULL);
    }

    for (int i = 0; i < T; i++)
    {
        if (vector_min[i] < minFinal)
        {
            minFinal = vector_min[i];
        }
        if (vector_max[i] > maxFinal)
        {
            maxFinal = vector_max[i];
        }
    }

    // Calculo de tiempo
    double tiempo = dwalltime() - timetick;
    printf("Maximo FINAL: %d\n", maxFinal);
    printf("Minimo FINAL: %d\n", minFinal);

    // Verificacion de resultados

    for (int i = 0; i < N; i++)
    {
        if (vector[i] < minFinal || vector[i] > maxFinal)
        {
            check = 0;
        }
    }

    printf("Tiempo en segundos %f\n", tiempo);

    if (check)
    {
        printf("Resultado correcto\n");
    }
    else
    {
        printf("Resultado incorrecto\n");
    }

    return 0;
}