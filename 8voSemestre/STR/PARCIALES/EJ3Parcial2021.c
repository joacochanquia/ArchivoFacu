#include <pthread.h>

void *funcion(void *arg){
    int id = *(int *) arg;
    int i;
    for(i=0; i<1000; i++){
        printf("Tarea %d; Ejecución: %d", id, i);
    }
}

void main (){
    pthread_t thread1, thread2, thread3;
    int thread_num1 = 1;
    int thread_num2 = 2;
    int thread_num3 = 3;

    pthread_create(&thread1, NULL, funcion, &thread_num1);
    pthread_create(&thread2, NULL, funcion, &thread_num2);
    pthread_create(&thread3, NULL, funcion, &thread_num3);

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);
    pthread_join(thread3, NULL);
    print("Ya terminaron todos los hilos");
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