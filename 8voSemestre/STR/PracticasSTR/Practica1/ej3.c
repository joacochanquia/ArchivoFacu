#include <htc.h>

#define _XTAL_FREQ 4000000 // Frecuencia del oscilador (4MHz en este ejemplo)

void disp_adc(int value)
{
    PORTB = value & 0xFF; // Escribir el byte inferior en PORTB

    PORTD |= 0x40;  // Activar/desactivar el latch
    __delay_ms(1);  // Esperar
    PORTD &= ~0x40; // Activar/desactivar el latch

    PORTB = (value >> 8) & 0xFF; // Escribir el byte superior en PORTB

    PORTD |= 0x80;  // Activar/desactivar el latch
    __delay_ms(1);  // Esperar
    PORTD &= ~0x80; // Activar/desactivar el latch
}

void main()
{
    TRISA = 0xFF; // Configurar todos los pines de PORTA como entradas
    TRISB = 0x00; // Configurar todos los pines de PORTB como salidas
    TRISD = 0x00; // Configurar todos los pines de PORTD como salidas

    ADCON1 = 0x81; // ADFM=1, todos los pines de entrada analógicos, VREF+ habilitado con entrada en RA3
    ADCON0 = 0xC1; // Encender el ADC y seleccionar canal (0xC5 para comenzar a convertir en AN0)

    while (1)
    {
        ADCON0 = 0xC5; // Iniciar la conversión en AN0 (MISMA CONFIGURACION QUE ARRIBA PERO CON BIT GO EN 1)

        while (ADCON0 & 0b00000100)
            ; // Esperar a que la conversión se complete

        unsigned short adc_value = (ADRESH << 8) | ADRESL; // Combinar los resultados del ADC alto y bajo

        // Mostrar el valor capturado
        PORTD = 0x01; // Mostrar que el ISR está en progreso
        disp_adc(adc_value);
        PORTD = 0x00; // Quitar el bit de progreso

        __delay_ms(64); // Retraso de 64ms
    }
}
