#include "sapi.h"  // Biblioteca de la EDU-CIAA

// Definir los pines para control del motor paso a paso
#define STEP_PIN 1  // GPIO1 para STEP
#define DIR_PIN  2  // GPIO2 para Dirección (DIR)

// Función para inicializar los pines GPIO
void initGPIO(void) {
   boardConfig();
   
   gpioConfig(GPIO0, GPIO_OUTPUT);
   gpioConfig(GPIO2, GPIO_OUTPUT);
}

// Función para realizar un paso del motor
void stepMotor(bool direction) {
    // Configurar la dirección del motor
    if (direction) {
        gpioWrite(GPIO2, ON);  // Sentido horario
    } else {
        gpioWrite(GPIO2, OFF);   // Sentido antihorario
    }
    
    // Generar un pulso en el pin STEP
    gpioWrite(GPIO0, ON);  // Enviar pulso alto
    //for (volatile int i = 0; i < 10000; i++);             // Pequeño retardo
    delay(1);
    gpioWrite(GPIO2, OFF);   // Enviar pulso bajo
}

// Función principal del programa
int main(void) {
    // Inicializar GPIO
    initGPIO();
    
    // Bucle infinito para controlar el motor
    while (1) {
        // Realizar 200 pasos en sentido horario
        for (int i = 0; i < 200; i++) {
            stepMotor(true);
            //for (volatile int j = 0; j < 100000; j++);  // Retardo para controlar la velocidad
            delay(500);
        }

        // Pequeña pausa antes de cambiar de dirección
        for (volatile int k = 0; k < 1000000; k++);
           delay(1000);
        
        // Realizar 200 pasos en sentido antihorario
        for (int i = 0; i < 200; i++) {
            stepMotor(false);
            //for (volatile int j = 0; j < 100000; j++);  // Retardo para controlar la velocidad
           delay(500);
        }
        
        // Pausa antes de repetir el ciclo
        for (volatile int k = 0; k < 1000000; k++);
           delay(1000);
    }

    return 0;
}