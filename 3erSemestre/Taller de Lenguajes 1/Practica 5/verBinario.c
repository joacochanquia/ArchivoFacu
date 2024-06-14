#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LONG 300


typedef struct {
    int id;
    int dni;
    char apellido[20];
    char nombre[20];
    char trabajo[30];
    char correo[100];
    char ciudad[20];
    char pais[20];
} personaT;


int main()
{
    FILE * f;
    f = fopen("personas.idx", "rb");
    if(f==NULL){
        printf("ERROR");
        return 1;
    }
    int dni, pos;
    fread(&dni, sizeof(int), 1, f);
    fread(&pos, sizeof(int), 1, f);
    printf("%d en la posicion %d\n", dni, pos);
    fread(&dni, sizeof(int), 1, f);
    fread(&pos, sizeof(int), 1, f);
    printf("%d en la posicion %d\n", dni, pos);
    fread(&dni, sizeof(int), 1, f);
    fread(&pos, sizeof(int), 1, f);
    printf("%d en la posicion %d\n", dni, pos);
    fread(&dni, sizeof(int), 1, f);
    fread(&pos, sizeof(int), 1, f);
    printf("%d en la posicion %d\n", dni, pos);
    fread(&dni, sizeof(int), 1, f);
    fread(&pos, sizeof(int), 1, f);
    printf("%d en la posicion %d\n", dni, pos);
    fread(&dni, sizeof(int), 1, f);
    fread(&pos, sizeof(int), 1, f);
    printf("%d en la posicion %d\n", dni, pos);
    fclose(f);
    return 0;

}
