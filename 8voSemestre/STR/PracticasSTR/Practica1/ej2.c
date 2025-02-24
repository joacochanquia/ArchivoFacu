#include <htc.h>

// Configuración del PIC16F84
__CONFIG(FOSC_HS &WDTE_OFF &PWRTE_OFF &CP_OFF);

#define _XTAL_FREQ 4000000 // Frecuencia del oscilador (4MHz en este ejemplo)

int alternador = 0;
void interrupt INT_ISR(void)
{
    // Verifica si la interrupción es por el Timer0
    if (T0IF && T0IE)
    {
        if (alternador == 0)
        {
            RB4 = 1;
            RB5 = 0;
            alternador = 1;
        }
        else
        {
            RB4 = 0;
            RB5 = 1;
            alternador = 0;
        }
        T0IF = 0; // Limpia la bandera de la interrupción
        TMR0 = 6; // Reinicia el valor del Timer0 para que genere una interrupción cada 250 ms
    }
}

void main()
{
    GIE = 1; // Habilitar las interrupciones globales
    // Configuración del Timer0
    // Deshabilitar la interrupción por desbordamiento del Timer0
    PSA = 0;                                         // Asignar el preescalador al Timer0
    OPTION_REG = (OPTION_REG & 0b111111110) | 0b111; // Configuración del Timer0 con preescalador 1:256
    T0CS = 0;                                        // Fuente de reloj interna para el Timer0
    INTCON = 0b10000000;                             // Habilitar las interrupciones globales y la interrupción externa INT
    TMR0 = 6;

    // Con toda la configuracion aplicada el timer0 generara una interrupcion cada 250ms

    // Configuración de los puertos
    TRISA = 0xFF; // Puerto A como entradas
    TRISB = 0x00; // Puerto B como salidas
    RB4 = 1;      // Inicialización: LED RB4 encendido
    RB5 = 1;      // Inicialización: LED RB5 encendido

    while (1)
    {
        if (RA0 == 0 || RA1 == 0)
        {
            // Inicio el timer0
            INTCON = 0b10100000;
        }
    }
}
