#include <stdlib.h>
#include <stdio.h>
#include <htc.h>

#define _XTAL_FREQ 1000000  // Definir la frecuencia del oscilador a 1 MHz

// Función para configurar el Timer0
void iniTimer0() {
    T0CS = 0;   // Seleccionar el reloj interno (Fosc/4) como fuente para el Timer0
    PSA = 0;    // Asignar el prescaler al Timer0
    PS2 = 1;    // Configurar el prescaler en 1:256 (PS2:PS1:PS0 = 111)
    PS1 = 1;
    PS0 = 1;
    TMR0 = 12;   // Inicializar el registro del Timer0 en 12
    T0IE = 1;   // Habilitar la interrupción del Timer0
    GIE = 1;    // Habilitar interrupciones globales (permite que las interrupciones ocurran)
}
// Toverflow = (4*prescaler*256)/(Fosc) = (4*256*256)/(1000000) = 262,14mS
// Tdelay = 250mS
// TMR0_ini = 256 - (Tdelay*Fosc)/(4*prescaler) = 256 - (0,25*1000000)/(4*256) = 12


// Función para configurar los puertos
void iniPorts() {
    TRISA = 0b00000011;  // Configurar RA0 y RA1 como entradas (bits 0 y 1 en 1)
    TRISB = 0;           // Configurar todos los pines de PORTB como salidas
    PORTB = 0b00110000;  // Inicializar PORTB: RB4 y RB5 en alto (LEDs encendidos)
}

// Variables globales para controlar el estado de los LEDs
volatile int start = 0;      // Indica si los LEDs deben parpadear
volatile int presionado = 0; // Indica si un botón fue presionado

void main() {
    iniPorts();    // Inicializar los puertos
    iniTimer0();   // Inicializar el Timer0

    // Bucle principal
    while (1) {
        // Si alguno de los botones (RA0 o RA1) es presionado y no se ha registrado un presionado previo...
        if ((!RA1 || !RA0) && !presionado) {
            start = 1;         // Habilitar el parpadeo de los LEDs
            presionado = 1;    // Marcar que un botón fue presionado
        }
        // Si ambos botones (RA0 y RA1) están sueltos y un botón fue presionado previamente...
        if (RA1 && RA0 && presionado) {
            start = 0;         // Detener el parpadeo de los LEDs
            presionado = 0;    // Marcar que los botones fueron soltados
        }
    }
}

// Rutina de Interrupción
void interrupt ISR() {
    if (T0IF) {       // Verificar si la interrupción fue causada por el Timer0
        T0IF = 0;     // Limpiar la bandera de interrupción del Timer0
        if (start == 1) {  // Si el parpadeo está habilitado...
            RB4 ^= 1;  // Alternar (toggle) el estado del pin RB4
            RB5 ^= 1;  // Alternar (toggle) el estado del pin RB5
        }
    }
}