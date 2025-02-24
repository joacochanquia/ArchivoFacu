#include <avr/io.h>
#include <avr/interrupt.h> // Librer?a para el manejo de interrupciones en AVR

#include "PWM.h"
#include "pot.h"
#include "serialPort.h"


#define F_CPU 16000000UL // Especifico la frecuencia de reloj del MCU en 16MHz
#include <util/delay.h> // Retardos por software ? Macros: depende de F_CPU

#define BR9600 (0x67)	// 0x67=103 configura BAUDRATE=9600@16MHz

char msg1[] = "Control de color de un RGB\r\n";
char msgR[] = "Modificando color rojo\r\n";
char msgG[] = "Modificando color verde\r\n";
char msgB[] = "Modificando color azul\r\n";
char msgF[] = "Fin de modificacion\r\n";

uint8_t active = 0; // Indica si se esta modificando un color
uint8_t actual; // Color siendo modificado en el momento

int main(void)
{
	uint8_t cant = 0;
	RGB color;
	
	PWM_Init(); // Inicializacion de las funciones PWM para la intensidad del led
	ADC_Init(); // Inicializacion del modulo ADC para la medida del potenciometro
	
	SerialPort_Init(BR9600); 		// Se inicializa el formato 8N1 y BAUDRATE = 9600bps
	SerialPort_TX_Enable();			// Se activa el Transmisor del Puerto Serie
	SerialPort_RX_Enable();			// Se activa el Receptor del Puerto Serie
	SerialPort_Send_String(msg1);   // Se envía el mensaje de Bienvenida
	SerialPort_RX_Interrupt_Enable();	// Se activa la Interrupción de recepcion.
	sei(); // Se activan las interrupciones globales
	
    while (1) 
    {
		if (active){  // Si se esta modificando un color
			cant = getCant(); // Se recibe el valor del potenciometro
			switch (actual){ // Se configura la intensidad del color correspondiente
				case 'R':
					SetCT_Red(cant); //
				break;
				case 'G':
					SetCT_Green(cant);
				break;
				case 'B':
					SetCT_Blue(cant);
				break;
			}
		}
    }
}

// Rutina de Servicio de Interrupción de Byte Recibido
ISR(USART_RX_vect){
	char RX_Buffer = UDR0; //la lectura del UDR borra flag RXC
	// Si se presiona 'f' se alterna la transmision de datos
	if((RX_Buffer == 'f')||(RX_Buffer == 'F')){ // Si se presiono una F
		active = 0; // Se finaliza la modificacion
		SerialPort_Send_String(msgF);   // Envío el mensaje de Bienvenida
	}
	// Si se presiona 'R' se alterna la transmision de datos
	if((RX_Buffer == 'r')||(RX_Buffer == 'R')){ // Si se presiono una R y no se esta modificando otro color
		active = 1; // Se activa la modificacion de color
		CAct = 'R';
		SerialPort_Send_String(msgR);   // Envío el mensaje de Bienvenida
	}
	// Si se presiona 'G' se alterna la transmision de datos
	if((RX_Buffer == 'g')||(RX_Buffer == 'G')){ // Si se presiono una G
		active = 1; // Se activa la modificacion de color
		CAct = 'G';
		SerialPort_Send_String(msgG);   // Envío el mensaje de Bienvenida
	}
	// Si se presiona 'B' se alterna la transmision de datos
	if((RX_Buffer == 'b')||(RX_Buffer == 'B')){ // Si se presiono una B
		active = 1; // Se activa la modificacion de color
		CAct = 'B';
		SerialPort_Send_String(msgB);   // Envío el mensaje de Bienvenida
	}
	RX_Buffer=0;
}
