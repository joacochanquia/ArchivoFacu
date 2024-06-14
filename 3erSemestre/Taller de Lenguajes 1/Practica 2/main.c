#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#define CANT_ARREGLO 5
#define CANT_FIL 3
#define CANT_COL 3
#define ANIOS 10

void cargar (int a[], int cant);
void imprimir (const int a[], int cant);
float promedio (const float a[], int cant);
float min (const float a[], int cant);
float max (const float a[], int cant);
int posMin (const float a[], int cant);
int posMax (const float a[], int cant);
void cargarM (int m[][CANT_COL], int fil, int col);
void imprimirM (const int m[][CANT_COL], int fil, int col);
void multiplicarM (int m[][CANT_COL], int fil, int col, int n);
void imprimirTranspuesta (const int m[][CANT_COL], int fil, int col);
void sumarM (const int A[][CANT_COL],const int B[][CANT_COL],int C[][CANT_COL], int fil, int col);
void digitos(int n);
void cargar3D (int m[][CANT_FIL][CANT_COL], int cant, int fil, int col);
void imprimir3D (const int m[][CANT_FIL][CANT_COL], int cant, int fil, int col);
void menorMes (const int m[][CANT_FIL][CANT_COL], int cant, int fil, int col);
void menorAnio (const int m[][CANT_FIL][CANT_COL], int cant, int fil, int col);
//2-2
void promMinYPosMax (const float a[], int cant, float * promedio, float * min, int * posMax);
void swap (int * ptra, int * ptrb);
void invertir (int a[], int cant);
//2-3
void swapLetras(char p[], char c1, char c2);
int stringLenght(char p[]);
char * stringCopy(char c[],char p[]);
void cantidadLetras(char p[]);
int palindroma(char p[]);
//2-Adicional
void ordenar (int a[], int cant);
void upperStr(char p[]);
void lowerStr(char p[]);
void numToStr(int n, char p[]);
void invertirString(char p[]);
void swapChar (char * ptra, char * ptrb);
char * numToText(int n, char p[]);

int main()
{
   /* int a[CANT_ARREGLO];
    int i, n = 0;
    cargar (a, CANT_ARREGLO);
    for (i=0; i<CANT_ARREGLO; i++){
        if ((i%2)==1){
            if ((a[i]%2)==0){
                n++;
            }
        }
    }
    printf("Hay %d numeros pares en posiciones impares\n", n);
    for (i=0; i<CANT_ARREGLO; i++){
        if ((i%2)==0){
            if ((a[i]%2)==1){
                n++;
            }
        }
    }
    printf("Hay %d numeros impares en posiciones pares\n", n); */

   /* float a[CANT_ARREGLO];
    cargar (a, CANT_ARREGLO);
    imprimir (a, CANT_ARREGLO);
    printf("El promedio es %.2f\n", promedio(a, CANT_ARREGLO));
    printf("El minimo es %.2f\n", min(a, CANT_ARREGLO));
    printf("La posicion del maximo es %d\n", posMax(a, CANT_ARREGLO));
    */

   /* int m[CANT_FIL][CANT_COL];
    cargarM (m, CANT_FIL, CANT_COL);
    imprimirM (m, CANT_FIL, CANT_COL);
    printf("\n");
    multiplicarM (m, CANT_FIL, CANT_COL, 10);
    imprimirM (m, CANT_FIL, CANT_COL);
    printf("\n");
    imprimirTranspuesta (m, CANT_FIL, CANT_COL);
    printf("\n"); */

   /* int A[CANT_FIL][CANT_COL], B[CANT_FIL][CANT_COL], C[CANT_FIL][CANT_COL];
    srand(time(NULL));
    cargarM (A, CANT_FIL, CANT_COL);
    imprimirM (A, CANT_FIL, CANT_COL);
    printf("\n");
    cargarM (B, CANT_FIL, CANT_COL);
    imprimirM (B, CANT_FIL, CANT_COL);
    printf("\n");
    sumarM (A, B, C, CANT_FIL, CANT_COL);
    imprimirM (C, CANT_FIL, CANT_COL);
    printf("\n");*/

   /* int n;
    scanf("%d", &n);
    digitos(n); */

    /*int a [ANIOS][CANT_FIL][CANT_COL];
    cargar3D (a, ANIOS, CANT_FIL, CANT_COL);
    imprimir3D (a, ANIOS, CANT_FIL, CANT_COL);

    menorMes(a, ANIOS, CANT_FIL, CANT_COL);
    menorAnio(a, ANIOS, CANT_FIL, CANT_COL); */

//  2-2

   /* float a[CANT_ARREGLO];
    float promedio, min;
    int posMax;
    cargar (a, CANT_ARREGLO);
    imprimir (a, CANT_ARREGLO);
    promMinYPosMax (a, CANT_ARREGLO, &promedio, &min, &posMax);
    printf("El promedio es %.2f\n", promedio);
    printf("El minimo es %.2f\n", min);
    printf("La posicion del maximo es %d\n", posMax); */
                    //a  b  c  p1  p2
   /* int a = 1;    //1 ### ### ### ###
    int b = 2;      //1 2 ### ### ###
    int c = 4;      //1 2 4 ### ###
    int * p1, * p2; //1 2 4 ### ###
    p1 = &a;        //1 2 4 &a ###
    p2 = &c;        //1 2 4 &a &c
    *p1 = (*p2)++;  //4 2 5 &a &c
    p2 = &b;        //4 2 5 &a &b
    *p1 += *p2;     //6 2 5 &a &b
    p1 = p2;        //6 2 5 &b &b
    ++*p1;          //6 3 5 &b &b
    p1 = &a;        //6 3 5 &a &b
    *p2*=*p1;       //6 18 5 &a &b
    c = *p2+*p1;    //6 18 24 &a &b
    a = *p1 = ++*p2;//19 19 24 &a &b */

   /* int x[5]={1,2,3,4,5};
    int * p = x;
    printf("La direccion memoria de p es %p \n", &p);
    printf("La direccion la que apunta p es %p \n", p);
    printf("El valor al que apunta p es %d \n", *p);
    p++;
    printf("La direccion memoria de p ahora es %p \n", &p);
    printf("La direccion la que apunta p ahora es %p \n", p);
    printf("El valor al que apunta p ahora es %d \n", *p); */

   /* int vector[10]={10,20,30,40,50,60,70,80,90,100};
    int i;
    int *p= vector;
    for (i=0; i<10; i++){
    *p += 3;
    printf("vector[%d] = %d \n", i, *p);
    p+=2;
    }*/

   /* int a[CANT_ARREGLO];
    cargar (a, CANT_ARREGLO);
    imprimir (a, CANT_ARREGLO);
    invertir (a, CANT_ARREGLO);
    printf("\n");
    imprimir (a, CANT_ARREGLO);*/

//  2-3

   /* char p[50];
    int c=0;
    scanf("%s",p);
    while (strcmp(p,"ZZZ")){
        if (strlen(p)==5){
            c++;
        }
        scanf("%s",p);
    }
    printf("Hay %d palabras con cinco letras", c);*/

   /* char p[50];
    int c=0;
    scanf("%s",p);
    while (strcmp(p,"XXX")){
        if (p[strlen(p)-1]=='o'){
            c++;
        }
        scanf("%s",p);
    }
    printf("%d palabras terminan con o", c);*/

   /* char p[50];
    scanf("%s",p);
    swapLetras(p, 'a', 'e');
    printf("%s\n", p); */

   /* char p[50];
    scanf("%s",p);
    printf("%d\n", stringLenght(p)); */

   /* char p[50], copia[50];
    scanf("%s",p);
    stringCopy(copia, p);
    printf("%s\n", copia); */

   /* char p[50], copia[50];
    scanf("%s",p);
    stringCopy(copia, p);
    cantidadLetras(p);*/

   /* char p[50];
    scanf("%s",p);
    printf("%d\n", palindroma(p));*/

//  2-Adiçional

    int a[CANT_ARREGLO];
    cargar (a, CANT_ARREGLO);
    imprimir (a, CANT_ARREGLO);
    ordenar (a, CANT_ARREGLO);
    printf("\n");
    imprimir (a, CANT_ARREGLO);

    char p[50];
    scanf("%s",p);
    upperStr(p);
    printf("%s\n", p);
    lowerStr(p);
    printf("%s\n", p);

    char p[50];
    numToStr(1234,p);
    printf("%s\n", p);

    char p[50];
    int n;
    scanf("%d",&n);
    printf("%s\n", numToText(n,p));

    return 0;
}

void cargar (int a[], int cant){
    int i;
    srand(time(NULL));
    for (i=0; i<cant; i++) a[i] = rand(); //0.9489516;
}

void imprimir (const int a[], int cant){
    int i;
    for (i=0; i<cant; i++)
        printf("%d ----> %d\n", i, a[i]);
}

float promedio (const float a[], int cant){
    int i, s=0;
    for (i=0; i<cant; i++){
        s = s + a[i];
    }
    return ((float)s/cant);
}

float min (const float a[], int cant){
    int i;
    float min = 30999999;
    for (i=0; i<cant; i++){
        if (a[i]<min) min = a[i];
    }
    return min;
}

float max (const float a[], int cant){
    int i;
    float max = -30999999;
    for (i=0; i<cant; i++){
        if (a[i]>max) max = a[i];
    }
    return max;
}

int posMin (const float a[], int cant){
    int i, posMin;
    float min = 30999999;
    for (i=0; i<cant; i++){
        if (a[i]<min) {
            min = a[i];
            posMin = i;
            }
    }
    return posMin;
}

int posMax (const float a[], int cant){
    int i, posMax;
    float max = -30999999;
    for (i=0; i<cant; i++){
        if (a[i]>max) {
            max = a[i];
            posMax = i;
            }
    }
    return posMax;
}

void cargarM (int m[][CANT_COL], int fil, int col){
    int i, j;
    srand(time(NULL));
    for (i=0; i<fil; i++) {
        for (j=0; j<col; j++) m[i][j] = rand();
    }
}

void imprimirM (const int m[][CANT_COL], int fil, int col){
    int i, j;
    for (i=0; i<fil; i++) {
        for (j=0; j<col; j++) printf("%d   ", m[i][j]);
        printf("\n");
    }
}

void multiplicarM (int m[][CANT_COL], int fil, int col, int n){
    int i, j;
    for (i=0; i<fil; i++) {
        for (j=0; j<col; j++) m[i][j] *= n;
    }
}

void imprimirTranspuesta (const int m[][CANT_COL], int fil, int col){
    int i, j;
    for (i=0; i<fil; i++) {
        for (j=0; j<col; j++) printf("%d   ", m[j][i]);
        printf("\n");
    }
}

void sumarM (const int A[][CANT_COL],const int B[][CANT_COL],int C[][CANT_COL], int fil, int col){
    int i, j;
    for (i=0; i<fil; i++) {
        for (j=0; j<col; j++) C[i][j] = A[i][j] + B[i][j] ;
    }
}

void digitos(int n){
    int d,c0=0,c1=0,c2=0,c3=0,c4=0,c5=0,c6=0,c7=0,c8=0,c9=0;
    do
    {
        d = n%10;
        switch (d) {
        case 0: c0++;break;
        case 1: c1++;break;
        case 2: c2++;break;
        case 3: c3++;break;
        case 4: c4++;break;
        case 5: c5++;break;
        case 6: c6++;break;
        case 7: c7++;break;
        case 8: c8++;break;
        case 9: c9++;break;
        default : printf("El operador ingresado no es valido\n");break;
        }
        n/=10;
    }
    while (n!=0);
    printf("El 0 aparece %d veces\n", c0);
    printf("El 1 aparece %d veces\n", c1);
    printf("El 2 aparece %d veces\n", c2);
    printf("El 3 aparece %d veces\n", c3);
    printf("El 4 aparece %d veces\n", c4);
    printf("El 5 aparece %d veces\n", c5);
    printf("El 6 aparece %d veces\n", c6);
    printf("El 7 aparece %d veces\n", c7);
    printf("El 8 aparece %d veces\n", c8);
    printf("El 9 aparece %d veces\n", c9);
}

void cargar3D (int m[][CANT_FIL][CANT_COL], int cant, int fil, int col){
    int i, j, k;
    srand(time(NULL));
    for (k=0; k<cant; k++){
        for (i=0; i<fil; i++) {
            for (j=0; j<col; j++) m[k][i][j] = rand()%100;
        }
    }
}
void imprimir3D (const int m[][CANT_FIL][CANT_COL], int cant, int fil, int col){
    int i, j, k;
    for (k=0; k<cant; k++){
        for (i=0; i<fil; i++) {
            for (j=0; j<col; j++) printf("%d   ", m[k][i][j]);
            printf("\n");
        }
        printf("\n\n");
    }
}


void menorMes (const int m[][CANT_FIL][CANT_COL], int cant, int fil, int col){
    int i, j, k, suma, minMes, min;
    for (k=0; k<cant; k++){
        min=30999999;
        for (i=0; i<fil; i++) {
            suma = 0;
            for (j=0; j<col; j++) suma += m[k][i][j];
            if (suma < min) {
                min = suma;
                minMes = i;
            }
        }
        printf("\n");
        printf("El mes en el que menos llovio en el año %d fue el %d\n", k, minMes);
    }
}
void menorAnio (const int m[][CANT_FIL][CANT_COL], int cant, int fil, int col){
    int i, j, k, suma, minAnio;
    float min=30999999.99, promedio;
    for (k=0; k<cant; k++){
        suma=0;
        for (i=0; i<fil; i++) {
            for (j=0; j<col; j++) suma += m[k][i][j];
        }
        promedio = (float)suma/(CANT_FIL*CANT_COL);
        printf("promedio del año %d = %.2f\n", k, promedio);
        if (promedio < min) {
            min = promedio;
            minAnio = k;
        }
    }
    printf("El año %d tuvo el menor promedio de lluvias", minAnio);
}

// 2-2

void promMinYPosMax (const float a[], int cant, float * promedio, float * min, int * posMax){
    int i, s=0;
    float max = -30999999;
    *min = 30999999;
    for (i=0; i<cant; i++){
        s = s + a[i]; //suma para el promedio
        if (a[i]<*min) *min = a[i]; //minimo
        if (a[i]>max) {  // posicion del max
            max = a[i];
            *posMax = i;
            }
    }
    *promedio = ((float)s/cant);
}

void swap(int *ptra, int *ptrb) {
    int tmp;
    tmp = *ptra; // guarda el valor de a
    *ptra = *ptrb;   // almacena b en a
    *ptrb = tmp; // almacena a en b
    }

void invertir(int a[], int cant){
    int i;
    for (i=0; i<cant; i++, cant--) swap(&a[i], &a[cant-1]);

}

// 2-3

void swapLetras(char p[], char c1, char c2){
    int i;
    for (i=0; i<strlen(p); i++){
        if (p[i] == c1){
            p[i] = c2;
        }
    }
}

int stringLenght(char p[]){
    int c=0, i=0;
    while (p[i]!='\0'){
        c++;
        i++;
    }
    return c;
}

char * stringCopy(char c[], char p[]){
    int i=0;
    while (p[i]!='\0'){
        c[i] = p[i];
        i++;
    }
    c[i] = '\0';
    return c;
}

void cantidadLetras(char p[]){
    int i,c[26]={0};
    for (i=0; i<strlen(p); i++){
        switch (p[i]) {
        case 'a': c[0]++;break;
        case 'b': c[1]++;break;
        case 'c': c[2]++;break;
        case 'd': c[3]++;break;
        case 'e': c[4]++;break;
        case 'f': c[5]++;break;
        case 'g': c[6]++;break;
        case 'h': c[7]++;break;
        case 'i': c[8]++;break;
        case 'j': c[9]++;break;
        case 'k': c[10]++;break;
        case 'l': c[11]++;break;
        case 'm': c[12]++;break;
        case 'n': c[13]++;break;
        case 'o': c[14]++;break;
        case 'p': c[15]++;break;
        case 'q': c[16]++;break;
        case 'r': c[17]++;break;
        case 's': c[18]++;break;
        case 't': c[19]++;break;
        case 'u': c[20]++;break;
        case 'v': c[21]++;break;
        case 'w': c[22]++;break;
        case 'x': c[23]++;break;
        case 'y': c[24]++;break;
        case 'z': c[25]++;break;
        default : printf("El caracter ingresado no es valido\n");break;
        }
    }
    printf("El a aparece %d veces\n", c[0]);
    printf("El b aparece %d veces\n", c[1]);
    printf("El c aparece %d veces\n", c[2]);
    printf("El d aparece %d veces\n", c[3]);
    printf("El e aparece %d veces\n", c[4]);
    printf("El f aparece %d veces\n", c[5]);
    printf("El g aparece %d veces\n", c[6]);
    printf("El h aparece %d veces\n", c[7]);
    printf("El i aparece %d veces\n", c[8]);
    printf("El j aparece %d veces\n", c[9]);
    printf("El k aparece %d veces\n", c[10]);
    printf("El l aparece %d veces\n", c[11]);
    printf("El m aparece %d veces\n", c[12]);
    printf("El n aparece %d veces\n", c[13]);
    printf("El o aparece %d veces\n", c[14]);
    printf("El p aparece %d veces\n", c[15]);
    printf("El q aparece %d veces\n", c[16]);
    printf("El r aparece %d veces\n", c[17]);
    printf("El s aparece %d veces\n", c[18]);
    printf("El t aparece %d veces\n", c[19]);
    printf("El u aparece %d veces\n", c[20]);
    printf("El v aparece %d veces\n", c[21]);
    printf("El w aparece %d veces\n", c[22]);
    printf("El x aparece %d veces\n", c[23]);
    printf("El y aparece %d veces\n", c[24]);
    printf("El z aparece %d veces\n", c[25]);
}

int palindroma(char p[]){
    int i=0, cant = strlen(p), f=1;
    while ((i<cant)&&(f==1)){
        if (p[i]!=p[cant-1]) f=0;
        i++;
        cant--;
    }
    return f;
}

void ordenar(int a[], int cant){
    int i, j, *ptroMax, max;
    for(i=0; i<cant; cant--){
        ptroMax = &a[i];
        max=a[i];
        for(j=(i+1); j<cant; j++){
            if(a[j]>max){
                max=a[j];
                ptroMax=&a[j];
            }
        }
        swap(ptroMax, &a[cant-1]);
    }
}
void upperStr(char p[]){
    int i=0;
    while (p[i]!='\0'){
        p[i]=p[i] & 95;//1011111
        i++;
    }
}

void lowerStr(char p[]){
    int i=0;
    while (p[i]!='\0'){
        p[i]= p[i] | 32;//0100000
        i++;
    }
}

void numToStr(int n, char p[]){
    int i=0, d;
    while (n!=0){
        d = n%10;
        switch (d) {
        case 0: p[i]='0';break;
        case 1: p[i]='1';break;
        case 2: p[i]='2';break;
        case 3: p[i]='3';break;
        case 4: p[i]='4';break;
        case 5: p[i]='5';break;
        case 6: p[i]='6';break;
        case 7: p[i]='7';break;
        case 8: p[i]='8';break;
        case 9: p[i]='9';break;
        default : printf("El operador ingresado no es valido\n");break;
        }
        n/=10;
        i++;
    }
    p[i]='\0';
    invertirString(p);
}

    void invertirString(char p[]){
    int i, fin=strlen(p);
    for (i=0; i<fin; i++, fin--) swapChar(&p[i], &p[fin-1]);

}


void swapChar(char *ptra, char *ptrb) {
    char tmp;
    tmp = *ptra; // guarda el valor de a
    *ptra = *ptrb;   // almacena b en a
    *ptrb = tmp; // almacena a en b
}

char * numToText(int n, char p[]){
    int i=0, d;
    if (n==0){
        p = "cero";
    }
    else{
        if ((n>=10)&&(n<20)){
            switch (n) {
            case 10: p="diez";break;
            case 11: p="once";break;
            case 12: p="doce";break;
            case 13: p="trece";break;
            case 14: p="catorce";break;
            case 15: p="quince";break;
            case 16: p="dieciseis";break;
            case 17: p="dieciosiete";break;
            case 18: p="dieciocho";break;
            case 19: p="diecinueve";break;
            default : printf("El operador ingresado no es valido\n");break;
            }
            n/=10;
            i++;
        }
        else{
            d=n%10;
            switch (d) {
            case 0: ;break;
            case 1: p="uno";break;
            case 2: p="dos";break;
            case 3: p="tres";break;
            case 4: p="cuatro";break;
            case 5: p="cinco";break;
            case 6: p="seis";break;
            case 7: p="siete";break;
            case 8: p="ocho";break;
            case 9: p="nueve";break;
            default : printf("El operador ingresado no es valido\n");break;
            }
            d=n/10;
            switch (d) {
            case 2: p=strcat("veinti",p);break;
            case 3: p=strcat("treinta y ",p);break;
            case 4: p=strcat("cuarenta y ",p);break;
            case 5: p=strcat("cincuenta y ",p);break;
            case 6: p=strcat("sesenta y ",p);break;
            case 7: p=strcat("setenta y ",p);break;
            case 8: p=strcat("ochenta y ",p);break;
            case 9: p=strcat("noventa y ",p);break;
            default : printf("El operador ingresado no es valido\n");break;
            }
        }
    }
    return p;
}
