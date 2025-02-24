#include <pthread.h>

pthread_mutex_t mutex;

void *funcion(void *arg){
    while(1){
        pthread_mutex_lock(&mutex);
        Serial.println("Estoy en un espacio reservado");
        pthread_mutex_unlock(&mutex);
    }
}


void main (){
    pthread_t thread1;
    int thread_num1 = 1;
    struct sched_param parametros_thread1;

    pthread_create(&thread1, NULL, funcion, &thread_num1);

    parametros_thread1.sched_priority = 100;
    pthread_setschedparam(thread1, SCHED_FIFO, &parametros_thread1);


    pthread_mutex_init(&mutex, NULL);


    pthread_join(thread1, NULL);
    Serial.print("Ya termino el hilo");

    pthread_mutex_destroy(&mutex);
}
/*

pthread_t thread1;

    Crea un hilo nuevo sin ejecucion por el momento.


pthread_create(&thread1, NULL, funcion, &thread_num1);
    &thread1        :   Variable pthread_p asignada a este hilo
    NULL            :   Atributos del hilo
    funcion         :   Funcion que se ejecutara al ejecutarse este hilo
    &thread_num1    :   Parametros de la funcion para este hilo en especifico
Le asigna una funcion al hilo y pasa los parametros necesarios para la misma.


pthread_join(thread1, NULL);
    thread1         :   thread al que se espera
    NULL            :   valor de retorno del hilo
Espera a la finalizacion del hilo


*/

/*

pthread_mutex_t mutex;

    Definicion del semaforo


pthread_mutex_init(&mutex, NULL);

    Inicializa el semaforo


pthread_mutex_lock(&mutex);

    Reserva el semaforo


pthread_mutex_unlock(&mutex);

    Libera el semaforo


pthread_mutex_destroy(&mutex);

    Se elimina el semaforo


*/