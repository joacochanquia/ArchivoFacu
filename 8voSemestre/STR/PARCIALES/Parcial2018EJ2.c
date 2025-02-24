#include <stdlib.h>
#include <stdio.h>
#include <htc.h>

#define _XTAL_FREQ 1000000


int espera(int n){
    int i = 0;
    while (i < n){
        if (flag){
            flag = 0;
            i++;
        }
        if (boton){
            boton = 0;
            return 1;
        }
    }
    return 0;
}

void timer_init(){
    TOCS = 0;
    PSA = 0;
    PS2 = 1;
    PS1 = 1;
    PS0 = 1;
    TMR0 = 246;
    T0IE = 1;
    GIE = 1;
}

void port_init(){
    TRISA = 0b00000001;
    TRISB = 0b00000000;
}


void main(){
    while (1){
        //verde
        PORTB = 1;
        if (espera(40)){
            //amarillo
            PORTB = 2;
            espera(10);

            //rojo
            PORTB = 4;
            espera(20);
        }else{
            //amarillo
            PORTB = 2;
            espera(10);

            //rojo
            PORTB = 4;
            espera(40);
        }
    }

}

void interrupt ISR(){
    if (T0IF){
        T0IF = 0;
        TMR0 = 246;
        flag = 1;
        if ((RB0)&&(RA0)){
            boton = 1;
        }
    }
}






/*

// Funcion para inicializar el ADC
void initADC() {
    ADCON0 = 0x01;  // Seleccionar canal AN0 y encender el ADC
    ADCON1 = 0x0E;  // Configurar AN0 como analogico, VREF = VCC 0b00001110
    ADFM = 1;
}

// Funcion para leer el valor analogico desde AN0
unsigned int readADC() {
    __delay_us(20);  // Pequena espera para la adquisicion
    GO_nDONE = 1;    // Iniciar la conversion ADC
    while(GO_nDONE); // Esperar a que termine
    return (ADRESH << 8) | ADRESL;  // Devolver el valor de 10 bits 
    
    0b000000XX XXXXXXXX
    0bXXXXXXXX XX000000
    (ADRESH >> 6) | (ADRESL >> 6)
}




*/