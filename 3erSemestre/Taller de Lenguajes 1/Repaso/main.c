#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include<time.h>

//5
struct destino {
 int codProv;
 int codLoc;
 char nomLoc[30];
 int nHab;
};

//8
typedef struct nodo {
 int dato;
 struct nodo * siguiente;
} lista;

int hola();

//7
int ** reservarTri(int n);
void cargarTri(int ** tri, int n);
void imprimirTri(int ** tri, int n);
void freeTri(int ** tri, int n);

//8
lista * quitar(lista * l, int pos);
lista * newNodo();
void imprimirList(lista * l);
int tamanio(lista * l);

// hola(int argc, char * argv[])
int main(int argc, char * argv[])
{
    //5
    FILE * fText = fopen("Habitantes.txt", "r");
    FILE * fBin = fopen("Habitantes.dat", "w");
    struct destino loc;
    fscanf(fText, "%d %d %s %d", &loc.codProv, &loc.codLoc, loc.nomLoc, &loc.nHab);
    while(!feof(fText)){
        fwrite(&loc, sizeof(struct destino), 1, fBin);
        fscanf(fText, "%d %d %s %d", &loc.codProv, &loc.codLoc, loc.nomLoc, &loc.nHab);
    }
    fclose(fText);
    fclose(fBin);
    int max = -30999999, codMax;
    char nomMax[30];
    fBin = fopen("Habitantes.dat", "r");
    fread(&loc, sizeof(struct destino), 1, fBin);
    while (!feof(fBin)){
        //printf("codProv = %d\n", loc.codProv);
        //printf("codLoc = %d\n", loc.codLoc);
        //printf("nomLoc = %s\n", loc.nomLoc);
        //printf("nHab = %d\n\n", loc.nHab);
        if (loc.nHab > max){
            max = loc.nHab;
            codMax = loc.codLoc;
            strcpy(nomMax, loc.nomLoc);
        }
        fread(&loc, sizeof(struct destino), 1, fBin);
    }
    printf("%s, codigo %d\nNumero de habitantes %d\n\n", nomMax, codMax, max);
    fclose(fBin);

    //6
    if(argc < 2){
        fprintf(stderr,"no se recibieron palabras\n\n");
    }
    else{
        char frase[300] = "";
        int i;
        for (i=1; i<argc; i++){
            strcat(frase, argv[i]);
            strcat(frase, " ");
        }
        fputs(frase, stdout);
        fprintf(stdout, "\n\n");
    }

    //7
    int ** tri;
    int n = 5;
  //  fscanf(stdin, "%d", &n);
    tri = reservarTri(n);
    cargarTri(tri, n);
    imprimirTri(tri, n);
    freeTri(tri, n);
    printf("\n\n");

    //8
    lista * l = NULL;
    lista * nuevo;
    int i;
    for(i=10; i; i--){
        nuevo = newNodo();
        nuevo->dato = i;
        nuevo->siguiente = l;
        l = nuevo;
    }
    imprimirList(l);
    l = quitar(l,3);
    imprimirList(l);
    l = quitar(l,1);
    imprimirList(l);
    l = quitar(l,11);
    printf("lista no cambia: \n");
    imprimirList(l);
    printf("\n");
    while(l!=NULL){
        l = quitar(l, tamanio(l));
        imprimirList(l);
    }
    printf("lista vacia: \n");
    imprimirList(l);

    printf("Matrices: \n\n");

    hola();

    FILE * f;
    f = fopen("prueba.txt", "w");
    if(!f){
        fprintf(stderr, "ERROR AL ABRIR ARCHIVO DE TEXTO");
        return 1;
    }

    if(fprintf(f, "Texto con espacios.") < 0){
        printf("error al escribit en txt\n");
    }

    fclose(f);

    FILE * fr;
    fr = fopen("prueba.txt", "r");
    if(!fr){
        fprintf(stderr, "ERROR AL ABRIR ARCHIVO LECTURA");
        return 1;
    }

    char *palabra = malloc(100);
    fscanf(fr, "%s", palabra);
    printf("fscanf(fr, , palabra); == %s\n", palabra);

    fseek(fr, 0, SEEK_SET);
    char c;
    c = fgetc(fr);
    printf("fgetc == %c\nfputc == ", c);
    fputc(c, stdout);

    fseek(fr, 0, SEEK_SET);
    fgets(palabra, 30, fr);
    printf("\nfgets(palabra, 30, fr); == %s", palabra);
    printf("seguido\nfputs == ");
    fputs(palabra, stdout);
    printf("seguido\n");





    fclose(fr);
    return 0;
}

//8
lista * quitar(lista * l, int pos){
    lista * aux = l;
    lista * ant = l;
    if((l != NULL)&&(pos >= 1)&&(pos <= tamanio(l))){
        if(pos == 1){
            l = l->siguiente;
            free(aux);
        }
        else{
            pos -= 2;
            aux = aux->siguiente;
            while (pos){
                aux = aux->siguiente;
                ant = ant->siguiente;
                pos -= 1;
            }
            ant->siguiente = aux->siguiente;
            free(aux);
        }
    }
    return l;
}
lista * newNodo(){
    return (lista*) calloc(1, sizeof(lista));
}
void imprimirList(lista * l){
    printf("lista: ");
    while(l!=NULL){
        printf("%4d ", l->dato);
        l = l->siguiente;
    }
    printf("\n");
}
int tamanio(lista * l){
    int tam = 0;
    while (l != NULL){
        tam++;
        l = l->siguiente;
    }
    return tam;
}

//7
int ** reservarTri(int n){
    int ** tri;
    int i;
    tri = (int**) malloc(n*sizeof(int*));
    for(i=0; i<n; i++){
        tri[i] = (int*) malloc((i+1)*sizeof(int));
    }
    return tri;
}
void cargarTri(int ** tri, int n){
    int i, j;
    srand(time(NULL));
    for(i=0; i<n; i++){
        for(j=0; j<=i; j++){
            tri[i][j] = rand()%21;
        }
    }
}
void imprimirTri(int ** tri, int n){
    int i, j;
    for(i=0; i<n; i++){
        for(j=0; j<=i; j++){
            printf("%4d ", tri[i][j]);
        }
        printf("\n");
    }
}
void freeTri(int ** tri, int n){
    int i;
    for(i=0; i<n; i++){
        free(tri[i]);
    }
    free(tri);
}
