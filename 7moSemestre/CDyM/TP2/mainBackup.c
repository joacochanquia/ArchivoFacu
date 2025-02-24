/*
* toggleProgram.c
*
* This program toggles ports B and C.
*
* Created: 4/3/2015 4:43:51 PM
* Author: Naimi
*/
#include <avr/io.h>
#include <avr/io.h>
#define F_CPU 16000000UL
#include <util/delay.h>
#include <stdint.h>
#include "lcd.h"



uint8_t KepadUpdate();
uint8_t KEYPAD_Scan(uint8_t *pkey);
void Bienvenida();
void Jugando();


int main(void)
{
	uint8_t k;
	uint8_t chars[16] = {'1','2','3','A',
						 '4','5','6','B',
						 '7','8','9','C',
						 '*','0','#','D'};
	uint8_t cont=0;
	LCDinit();
	LCDclr();
	LCDGotoXY(0,0);
	
	while(1) //loop forever
	{	
		if(KEYPAD_Scan(&k)){
			cont++;
			if (cont==16){
				LCDclr();
				cont = 0;
			}
			LCDsendChar(chars[k]);
		}
		_delay_ms(10);
	}}uint8_t KepadUpdate(){	uint8_t r,c;		DDRB |= 0x19; // pongo como salidas los pines 4,3,0 de B	DDRD |=	0x80; // pongo como salida el pin 7 de D	DDRD &= 0xC3; // pongo como entradas los pines 5,4,3,2 de D		PORTD |= 0x3C; //Activo pullup interno en 5,4,3,2 de D		int vecOut[3] = {4,3,0};	int vecIn[4] = {3,5,4,2};			for(c=0;c<4;c++){		PORTB |= 0x19;		PORTD |= 0x80;		if (c<3){			PORTB &= ~(1<<vecOut[c]);			for(r=0;r<4;r++){				if(!(PIND & (1<<vecIn[r]))){					return (c*4+r);				}			}		}else{			PORTD &= ~(1<<7);			for(r=0;r<4;r++){				if(!(PIND & (1<<vecIn[r]))){					return (c*4+r);				}			}		}	}	return 0xFF; //Tecla no presionada}uint8_t KEYPAD_Scan (uint8_t *pkey)
{
	static uint8_t Old_key, Last_valid_key=0xFF; // no hay tecla presionada;
	uint8_t Key;
	Key= KepadUpdate();
	if(Key==0xFF){
		Old_key=0xFF; // no hay tecla presionada
		Last_valid_key=0xFF;
		return 0;
	}
	if(Key==Old_key) { //2da verificación
		if(Key!=Last_valid_key){ //evita múltiple detección
			*pkey=Key;
			Last_valid_key = Key;
			return 1;
		}
	}
	Old_key=Key; //1era verificación
	return 0;
}