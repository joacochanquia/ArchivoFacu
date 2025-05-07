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
double promedio;
int *vector;
int *vector_suma;

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
        suma += vector[i];
    }

    vector_suma[tid] = suma;

    // Fin de codigo
    pthread_exit(NULL);
}

int main(int argc, char *argv[])
{

    if ((argc != 4)){
        printf("Usar: %s N T X\n N: Dimension del vector\n T: Cantidad de Threads\n", argv[0]);
        exit(1);
    }
    N = atoi(argv[1]); // Cantidad de elementos del vector
    T = atoi(argv[2]); // Cantidad de Threads
    printf("Elementos del vector: %d\n", N);
    printf("Threads: %d\n", T);

    pthread_t misThreads[T];
    int threads_ids[T];
    double timetick;
    int sumaFinal = 0; 
    int check = 1;
    int id;


    vector = (int *)malloc(sizeof(int) * N);
    vector_suma = (int *)malloc(sizeof(int) * T);

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
        sumaFinal += vector_suma[i];
    }
    promedio = (double)sumaFinal / N;

    // Calculo de tiempo
    double tiempo = dwalltime() - timetick;
    printf("Tiempo en segundos %f\n", tiempo);

    // Verificacion de resultados
    double sumaVerificacion = 0;
    for (int i = 0; i < N; i++){
        sumaVerificacion += vector[i];
    }
    double promedioVerificacion = sumaVerificacion / N;

    if (promedioVerificacion == promedio){
        printf("El promedio calculado es correcto: %f\n", promedio);
    } else {
        printf("Error en el calculo del promedio. Promedio esperado: %f, Promedio calculado: %f\n", promedioVerificacion, promedio);
    }

    return 0;
}