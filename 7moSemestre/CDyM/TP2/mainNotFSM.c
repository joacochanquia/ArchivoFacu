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
#include <stdlib.h>


uint8_t KepadUpdate();
uint8_t KEYPAD_Scan (uint8_t *pkey);
void Bienvenida();
void Jugando();
uint8_t Comparar(uint8_t num, uint8_t rsp);
void ImprimirMensaje(uint8_t msj[3]);

int main(void)
{
	uint8_t k;
	uint8_t chars[16] = {'1','2','3','A',
						 '4','5','6','B',
						 '7','8','9','C',
						 '*','0','#','D'};
	LCDinit();
	LCDclr();
	LCDGotoXY(0,0);
	
	while(1) //loop forever
	{	
		Bienvenida();
		while(!KEYPAD_Scan(&k)){};
		if(k == 3){
			Jugando();
		}
		_delay_ms(10);
	}}void Bienvenida(){
	LCDclr();
	LCDGotoXY(0,0);
	LCDstring("BIENVENIDO!",11);
	LCDGotoXY(0,1);
	LCDstring("P/ JUGAR PULSE A",16);
}

void Jugando(){	uint8_t quit=0, timeOut=0;	uint8_t num = rand() % 100;	uint8_t win = 0, first = 0;	uint8_t rsp = 0, act = -1;
	uint8_t k;	uint8_t msj[3] = {' ','*','*'};			LCDclr();
	LCDGotoXY(0,0);
	LCDstring("JUGANDO",7);
	LCDGotoXY(0,1);
	LCDstring("INGRESE NUM",11);	while ((!quit)&&(msj[0] != '=')){		while(!KEYPAD_Scan(&k)){};		if ((k != 3)&&(k != 7)&&(k != 11)&&(k != 12)&&(k < 14)){			if (k<3){				act = '0' + (k+1);			}else{				if (k<7){					act = '0' + k;				}else{					if (k<11){						act = '0' + (k-1);					}else{						act = '0';					}				}			}			if (first){				msj[2] = act;				rsp = (msj[1]-'0')*10 + (msj[2]-'0');				msj[0] = Comparar(num,rsp);				first = 0;				act = -1;			}else{				msj[0] = ' ';				msj[1] = act;				msj[2] = '_';				first = 1;			}			ImprimirMensaje(msj);		}else{			if (k == 15){				quit = 1;			}		}	}	if (!quit){		LCDclr();		LCDGotoXY(0,0);
		LCDstring("GANASTE",7);		LCDGotoXY(0,1);		uint8_t i;		for(i=0;i<3;i++){			LCDsendChar(msj[i]);		}	}	//_delay_ms(3000);}
uint8_t Comparar(uint8_t num, uint8_t rsp){
	if (num < rsp){
		return '<';
	}
	if (num > rsp){
		return '>';
	}
	return '=';
}
void ImprimirMensaje(uint8_t msj[3]){	LCDclr();
	LCDGotoXY(0,0);
	LCDstring("INGRESE OTRO NUM",16);	LCDGotoXY(0,1);	uint8_t i;	for(i=0;i<3;i++){		LCDsendChar(msj[i]);	}}uint8_t KepadUpdate(){	uint8_t r,c;		DDRB |= 0x19; // pongo como salidas los pines 4,3,0 de B	DDRD |=	0x80; // pongo como salida el pin 7 de D	DDRD &= 0xC3; // pongo como entradas los pines 5,4,3,2 de D		PORTD |= 0x3C; //Activo pullup interno en 5,4,3,2 de D		int vecOut[3] = {4,3,0};	int vecIn[4] = {3,5,4,2};			for(c=0;c<4;c++){		PORTB |= 0x19;		PORTD |= 0x80;		if (c<3){			PORTB &= ~(1<<vecOut[c]);			for(r=0;r<4;r++){				if(!(PIND & (1<<vecIn[r]))){					return (c*4+r);				}			}		}else{			PORTD &= ~(1<<7);			for(r=0;r<4;r++){				if(!(PIND & (1<<vecIn[r]))){					return (c*4+r);				}			}		}	}	return 0xFF; //Tecla no presionada}uint8_t KEYPAD_Scan (uint8_t *pkey)
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