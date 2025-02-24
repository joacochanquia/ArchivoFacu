#include <stdlib.h>
#include <stdio.h>
#include <htc.h>

#define _XTAL_FREQ 1000000


void iniPorts(){
	TRISA = 0b00000011;
	TRISB = 0;
	PORTB = 0b00110000;
}
void main(){
	iniPorts();
	int start=0;
	int presionado = 0;
	while(1){
		if ((!RA1) || (!RA0) && (!presionado)) {
			start = 1;
			presionado = 1;
		}
		if ((RA1) && (RA0) && (presionado)) {
			start=0;
			presionado = 0;
		}
		if (start == 1){
			RB4^=1;
			RB5^=1;
		}
		__delay_ms(250);
	}
	
}
