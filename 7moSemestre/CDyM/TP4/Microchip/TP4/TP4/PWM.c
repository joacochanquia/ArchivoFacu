#include "PWM.h"

static uint8_t DELTA;
static uint8_t cuenta;

ISR(TIMER0_COMPA_vect) { // Rutina de servicio a interrupcion
	cuenta++;
	if (cuenta < DELTA){
		PORTB &= ~(1<<PORTB5); // Se pone el pin en 0 para prender el led
	}else{
		PORTB |= (1<<PORTB5); // Se pone el pin en 1 para apagar el led
	}
}

// Inicializacion del PWM por software
void PWM_Init(){
	
	DDRB |= (1<<PORTB1)|(1<<PORTB2)|(1<<PORTB5);
	
	// Modo PWM 
	// Luz Azul
	TCCR1A |= (1<<COM1A1)|(1<<COM1A0)|(1<<COM1B1)|(1<<COM1B0)|(1<<WGM10);
	TCCR1A &= ~(1<<WGM11);
	// Luz Verde
	TCCR1B |= (1<<CS10)|(1<<WGM12);
	TCCR1B &= ~(1<<WGM13);
	// Setteo de los valores iniciales de los comparadores
	OCR1A = 0; //BLUE LED
	OCR1B = 0; //GREEN LED
	
	// Luz Roja
	// Modo CTC TOP: OCRA
	TCCR0A |= (1<<WGM01);
	TCCR0A &= ~(1<<WGM00);
	TCCR0B &= ~(1<<WGM02);
	// Prescaler clk/64
	TCCR0B |= (1<<CS01)|(1<<CS00);
	TCCR0B &= ~(1<<CS02);
	// Comparador en el valor para la cuenta cada 40 us
	OCR0A = 10;
	// Se habilita la interrupcion COMP A
	TIMSK0 |= (1<<OCIE0A);
	
	// Inicializo variables
	DELTA = 0;
	cuenta = 0;
}

// Configuracion del ciclo de trabajo
void SetCT_Red(uint8_t comp){
	DELTA = comp;
}
void SetCT_Green(uint8_t comp){
	OCR1B = comp;
}
void SetCT_Blue(uint8_t comp){
	OCR1A = comp;
}