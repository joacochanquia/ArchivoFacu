#include <htc.h>

#define _XTAL_FREQ 4000000  // Frecuencia del oscilador (4 MHz)
#define LATCH1 RD6          // Controla el primer latch (RD6)
#define LATCH2 RD7          // Controla el segundo latch (RD7)

// Función para inicializar el ADC
void initADC() {
    ADCON0 = 0x01;  // Seleccionar canal AN0 y encender el ADC
    ADCON1 = 0x0E;  // Configurar AN0 como analógico, VREF = VCC
    ADFM = 1;
}

// Función para leer el valor analógico desde AN0
unsigned int readADC() {
    __delay_us(20);  // Pequeña espera para la adquisición
    GO_nDONE = 1;    // Iniciar la conversión ADC
    while(GO_nDONE); // Esperar a que termine
    return (ADRESH << 8) | ADRESL;  // Devolver el valor de 10 bits
}

// Función para inicializar los puertos
void initPorts() {
    TRISA = 0x01;  // AN0 como entrada
    TRISB = 0x00;  // Puerto B como salida (para enviar los datos a los latchs)
    TRISD = 0x00;  // Puerto D como salida (para controlar los latchs)
    PORTB = 0x00;  // Limpiar puerto B
    PORTD = 0x00;  // Limpiar puerto D
}

// Función para actualizar los displays con un valor de 16 bits
void updateDisplay(unsigned int value) {
    unsigned char digit;
    
    // Mostrar el dígito más significativo en el display 1
    digit = (value >> 8) & 0xFF;  // Más significativos 8 bits
    PORTB = digit;        // Enviar el dígito al puerto B
    LATCH2 = 1; LATCH2 = 0;  // Activar el primer latch (display 1)
    __delay_ms(1);  // Esperar para estabilidad

    // Mostrar el segundo dígito en el display 2
    digit = (value) & 0xFF;   // Siguiente dígito
    PORTB = digit; 
    LATCH1 = 1; LATCH1 = 0;  // Activar el segundo latch (display 2)
    __delay_ms(1);  // Esperar para estabilidad
}

// Programa principal
void main() {
    unsigned int adcValue;
    
    initPorts();    // Inicializar puertos
    initADC();      // Inicializar ADC
    
    while(1) {
        adcValue = readADC();        // Leer valor del ADC
        updateDisplay(adcValue);     // Mostrar valor en los displays
        __delay_ms(500);             // Esperar antes de la siguiente lectura
    }
}