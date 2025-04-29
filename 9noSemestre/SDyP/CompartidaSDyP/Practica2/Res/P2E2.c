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
int X; // Valor a buscar
int *vector;
int *vector_cont;

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
    
    int i;
    int cant;
    int parte = N / T;
    int inicio = tid * parte;
    int fin = inicio + parte;

    for (i = inicio; i < fin; i++){
        if (vector[i] == X){
            cant++;
        }
    }

    vector_cont[tid] = cant;

    // Fin de codigo
    pthread_exit(NULL);
}

int main(int argc, char *argv[])
{

    if ((argc != 4)){
        printf("Usar: %s N T X\n N: Dimension del vector\n T: Cantidad de Threads\n X: Elemento a buscar entre 0 y 99\n", argv[0]);
        exit(1);
    }
    N = atoi(argv[1]); // Cantidad de elementos del vector
    T = atoi(argv[2]); // Cantidad de Threads
    X = atoi(argv[3]); // Elemento a buscar
    printf("Elementos del vector: %d\n", N);
    printf("Threads: %d\n", T);
    printf("Elemento a buscar: %d\n", X);
    if (X < 0 || X > 99){
        printf("Elemento a buscar debe estar entre 0 y 99\n");
        exit(1);
    }

    pthread_t misThreads[T];
    int threads_ids[T];
    double timetick;
    int cantFinal = 0; // Cantidad de veces que aparece el elemento
    int check = 1;
    int id;


    vector = (int *)malloc(sizeof(int) * N);
    vector_cont = (int *)malloc(sizeof(int) * T);

    // inicializacion del vector con valores aleatorios
    srand(time(NULL));
    for (int i = 0; i < N; i++){
        vector[i] = rand() % 100;
    }

    timetick = dwalltime(); // Inicio de medicion de tiempo

    // inicializacion de los Threads
    for (id = 0; id < T; id++){
        threads_ids[id] = id;
        pthread_create(&misThreads[id], NULL, &funcion, (void *)&threads_ids[id]);
    }
    // Espera a que terminen los Threads
    for (id = 0; id < T; id++){
        pthread_join(misThreads[id], NULL);
    }

    // Calculo de la cantidad total
    for (int i = 0; i < T; i++){
        cantFinal += vector_cont[i];
    }

    // Calculo de tiempo
    double tiempo = dwalltime() - timetick;
    printf("Tiempo en segundos %f\n", tiempo);

    // Verificacion de resultados
    for (int i = 0; i < N; i++){
        if (vector[i] == X)
        {
            check++;
        }
    }
    if (check == cantFinal){
        printf("Cantidad de veces que aparece el elemento %d: %d\n", X, cantFinal);
    }else{
        printf("Error en la cantidad de veces que aparece el elemento %d\n", X);
    }
    return 0;
}