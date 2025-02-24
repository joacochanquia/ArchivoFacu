#include <avr/io.h>
#include <avr/interrupt.h> // Libreria para el manejo de interrupciones en AVR
#include "pot.h"

void ADC_Init(){
	ADCSRA |= (1<<ADEN);
	ADCSRA |= (1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0);
	ADMUX |= (1<<ADLAR)|(1<<REFS0); //left justified , AVCC as Vref
	ADMUX |= (1<<MUX1)|(1<<MUX0);
}

uint8_t getCant(){
	ADCSRA |= (1<<ADSC);
	
	while ((ADCSRA & (1<<ADIF))==0);
	ADCSRA |= (1<<ADIF);
	
	return ADCH; //resultado de 8 bits justificado a izq.
}