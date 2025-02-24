#include <htc.h>

// Configuración del PIC16F84
__CONFIG(FOSC_HS & WDTE_OFF & PWRTE_OFF & CP_OFF);

#define _XTAL_FREQ 4000000  // Frecuencia del oscilador (4MHz en este ejemplo)

void main() {
    // Configuración de los puertos
    TRISA0 = 1;  // RA0 como entrada
    TRISA1 = 1;  // RA1 como entrada
    TRISB4 = 0;  // RB4 como salida
    TRISB5 = 0;  // RB5 como salida

    // Inicialización: ambos LEDs encendidos
    RB4 = 1;
    RB5 = 1;

    while (1) {
        // Verificar si alguno de los pulsadores está presionado
        while (RA0 == 1 && RA1 == 1){

        }
        
        
        
            // Encender y apagar los LEDs de manera alternada
            RB4 = 1;
            RB5 = 0;
            __delay_ms(250);  // Retardo de 250 ms

            RB4 = 0;
            RB5 = 1;
            __delay_ms(250);  // Retardo de 250 ms
        
    }
}