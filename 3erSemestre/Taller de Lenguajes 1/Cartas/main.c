#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define TAM_MAZO 54
#define PALO1 ESPADA
#define PRPALO1 "espada"
#define PALO2 BASTO
#define PRPALO2 "basto"
#define PALO3 ORO
#define PRPALO3 "oro"
#define PALO4 COPA
#define PRPALO4 "copa"
#define TRUCO 0
#define COMODINES 1

typedef enum { PALO1, PALO2, PALO3, PALO4 } palos;

typedef struct {
    unsigned numero : 4;
    unsigned palo : 2;
}cartaT;


void iniciarCarta(cartaT * c, unsigned palo, unsigned numero);
void iniciarMazo(cartaT mazo[], unsigned cant);
void swapCarta(cartaT *ptra, cartaT *ptrb);
void barajar(cartaT mazo[], unsigned cant);
cartaT sacarCarta(cartaT mazo[], unsigned cant);
void imprimirCarta(cartaT carta);

int main(){
    cartaT mazo[TAM_MAZO];
    iniciarMazo(mazo, TAM_MAZO);
    srand(time(NULL));
    barajar(mazo, TAM_MAZO);
    cartaT carta;
    unsigned i;
    printf("Sacar una carta?(si=1; no=0)\n");
    scanf("%u", &i);
    while(i!=0){
        carta=sacarCarta(mazo, TAM_MAZO);
        imprimirCarta(carta);
        printf("Sacar una carta?(si=1; no=0)\n");
        scanf("%u", &i);
    }
    return 0;
}


void iniciarCarta(cartaT * c, unsigned palo, unsigned numero){
    c->numero = numero;
    c->palo = palo;
}
void iniciarMazo(cartaT mazo[], unsigned cant){
    unsigned n, p, i=0;
    printf("Inicializando mazo...\n");
    if (TRUCO){
        for (p=0; p<4; p++){
            for(n=1; n<8; n++) iniciarCarta(&mazo[i++], p, n);
            for(n=10; n<13; n++) iniciarCarta(&mazo[i++], p, n);
        }
    }
    else{
        unsigned k = cant/4;
        for (p=0; p<4; p++){
            for(n=1; n<=k; n++) iniciarCarta(&mazo[i++], p, n);
        }
        while(i<cant){
            iniciarCarta(&mazo[i++], 0, 0);
        }
    }
}

void swapCarta(cartaT *ptra, cartaT *ptrb) {
    cartaT tmp;
    tmp = *ptra; // guarda el valor de a
    *ptra = *ptrb;   // almacena b en a
    *ptrb = tmp; // almacena a en b
    }
void barajar(cartaT mazo[], unsigned cant){
    printf("Barajando...\n");
    unsigned i;
    for(i=0; i<(10*cant); i++){
        swapCarta(&mazo[rand()%cant], &mazo[rand()%cant]);
    }
}

cartaT sacarCarta(cartaT mazo[], unsigned cant){
    unsigned i;
    cartaT aux;
    aux=mazo[0];
    for(i=1; i<cant; i++){
        mazo[i-1]=mazo[i];
    }
    mazo[cant-1]=aux;
    printf("Sacaste una carta\n");
    return aux;
}

void imprimirCarta(cartaT carta){
    if(carta.numero != 0){
        switch (carta.palo){
        case PALO1 :
            printf("%u de %s\n", carta.numero, PRPALO1);
            printf("%c%c%c%c%c%c%c%c%c%c\n",0xDA,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xBF);
            printf("%c %-2u     %c\n",0xB3,carta.numero,0xB3);
            printf("%c        %c\n",0xB3,0xB3);
            printf("%c %*s%*s %c\n",0xB3,3+((int)strlen(PRPALO1)/2),PRPALO1,3-((int)strlen(PRPALO1)/2),"",0xB3);
            printf("%c        %c\n",0xB3,0xB3);
            printf("%c     %2u %c\n",0xB3,carta.numero,0xB3);
            printf("%c%c%c%c%c%c%c%c%c%c\n",0xC0,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xD9);
            break;
        case PALO2 :
            printf("%d de %s\n", carta.numero, PRPALO2);
            printf("%c%c%c%c%c%c%c%c%c%c\n",0xDA,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xBF);
            printf("%c %-2u     %c\n",0xB3,carta.numero,0xB3);
            printf("%c        %c\n",0xB3,0xB3);
            printf("%c %*s%*s %c\n",0xB3,3+((int)strlen(PRPALO2)/2),PRPALO2,3-((int)strlen(PRPALO2)/2),"",0xB3);
            printf("%c        %c\n",0xB3,0xB3);
            printf("%c     %2u %c\n",0xB3,carta.numero,0xB3);
            printf("%c%c%c%c%c%c%c%c%c%c\n",0xC0,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xD9);
            break;
        case PALO3 :
            printf("%d de %s\n", carta.numero, PRPALO3);
            printf("%c%c%c%c%c%c%c%c%c%c\n",0xDA,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xBF);
            printf("%c %-2u     %c\n",0xB3,carta.numero,0xB3);
            printf("%c        %c\n",0xB3,0xB3);
            printf("%c %*s%*s %c\n",0xB3,3+((int)strlen(PRPALO3)/2),PRPALO3,3-((int)strlen(PRPALO3)/2),"",0xB3);
            printf("%c        %c\n",0xB3,0xB3);
            printf("%c     %2u %c\n",0xB3,carta.numero,0xB3);
            printf("%c%c%c%c%c%c%c%c%c%c\n",0xC0,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xD9);
            break;
        case PALO4 :
            printf("%d de %s\n", carta.numero, PRPALO4);
            printf("%c%c%c%c%c%c%c%c%c%c\n",0xDA,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xBF);
            printf("%c %-2u     %c\n",0xB3,carta.numero,0xB3);
            printf("%c        %c\n",0xB3,0xB3);
            printf("%c %*s%*s %c\n",0xB3,3+((int)strlen(PRPALO4)/2),PRPALO4,3-((int)strlen(PRPALO4)/2),"",0xB3);
            printf("%c        %c\n",0xB3,0xB3);
            printf("%c     %2u %c\n",0xB3,carta.numero,0xB3);
            printf("%c%c%c%c%c%c%c%c%c%c\n",0xC0,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xD9);
            break;
        }
    }
    else{
        printf("COMODIN\n");
            printf("%c%c%c%c%c%c%c%c%c%c\n",0xDA,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xBF);
            printf("%c        %c\n",0xB3,0xB3);
            printf("%c COMO   %c\n",0xB3,0xB3);
            printf("%c        %c\n",0xB3,0xB3);
            printf("%c    DIN %c\n",0xB3,0xB3);
            printf("%c        %c\n",0xB3,0xB3);
            printf("%c%c%c%c%c%c%c%c%c%c\n",0xC0,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xC4,0xD9);
    }


}
