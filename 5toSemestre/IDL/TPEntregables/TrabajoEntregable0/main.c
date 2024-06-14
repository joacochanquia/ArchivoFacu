#include <stdio.h>
#include <stdlib.h>
#define BITS_DEC 14
#define TIPO_SUMA long long

int representarNum(unsigned signo,unsigned ent,unsigned dec);
void imprimirNum(unsigned sum);
void imprimirSuma(TIPO_SUMA sum);

int main(){
    FILE *archivo;
    char nombre[100];
    printf("Ingrese el nombre del archivo a leer: "); scanf("%s",nombre);
    archivo = fopen(nombre, "r"); //Abro el archivo como solo lectura
    if (archivo == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
    if (feof(archivo)){
        printf("El archivo esta vacio\n");
        return 2;
    }
    printf("\n");
    char c;
    unsigned signo, ent, dec;
    int num;
    TIPO_SUMA suma =0;
    while (!feof(archivo)){
        c = fgetc(archivo);
        if (c != '\n'){
            if (c == '-'){
                signo = 1;
                fscanf(archivo,"%u.%u",&ent, &dec);
            }else{
                signo = 0;
                fscanf(archivo,"%u.%u",&ent, &dec);
                ent += ((c-0x30)*100000); //Si el numero es positivo el fgetc() agarro el primer digito del numero por lo que debo volver a sumarlo
            }
            num = representarNum(signo,ent,dec);
            suma += num;;
            printf("\nEl numero es: ");imprimirNum(num); //Descomentar esta linea para ver representados los numeros del archivo
            printf("La suma parcial es: ");imprimirSuma(suma); //Descomentar esta linea para ver suma en cada operacion
        }
        fgetc(archivo);
    }
    printf("La suma TOTAL es: ");imprimirSuma(suma);
    return 0;
}

int representarNum(unsigned signo,unsigned ent,unsigned dec){
    int num = ent<<BITS_DEC;  //Copio la parte entera al num en la zona correspondiente
    int mask=1<<(BITS_DEC-1); //La mascara se ubica en el primer bit de los decimales
    int comp=5000000; //Usar una comparacion de 5000000 en lugar de una de 5000 nos daba mayor precision en los bits menos significativos
    dec *= 1000;      //Pero al usarla debiamos multiplicar dec por 1000 para que sea del mismo orden que la comparacion
    for (int i=0;i<14;i++){
        if (dec > comp){ //Si dec es mas grande que el comparador significa que el bit por el que estamos pasando debe estar activo
            dec -= comp; //Resto el comparador para que dec vuelva a ser menor que el comparador
            num += mask; //Activo el bit en el numero
        }
        mask = mask >> 1; //Acomodo la mascara y el comparador
        comp /= 2;
    }
    if (!(num&1)&&(dec>0)){
        num +=1;
    }
    if (signo){
        num = ~num; //Invierto los bits del num si es negativo (queda en CA1)
        num += 1;   //Sumo uno para pasar de CA1 a CA2
    }
    return num;
}

void imprimirSuma(TIPO_SUMA num){
    int signo = 0;
    unsigned dec;
    if (num&0x8000000000000000){ //verifico si el numero es negativo
        signo = 1;
        num -= 1;
        num = ~num;
    }
    int mask=1<<(BITS_DEC-1);
    int comp=5000000;
    for (int i=0;i<14;i++){
        if (num&mask){  //Si el bit que indica la mascara esta prendido, sumo el comparador a dec
            dec += comp;
        }
        mask = mask >> 1;
        comp /= 2;
    }
    dec /= 1000;
    num = num>>BITS_DEC;
    printf("%c%lld,%04u\n",signo ? '-' : ' ',num,dec);
}

void imprimirNum(unsigned num){
    int signo = 0;
    unsigned ent, dec;
    if (num&0x80000000){
        signo = 1;
        num -= 1;
        num = ~num;
    }
    int mask=1<<(BITS_DEC-1);
    int comp=5000000;
    for (int i=0;i<14;i++){
        if (num&mask){
            dec += comp;
        }
        mask = mask >> 1;
        comp /= 2;
    }
    if ((dec%1000)>500){
        dec+=1000;
    }
    dec /= 1000;
    ent = num>>BITS_DEC;
    printf("%c%05u,%04u\n",signo ? '-' : ' ',ent,dec);
}
