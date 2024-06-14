#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LONG 300

typedef struct{
    char nombre[20];
    char apellido[20];
    int edad;
    int titulos;
    int ranking;
    float fortuna;
} jugadorT;

typedef struct{
    float acidez_fija;
    float acidez_volatil;
    float acido_citrico;
    float azucares;
    float PH;
    float sulfatos;
    float alcohol;
    float calidad;
    char tipo[20];
} vinoT;

typedef struct{
    int dni;
    int dezp;
} indiceT;

typedef struct{
    indiceT * ind;
    int tam;
} Indice;

typedef struct nodoE{
    int dato;
    int dezp;
    struct nodoE *sig;
} listaE;

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

void reservarNodoLE(listaE ** ptrL);
listaE * newNodoLE();
void vaciarLE(listaE ** ptrL);
void eliminarInicioLE(listaE ** ptrL);
void freeLE(listaE ** ptrL);
void agregarAscendenteLE(listaE ** ptrL, indiceT dato);
int cargarListaIndice(listaE ** l);
int crearIndice(listaE * l);
Indice cargarIndice();
int buscar(FILE* personas, Indice indice, int dni, personaT * persona);
int encontrarDNI(Indice indice, int dni, int ini, int fin);
int buscar2(FILE* personas, FILE* indice, int dni, personaT * persona);

int main()
{
/*
    FILE *f;
    FILE *nuevo;
    // Abrir el archivo
    f = fopen("prueba.txt", "r");
    if (f == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
    //a
    nuevo = fopen("Ej2a.txt", "w");
    if (nuevo == NULL){
        printf ("\nError al abrir archivo destino\n");
        return 1;
    }
    char c;
    c = fgetc(f);
    while (!feof(f)){
        // guardar el char en el nuevo
        fputc(c, nuevo);
        // leer un char del archivo
        c = fgetc(f);
    }
    fclose(nuevo);
    //b
    fseek(f, 0, SEEK_SET);
    nuevo = fopen("Ej2b.txt", "w");
    if (nuevo == NULL){
        printf ("\nError al abrir archivo destino\n");
        return 1;
    }
    // leer una linea del archivo
    char linea[LONG];
    fgets(linea,LONG,f);
    linea[strlen(linea)] = '\0';
    while (!feof(f)){
        // imprimir la linea en la pantalla
        fputs(linea, nuevo);
        // leer una linea del archivo
        fgets(linea,LONG,f);
        linea[strlen(linea)] = '\0';
    }
    fclose(nuevo);
    //c
    fseek(f, 0, SEEK_SET);
    nuevo = fopen("Ej2c.txt", "w");
    if (nuevo == NULL){
        printf ("\nError al abrir archivo destino\n");
        return 1;
    }
    // leer una linea del archivo
   // char linea[LONG];
    fread(linea, ftell(f), 1, f);
    linea[strlen(linea)-1] = '\0';
    while (!feof(f)){
        // imprimir la linea en la pantalla
        fwrite(linea, strlen(linea)+1, 1, nuevo);
        // leer una linea del archivo
        fread(linea, LONG, 1, f);
        linea[strlen(linea)-1] = '\0';
    }
    fclose(nuevo);

    fclose(f);
*/
/*
    FILE *f;
    // Abrir el archivo
    f = fopen("MayusMinusNums.txt", "r");
    if (f == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
    int may=0, min=0, dig=0;
    char c;
    c = fgetc(f);
    while (!feof(f)){
        // veo que es el char
        if((c>='a')&&(c<='z')){
            min++;
        }
        else{
            if((c>='A')&&(c<='Z')){
                may++;
            }
            else{
                if((c>='0')&&(c<='9')){
                    dig++;
                }
            }
        }
        // leer un char del archivo
        c = fgetc(f);
    }
    fprintf(stdout, "Mayusculas: %d\nMinusculas: %d\nDigitos: %d\n", may, min, dig);
    fclose(f);
*/
/*
    FILE *f;
    // Abrir el archivo
    f = fopen("precipitaciones.txt", "r");
    if (f == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
    int max = -30999999, dia, mm, i;
    for(i=1; i<=31; i++){
        fscanf(f, "%d-", &mm);
        if(mm>max){
            max = mm;
            dia = i;
        }
    }
    fprintf(stdout, "El maximo fue el dia %d con %d mm", dia, max);
    fclose(f);
*/
/*
    FILE *f;
    // Abrir el archivo
    f = fopen("apuestas.txt", "r");
    if (f == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
    int num;
    float suma=0, monto;
    fscanf(f, "%d|%f;", &num, &monto);
    while(!feof(f)){
        suma += monto;
        fscanf(f, "%d|%f;", &num, &monto);
    }
    fprintf(stdout, "El total apostado fue de $%.2f", suma);
    fclose(f);
*/

    FILE *f;
    // Abrir el archivo
    f = fopen("palabras.txt", "r");
    if (f == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
    char palabra[20];
    char ** vector = NULL;
    int cant = 0, i;
    fgets(palabra, 20, f);
    palabra[strlen(palabra)-1]='\0';
    while(!feof(f)){
        vector = (char **) realloc(vector,++cant * sizeof(char *));
        vector[cant-1] = (char *) malloc(strlen(palabra+1)*sizeof(char));
        strcpy(vector[cant-1], palabra);
       // printf("%s\n", vector[cant-1]);
        fgets(palabra, 20, f);
        palabra[strlen(palabra)-1]='\0';
    }
    fclose(f);
    printf("Ingrese una palabra: ");
    scanf("%s", palabra);
    while(strcmp(palabra,"ZZZ")){
        i=0;
        while((i<cant)&&(strcmp(vector[i],palabra)!=0)){
            i++;
        }
        if((i<cant)&&(strcmp(vector[i],palabra)==0)){
            printf("La palabra si esta en la posicion %d\n", i);
        }
        else{
            printf("La palabra NO esta\n");
        }
        printf("Ingrese una palabra: ");
        scanf("%s", palabra);
    }

/*
    FILE *t;
    // Abrir el archivo
    t = fopen("numeros.txt", "w");
    if (t == NULL){
        printf ("\nError al abrir archivo texto\n");
        return 1;
    }
    FILE *b;
    // Abrir el archivo
    b = fopen("numeros.dat", "wb");
    if (b == NULL){
        printf ("\nError al abrir archivo binario\n");
        return 1;
    }
    int n, i;
    for (i=0; i<10; i++){
        printf("Ingrese un numero: ");
        scanf("%d", &n);
        n %= 10;
        fprintf(t, "%d\n", n);
        fwrite(&n, sizeof(n), 1, b);
    }
    fclose(t);
    fclose(b);
*/
/*
    FILE *f;
    // Abrir el archivo
    f = fopen("jugadoresBIN.dat", "ab+");
    if (f == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
    jugadorT j;
    char palabra[20];
    int i, n;
    float nf;
    for (i=0; i<3; i++){
        printf("Nombre: ");
        scanf("%s", palabra);
        strcpy(j.nombre, palabra);
        printf("Apellido: ");
        scanf("%s", palabra);
        strcpy(j.apellido, palabra);
        printf("Edad: ");
        scanf("%d", &n);
        j.edad = n;
        printf("Titulos: ");
        scanf("%d", &n);
        j.titulos = n;
        printf("Ranking: ");
        scanf("%d", &n);
        j.ranking = n;
        printf("Fortuna: ");
        scanf("%f", &nf);
        j.fortuna = nf;
        fwrite(&j, sizeof(j), 1, f);
    }
    fclose(f);


//    FILE *f;
    // Abrir el archivo
    f = fopen("jugadoresBIN.dat", "rb");
    if (f == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
//    jugadorT j;
    char nombreR[20], apellidoR[20], nombreT[20], apellidoT[20];
    int minRank = 30999999, maxTit = -30999999;
    fread(&j, sizeof(j), 1, f);
    while(!feof(f)){
        if(j.ranking<minRank){
            minRank = j.ranking;
            strcpy(nombreR, j.nombre);
            strcpy(apellidoR, j.apellido);
        }
        if(j.titulos>maxTit){
            maxTit = j.titulos;
            strcpy(nombreT, j.nombre);
            strcpy(apellidoT, j.apellido);
        }
        fread(&j, sizeof(j), 1, f);
    }
    printf("%s %s consiguio el %d puesto en el ranking.\n",
           apellidoR, nombreR, minRank);
    printf("%s %s tiene la mayor cantidad de titulos.(%d)\n",
           apellidoT, nombreT, maxTit);
*/
/*
    FILE *f;
    // Abrir el archivo
    f = fopen("jugadoresBIN.dat", "rb");
    if (f == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
    int bytes=0;
    fgetc(f);
    while(!feof(f)){
        bytes++;
        fgetc(f);
    }
    printf("%d BYTES", bytes);
*/
/*
    FILE *f;
    // Abrir el archivo
    f = fopen("vinos.csv", "r");
    if (f == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
    FILE *r;
    // Abrir el archivo
    r = fopen("reporte_vinos.txt", "w");
    if (r == NULL){
        printf ("\nError al abrir archivo fuente\n");
        return 1;
    }
    vinoT v, vProm={0}, vMin, vMax;
    int i, cant=0;
    char palabra[300];
    fprintf(r, "Atributo\t");
    fgets(palabra, 300, f);
    for(i=0; i<strlen(palabra); i++){
        if (palabra[i] == ';'){
            palabra[i] = '\t';
        }
    }
    palabra[strlen(palabra)-1] = '\0';
    fputs(palabra, r);

 //   fscanf(f, "%[^;];", palabra);
 //   printf("%s\n", palabra);
    fprintf(r, "\n");
    fscanf(f, "%f;%f;", &v.acidez_fija, &v.acidez_volatil);
    fscanf(f, "%f;%f;", &v.acido_citrico, &v.azucares);
    fscanf(f, "%f;%f;", &v.PH, &v.sulfatos);
    fscanf(f, "%f;%f;", &v.alcohol, &v.calidad);
    fscanf(f, "%s\n", v.tipo);
    vMax = v;
    vMin = v;
    while (!feof(f)){
        //SUMA PARA PROMEDIO
        cant++;
        vProm.acidez_fija += v.acidez_fija;
        vProm.acidez_volatil += v.acidez_volatil;
        vProm.acido_citrico += v.acido_citrico;
        vProm.alcohol += v.alcohol;
        vProm.azucares += v.azucares;
        vProm.calidad += v.calidad;
        vProm.PH += v.PH;
        vProm.sulfatos += v.sulfatos;
        //MINIMO
        if(v.acidez_fija < vMin.acidez_fija){
            vMin.acidez_fija = v.acidez_fija;
        }
        if(v.acidez_volatil < vMin.acidez_volatil){
            vMin.acidez_volatil = v.acidez_volatil;
        }
        if(v.acido_citrico < vMin.acido_citrico){
            vMin.acido_citrico = v.acido_citrico;
        }
        if(v.alcohol < vMin.alcohol){
            vMin.alcohol = v.alcohol;
        }
        if(v.azucares < vMin.azucares){
            vMin.azucares = v.azucares;
        }
        if(v.calidad < vMin.calidad){
            vMin.calidad = v.calidad;
        }
        if(v.PH < vMin.PH){
            vMin.PH = v.PH;
        }
        if(v.sulfatos < vMin.sulfatos){
            vMin.sulfatos = v.sulfatos;
        }
        //MAXIMO
        if(v.acidez_fija > vMax.acidez_fija){
            vMax.acidez_fija = v.acidez_fija;
        }
        if(v.acidez_volatil > vMax.acidez_volatil){
            vMax.acidez_volatil = v.acidez_volatil;
        }
        if(v.acido_citrico > vMax.acido_citrico){
            vMax.acido_citrico = v.acido_citrico;
        }
        if(v.alcohol > vMax.alcohol){
            vMax.alcohol = v.alcohol;
        }
        if(v.azucares > vMax.azucares){
            vMax.azucares = v.azucares;
        }
        if(v.calidad > vMax.calidad){
            vMax.calidad = v.calidad;
        }
        if(v.PH > vMax.PH){
            vMax.PH = v.PH;
        }
        if(v.sulfatos > vMax.sulfatos){
            vMax.sulfatos = v.sulfatos;
        }
        //SCANEO UN NUEVO VINO
        fscanf(f, "%f;%f;", &v.acidez_fija, &v.acidez_volatil);
        fscanf(f, "%f;%f;", &v.acido_citrico, &v.azucares);
        fscanf(f, "%f;%f;", &v.PH, &v.sulfatos);
        fscanf(f, "%f;%f;", &v.alcohol, &v.calidad);
        fscanf(f, "%s\n", v.tipo);
    }
    //PROMEDIO FINAL
    vProm.acidez_fija /= cant;
    vProm.acidez_volatil /= cant;
    vProm.acido_citrico /= cant;
    vProm.alcohol /= cant;
    vProm.azucares /= cant;
    vProm.calidad /= cant;
    vProm.PH /= cant;
    vProm.sulfatos /= cant;

    fprintf(r, "Promedio\t%.2f\t\t%.2f\t\t", vProm.acidez_fija, vProm.acidez_volatil);
    fprintf(r, "%.2f\t\t%.2f\t\t\t", vProm.acido_citrico, vProm.azucares);
    fprintf(r, "%.2f\t%.2f\t\t", vProm.PH, vProm.sulfatos);
    fprintf(r, "%.2f\t%.2f\n", vProm.alcohol, vProm.calidad);

    fprintf(r, "Minimo\t\t%.2f\t\t%.2f\t\t", vMin.acidez_fija, vMin.acidez_volatil);
    fprintf(r, "%.2f\t\t%.2f\t\t\t", vMin.acido_citrico, vMin.azucares);
    fprintf(r, "%.2f\t%.2f\t\t", vMin.PH, vMin.sulfatos);
    fprintf(r, "%.2f\t%.2f\n", vMin.alcohol, vMin.calidad);

    fprintf(r, "Maximo\t\t%.2f\t\t%.2f\t\t", vMax.acidez_fija, vMax.acidez_volatil);
    fprintf(r, "%.2f\t\t%.2f\t\t\t", vMax.acido_citrico, vMax.azucares);
    fprintf(r, "%.2f\t%.2f\t\t", vMax.PH, vMax.sulfatos);
    fprintf(r, "%.2f\t%.2f\n", vMax.alcohol, vMax.calidad);

    fclose(f);
    fclose(r);
*/

    listaE * l = NULL;
    if(cargarListaIndice(&l)){
        printf("ERROR CARGAR LISTA");
        return 1;
    }
    if (crearIndice(l)){
        printf("ERROR CREAR INDICE");
        return 1;
    }
    freeLE(&l);

/*
    FILE * p;
    p = fopen("personas.csv", "r");
    if(p == NULL){
        printf("ERROR");
        return 1;
    }
    Indice ind;
    ind = cargarIndice();
    if (ind.ind == NULL){
        printf("ERROR AL CARGAR INDICE");
        return 1;
    }
    personaT per;
    int n;
    printf("Ingrese un numero: ");
    scanf("%d", &n);
    if (buscar(p, ind, n, &per)){
        printf("ID: %d\n", per.id);
        printf("DNI: %d\n", per.dni);
        printf("Apellido: %s\n", per.apellido);
        printf("Nombre: %s\n", per.nombre);
        printf("Trabajo: %s\n", per.trabajo);
        printf("Correo: %s\n", per.correo);
        printf("Ciudad: %s\n", per.ciudad);
        printf("Pais: %s\n", per.pais);
    }
    else{
        printf("Esa persona NO esta.");
    }
/*
    FILE * iF;
    iF = fopen("personas.csv", "r");
    if(iF == NULL){
        printf("ERROR");
        return 1;
    }
    if (buscar2(p, iF, n, &per)){
        printf("ID: %d\n", per.id);
        printf("DNI: %d\n", per.dni);
        printf("Apellido: %s\n", per.apellido);
        printf("Nombre: %s\n", per.nombre);
        printf("Trabajo: %s\n", per.trabajo);
        printf("Correo: %s\n", per.correo);
        printf("Ciudad: %s\n", per.ciudad);
        printf("Pais: %s\n", per.pais);
    }
    else{
        printf("Esa persona NO esta.");
    }
*/
/*
    FILE * f;
    f = fopen("personas.idx", "rb");
    if(f==NULL){
        printf("ERROR");
        return 1;
    }
    int dni, pos;
    fread(&dni, sizeof(int), 1, f);
    while(!feof(f)){
        fread(&pos, sizeof(int), 1, f);
        printf("%d en la posicion %d\n", dni, pos);
        fread(&dni, sizeof(int), 1, f);
    }
    fclose(f);
*/

    return 0;
}

int buscar(FILE* personas, Indice indice, int dni, personaT * persona){
    int pos = encontrarDNI(indice, dni, 0, indice.tam-1);
    if (pos == -1){
        return 0;
    }
    fseek(personas, pos, SEEK_SET);
    fread(persona, sizeof(personaT), 1, personas);
    return 1;
}

int encontrarDNI(Indice indice, int dni, int ini, int fin){
    indiceT i = indice.ind[(fin-ini)/2+ini];
    int dezp = -1;
    if (i.dni == dni){
        return i.dezp;
    }
    else{
        if(dni < i.dni){
            dezp = encontrarDNI(indice, dni, ini, ((fin-ini)/2)+ini);
        }
        if(dni > i.dni){
            dezp = encontrarDNI(indice, dni, ((fin-ini)/2)+ini+1, fin);
        }
    }
    return dezp;
}

int buscar2(FILE* personas, FILE* indice, int dni, personaT * persona){
    return 0;
}

Indice cargarIndice(){
    Indice nuevo;
    nuevo.tam = 0;
    nuevo.ind = NULL;
    FILE * f;
    f = fopen("personas.idx", "rb");
    if(f==NULL){
        printf("ERROR");
        return nuevo;
    }
    indiceT temp;
    fread(&(temp.dni), sizeof(int), 1, f);
    while(!feof(f)){
        fread(&(temp.dezp), sizeof(int), 1, f);
        nuevo.ind = (indiceT *) realloc(nuevo.ind, ++nuevo.tam * sizeof(indiceT));
        fread(&(temp.dni), sizeof(int), 1, f);
    }
    fclose(f);
    return nuevo;
}

int crearIndice(listaE * l){
    FILE * p;
    p = fopen("personas.idx", "w");
    if(p == NULL){
        printf("ERROR");
        return 1;
    }
    while(l!=NULL){
        fwrite(&(l->dato), sizeof(int), 1, p);
        fwrite(&(l->dezp), sizeof(int), 1, p);
        l = l->sig;
    }
    fclose(p);
    return 0;
}

int cargarListaIndice(listaE ** l){
    FILE * p;
    p = fopen("personas.csv", "r");
    if(p == NULL){
        printf("ERROR");
        return 1;
    }
    int d=0;
    char c, palabra[300];
    indiceT temp;
    fgets(palabra, 300, p);
    c = fgetc(p);
    while(!feof(p)){
        while(c != ';'){
            d++;
            c = fgetc(p);
        }
        temp.dezp = d;
        temp.dni = 0;
        d++;
        c = fgetc(p);
        while(c != ';'){
            c -= '0';
            temp.dni = temp.dni*10 + c;
            d++;
            c = fgetc(p);
        }
        while(c != '\n'){
            d++;
            c = fgetc(p);
        }
        d++;
        agregarAscendenteLE(l, temp);
        c = fgetc(p);
    }
    fclose(p);
    return 0;
}

void reservarNodoLE(listaE ** ptrL){
    *ptrL = (listaE *)calloc(1, sizeof(**ptrL));
}
listaE * newNodoLE(){
    return (listaE *)calloc(1, sizeof(listaE *));
}
void agregarAscendenteLE(listaE ** ptrL, indiceT dato){
    listaE * nuevo = NULL;
    reservarNodoLE(&nuevo);
    nuevo->dato = dato.dni;
    nuevo->dezp = dato.dezp;
    nuevo->sig = NULL;
    if (*ptrL == NULL){
        *ptrL = nuevo;
    }
    else{
        if ((*ptrL)->dato > dato.dni){
            nuevo->sig = *ptrL;
            *ptrL = nuevo;
        }
        else{
            listaE * aux = *ptrL;
            while((aux->sig!=NULL)&&(aux->sig->dato < dato.dni)){
                aux = aux->sig;
            }
            nuevo->sig = aux->sig;
            aux->sig = nuevo;
        }
    }
}

void eliminarInicioLE(listaE ** ptrL){
    if (*ptrL!=NULL){
        listaE * aux = (*ptrL)->sig;
        free(*ptrL);
        *ptrL = aux;
    }
}
void vaciarLE(listaE ** ptrL){
    while (*ptrL!=NULL){
        eliminarInicioLE(ptrL);
    }
}
void freeLE(listaE ** ptrL){
    vaciarLE(ptrL);
    free(*ptrL);
}

void freeMC(char ** mat, int fil){
    int i=0;
    for(i=0; i<fil; i++){
        free(mat[i]);
    }
    free(mat);
}

/*
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LONG 300
int main(){
 FILE *f;
 char linea[LONG];
 // Abrir el archivo
 f = fopen("prueba.txt", "r");
 if (f == NULL){
    printf ("\nError al abrir archivo fuente\n");
    return 1;
 }
 // leer una linea del archivo
 fgets(linea,LONG,f);
 linea[strlen(linea)-1] = '\0';
 while (!feof(f)){
    // imprimir la linea en la pantalla
    puts(linea);
    // leer una linea del archivo
    fgets(linea,LONG,f);
    linea[strlen(linea)-1] = '\0';
 }
 fclose(f);
 return 0;
}
*/
