#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>
#include <unistd.h>

#define NUM_EXECUTIONS 1000
#define PERIOD_MS 10
#define NANOSECONDS_PER_MILLISECOND 1000000


typedef struct {
    int thread_id;
    long total_latency;
} thread_data_t;


void* thread_function(void* arg) {
    thread_data_t* data = (thread_data_t*)arg;
    struct timespec start, end;
    long latency;

    for (int i = 0; i < NUM_EXECUTIONS; i++) {
        // Obtener el tiempo actual antes de la ejecución
        clock_gettime(CLOCK_MONOTONIC, &start);

        // Simulación de trabajo del thread (ejecución real)
        usleep(PERIOD_MS * 1000); // Esperar el periodo especificado

        // Obtener el tiempo actual después de la ejecución
        clock_gettime(CLOCK_MONOTONIC, &end);

        // Calcular la latencia
        long elapsed_time = (end.tv_sec - start.tv_sec) * 1e9 + (end.tv_nsec - start.tv_nsec);
        latency = elapsed_time - (PERIOD_MS * NANOSECONDS_PER_MILLISECOND);

        // Acumular la latencia
        data->total_latency += latency;
    }
    return NULL;
}

int main() {
    pthread_t threads[2];
    thread_data_t thread_data[2];

    // Inicializar datos de los threads
    for (int i = 0; i < 2; i++) {
        thread_data[i].thread_id = i;
        thread_data[i].total_latency = 0;
    }

    // Crear los threads
    for (int i = 0; i < 2; i++) {
        if (pthread_create(&threads[i], NULL, thread_function, (void*)&thread_data[i]) != 0) {
            perror("Error creando el thread");
            exit(EXIT_FAILURE);
        }
    }

    // Esperar a que terminen los threads
    for (int i = 0; i < 2; i++) {
        pthread_join(threads[i], NULL);
    }

    // Calcular y mostrar el promedio de latencia
    for (int i = 0; i < 2; i++) {
        printf("Thread %d: Latencia total: %ld ns, Promedio: %ld ns\n", 
               i, thread_data[i].total_latency, 
               thread_data[i].total_latency / NUM_EXECUTIONS);
    }

    return 0;
}
