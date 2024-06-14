#include <stdio.h>
#include <stdlib.h>
#define LIMITE 16384

void imprimirSuma(long int sum);

int main() {
    FILE *archivo;
    char* nombre;
    printf("Ingrese el nombre del archivo a leer: "); scanf("%s",nombre);
    archivo = fopen(nombre, "r");
    if (archivo == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
    if (feof(archivo)){
        printf("El archivo esta vacio\n");
        return 2;
    }
    printf("\n");
    unsigned dec, dec2, max, ent;
    long int parc;
    long int suma = 0;
    char c;
    while (!feof(archivo)){
        c = fgetc(archivo);
        if (c != '\n'){
            if (c == '-'){
                fscanf(archivo,"%05u.%04u",&ent, &dec);
                ent = ent + 0x80000000;       //guardamos el signo de ent en el bit mas significativo
            }else{
                fscanf(archivo,"%05u.%04u",&ent, &dec);
                ent += ((c-0x30)*1000);
            }
            if (ent&0x80000000){              //si el numero a sumar es negativo
                parc = ent&0x7FFFFFFF;
                printf("el numero es -%04ld.%04u\n",parc,dec);
                dec2=suma&0x0000000000003FFF;

                if (suma&0x8000000000000000){ //si la suma es negativa
                    dec2 += dec;
                    if (dec2>9999){
                        suma -= 16384;
                        dec2 -= 10000;
                    }
                    suma &= 0xFFFFFFFFFFFFC000;
                    suma += dec2;
                    suma -= parc<<14;
                }else{                         //si la suma es positiva
                    suma -= parc<<14;
                    if (dec > dec2){
                        suma-=16384;
                        suma+=10000;
                    }
                    if (suma&0x8000000000000000){
                        dec2=suma&0x0000000000003FFF;
                        dec2 = 10000-dec2;
                        suma &= 0xFFFFFFFFFFFFC000;
                        suma += dec2;
                        suma += 16384;
                        suma +=dec;
                    }else{
                        suma -= dec;
                    }
                }
            }else{                              //si el numero a sumar es negativo
                printf("el numero es %04u.%04u\n",ent,dec);
                parc = ent;
                dec2=suma&0x0000000000003FFF;
                if (suma&0x8000000000000000){   //si la suma es negativa
                    if(dec2>=dec){
                        suma-=dec;
                    }else{
                        suma &= 0xFFFFFFFFFFFFC000;
                        suma += (dec - dec2);
                    }
                }else{                          //si la suma es positiva
                    max= LIMITE-dec2;
                    if (dec>max){
                        suma-=10000;
                        suma+=16384;
                    }
                    suma+=dec;
                }
                suma += parc<<14;
                dec2 = suma&0x0000000000003FFF;
                if (dec2>9999){
                    suma-=10000;
                    suma+=16384;
                }
            }
           // printf("suma parcial  = ");imprimirSuma(suma); // Con esta linea se pueden comprobar las sumas parciales
        }
        fgetc(archivo);
        printf("\n");
    }
    printf("La suma TOTAL es: ");imprimirSuma(suma);
    return 0;
}

void imprimirSuma(long int suma){
    unsigned dec;
    dec = suma&0x0000000000003FFF;
    suma = suma>>14;
    suma &= 0x0003FFFFFFFFFFFF;
    printf ("%ld.%04u\n",suma,dec);
}
