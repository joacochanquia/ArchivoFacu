#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#define CANT 3
#define TAM_MAZO 40
#define PALO1 "espada"
#define PALO2 "basto"
#define PALO3 "oro"
#define PALO4 "copa"
#define TIPO unsigned

typedef enum { IZQUIERDA, CENTRO_H, DERECHA } AlineacionHorizontal;
typedef enum { ARRIBA=1, CENTRO_V, ABAJO } AlineacionVertical;
typedef enum { DOS=2, CERO=0, UNO, MENOS_UNO=-1, OTRO } Numeros;
//typedef enum { LET_A = "A", LET_B, LET_Z = "Z" } Letras;
typedef enum { LETRA_A = 'A', LETRA_B, LETRA_Z = 'Z' } Letras2;

typedef enum { DOM, LUN, MAR, MIE, JUE, VIE, SAB } semanaE;

typedef enum { BLUETOOTH=128, WIFI=64, GPS=32, DATOS=16, FRONTAL=8, TRASERA=4, LINTERNA=2, VIBRAR=1 } byteE;
unsigned const TODOS=255;
unsigned const NINGUNO=0;

struct rectangulo{
    float base;
    float altura;
};

typedef struct {
    char calle[50];
    char ciudad[30];
    int codigo_postal;
    char pais[40];
} direccionT;
typedef struct{
    char apellido[50];
    char nombre[50];
    char legajo[8];
    float promedio;
    direccionT domicilio;
}alumnoT;

typedef struct pun3D{
    float x;
    float y;
    float z;
}punto3D;

typedef struct {
    char palo[7];
    int numero;
}cartaT;


typedef struct {
    float x;
    float y;
} punto2D;
typedef struct {
    float base;
    float altura;
} formaT;
typedef struct {
    float x;
    float y;
    float base;
    float altura;
} rectanguloT;
typedef union {
    float x;
    float y;
    float base;
    float altura;

    formaT form;
    punto2D pos;

    rectanguloT rect;
} ventana;

typedef struct {
    unsigned dia : 8;
    unsigned mes : 8;
    unsigned anio : 16;
} fechaT;
typedef union{
    fechaT f;
    int i;
} fechaU;

typedef union {
    int DNI;
    char pasaporte[20];
} IDT;
typedef struct{
    char apellido[50];
    char nombre[50];
    char legajo[8];
    IDT ID;
}estudianteT;

typedef struct {
    unsigned seg : 5;
    unsigned min : 6;
    unsigned hora : 5;
} horaT;

typedef struct {
    unsigned red : 8;
    unsigned green : 8;
    unsigned blue : 8;
} RGB24;
typedef struct {
    unsigned red : 5;
    unsigned green : 6;
    unsigned blue : 5;
} RGB16;

typedef struct {
    unsigned Vibrar : 1;
    unsigned Linterna : 1;
    unsigned Trasera : 1;
    unsigned Frontal : 1;
    unsigned Datos : 1;
    unsigned Gps : 1;
    unsigned Wifi : 1;
    unsigned Bluetooth : 1;
} byteS;
typedef union {
    byteS s;
    unsigned u;
}byteU;

void verBits(TIPO valor);

void iniciarRectangulo(struct rectangulo * r);
float areaRectangulo(struct rectangulo r);

void iniciarDireccion(direccionT * d);
void iniciarAlumno(alumnoT * a);

void iniciarCarta(cartaT * c, char palo[], int numero);
void iniciarMazo(cartaT mazo[], int cant, char palo1[], char palo2[], char palo3[], char palo4[]);
void iniciarMazoTruco(cartaT mazo[]);
void swapCarta(cartaT *ptra, cartaT *ptrb);
void barajar(cartaT mazo[], int cant);
cartaT sacarCarta(cartaT mazo[], int cant);
void imprimirCarta(cartaT carta);

int antes(int f1, int f2);

void iniciarEstudiante(estudianteT * e);

char * queDia(semanaE d);
void imprimirDia(semanaE d);

void activarMod(unsigned * byte, unsigned modulo);
void desactivarMod(unsigned * byte, unsigned modulo);
void invertirMod(unsigned * byte, unsigned modulo);
int determinarMod(unsigned byte, unsigned modulo);

void leerHora(horaT * h);
void imprimirHora(horaT h);

RGB16 RGB24a16(RGB24 a);
RGB24 RGB16a24(RGB16 a);

void activarBit(byteS * byte, unsigned modulo);
void desactivarBit(byteS * byte, unsigned modulo);
void invertirBit(byteS * byte, unsigned modulo);
int determinarBit(byteS byte, unsigned modulo);

int main()
{
   /* struct rectangulo r;
    iniciarRectangulo(r);
    struct rectangulo a[CANT];
    int i, min=30999999, numMin;
    for (i=0; i<CANT; i++){
        iniciarRectangulo(&a[i]);
    }
    for (i=0; i<CANT; i++){
        if (areaRectangulo(a[i])<min){
            min = areaRectangulo(a[i]);
            numMin = i;
        }
    }
    printf("%d", numMin);*/

   /* alumnoT min;
    min.promedio = -30999999;
    alumnoT a[CANT];
    int i;
    for (i=0; i<CANT; i++){
        iniciarAlumno(&a[0]);
        printf("\n");
    }
    for (i=0; i<CANT; i++){
        if (a[i].promedio>min.promedio){
            min = a[i];
        }
    }
    min=a[0];
    printf("%s %s tiene el mejor promedio: %.2f", min.nombre, min.apellido, min.promedio);
    printf("%s es su legajo", min.legajo);
    printf("%s es su calle", min.domicilio.calle);
    puts(min.domicilio.ciudad); printf("es su ciudad.");*/

   /* printf("%d\n",sizeof(punto3D));
    printf("%d\n",sizeof(struct pun3D));
    printf("%d\n",sizeof(struct pun3D[4]));*/

   /* cartaT mazo[TAM_MAZO];
    iniciarMazoTruco(mazo);
    srand(time(NULL));
    barajar(mazo, TAM_MAZO);
    cartaT carta;
    TIPO i;
    scanf("%d", &i);
    while(i!=0){
        carta=sacarCarta(mazo, TAM_MAZO);
        imprimirCarta(carta);
        verBits(i);
        scanf("%d", &i);
    }*/

   /* fechaU hack, hack2;
    hack.f.dia = 1;
    hack.f.mes = 1;
    hack.f.anio = 1;
    hack2.f.dia = 31;
    hack2.f.mes = 7;
    hack2.f.anio = 2047;

    verBits(hack.i);
    verBits(hack2.i);
    printf("%d\n", antes(hack.i, hack2.i));*/

   /* estudianteT e[CANT];
    int i;
    for (i=0; i<CANT; i++){
        iniciarEstudiante(&e[i]);
        printf("\n");
    }*/

   /* printf("%s\n", queDia(DOM));
    printf("%s\n", queDia(LUN));
    printf("%s\n", queDia(MAR));
    printf("%s\n", queDia(MIE));
    printf("%s\n", queDia(JUE));
    printf("%s\n", queDia(VIE));
    printf("%s\n", queDia(SAB));
    printf("%s\n", queDia(5));
    printf("\n");
    imprimirDia(DOM);
    imprimirDia(LUN);
    imprimirDia(MAR);
    imprimirDia(MIE);
    imprimirDia(JUE);
    imprimirDia(VIE);
    imprimirDia(SAB);
    imprimirDia(9);*/

  /*  unsigned byte=0;
    activarMod(&byte, WIFI);
    activarMod(&byte, GPS);
    activarMod(&byte, TRASERA);
    activarMod(&byte, LINTERNA);
    activarMod(&byte, GPS);
    printf("a = %d\n", byte);
    printf("BLUETOOTH = %d\n", determinarMod(byte, BLUETOOTH));
    printf("     WIFI = %d\n", determinarMod(byte, WIFI));
    printf("      GPS = %d\n", determinarMod(byte, GPS));
    printf("    DATOS = %d\n", determinarMod(byte, DATOS));
    printf("  FRONTAL = %d\n", determinarMod(byte, FRONTAL));
    printf("  TRASERA = %d\n", determinarMod(byte, TRASERA));
    printf(" LINTERNA = %d\n", determinarMod(byte, LINTERNA));
    printf("   VIBRAR = %d\n", determinarMod(byte, VIBRAR));
    desactivarMod(&byte, GPS);
    desactivarMod(&byte, VIBRAR);
    printf("b = %d\n", byte);
    printf("BLUETOOTH = %d\n", determinarMod(byte, BLUETOOTH));
    printf("     WIFI = %d\n", determinarMod(byte, WIFI));
    printf("      GPS = %d\n", determinarMod(byte, GPS));
    printf("    DATOS = %d\n", determinarMod(byte, DATOS));
    printf("  FRONTAL = %d\n", determinarMod(byte, FRONTAL));
    printf("  TRASERA = %d\n", determinarMod(byte, TRASERA));
    printf(" LINTERNA = %d\n", determinarMod(byte, LINTERNA));
    printf("   VIBRAR = %d\n", determinarMod(byte, VIBRAR));
    invertirMod(&byte, FRONTAL);
    printf("c1 = %d\n", byte);
    invertirMod(&byte, TRASERA);
    printf("c = %d\n", byte);
    printf("BLUETOOTH = %d\n", determinarMod(byte, BLUETOOTH));
    printf("     WIFI = %d\n", determinarMod(byte, WIFI));
    printf("      GPS = %d\n", determinarMod(byte, GPS));
    printf("    DATOS = %d\n", determinarMod(byte, DATOS));
    printf("  FRONTAL = %d\n", determinarMod(byte, FRONTAL));
    printf("  TRASERA = %d\n", determinarMod(byte, TRASERA));
    printf(" LINTERNA = %d\n", determinarMod(byte, LINTERNA));
    printf("   VIBRAR = %d\n", determinarMod(byte, VIBRAR));
    unsigned modulo;
    printf("Que quiere invertir?\n");
    scanf("%u", &modulo);
    while(modulo < 300){
        modulo = pow(2, modulo);
        invertirMod(&byte, modulo);
        printf("byte = %d\n", byte);
        printf("BLUETOOTH = %d\n", determinarMod(byte, BLUETOOTH));
        printf("     WIFI = %d\n", determinarMod(byte, WIFI));
        printf("      GPS = %d\n", determinarMod(byte, GPS));
        printf("    DATOS = %d\n", determinarMod(byte, DATOS));
        printf("  FRONTAL = %d\n", determinarMod(byte, FRONTAL));
        printf("  TRASERA = %d\n", determinarMod(byte, TRASERA));
        printf(" LINTERNA = %d\n", determinarMod(byte, LINTERNA));
        printf("   VIBRAR = %d\n", determinarMod(byte, VIBRAR));
        printf("\n");
        printf("Que quiere invertir?\n");
        scanf("%u", &modulo);
    }*/


   /* horaT horario;
    printf("seguir?");
    int n;
    scanf("%d", &n);
    while(n){
        leerHora(&horario);
        imprimirHora(horario);
        printf("seguir?");
        scanf("%d", &n);
    }*/

   /* RGB24 a;
    a.red = 5;
    a.green = 7;
    a.blue = 8;
    RGB16 b;
    b.red = 5;
    b.green = 6;
    b.blue = 2;
    printf("%u,%u,%u\n", a.red, a.green, a.blue);
    printf("%u,%u,%u\n", b.red, b.green, b.blue);
    printf("\n");
    RGB16 a16 = RGB24a16(a);
    printf("%u,%u,%u\n", a16.red, a16.green, a16.blue);
    RGB24 b24 = RGB16a24(b);
    printf("%u,%u,%u\n", b24.red, b24.green, b24.blue);*/

   /* byteU byte;
    byte.u=0;
    activarBit(&byte.s, WIFI);
    activarBit(&byte.s, GPS);
    activarBit(&byte.s, TRASERA);
    activarBit(&byte.s, LINTERNA);
    activarBit(&byte.s, GPS);
    printf("a = %d\n", byte.u);
    verBits(byte.u);
    printf("BLUETOOTH = %d\n", determinarBit(byte.s, BLUETOOTH));
    printf("     WIFI = %d\n", determinarBit(byte.s, WIFI));
    printf("      GPS = %d\n", determinarBit(byte.s, GPS));
    printf("    DATOS = %d\n", determinarBit(byte.s, DATOS));
    printf("  FRONTAL = %d\n", determinarBit(byte.s, FRONTAL));
    printf("  TRASERA = %d\n", determinarBit(byte.s, TRASERA));
    printf(" LINTERNA = %d\n", determinarBit(byte.s, LINTERNA));
    printf("   VIBRAR = %d\n", determinarBit(byte.s, VIBRAR));
    verBits(byte.u);
    desactivarBit(&byte.s, GPS);
    desactivarBit(&byte.s, VIBRAR);
    printf("b = %d\n", byte.u);
    verBits(byte.u);
    printf("BLUETOOTH = %d\n", determinarBit(byte.s, BLUETOOTH));
    printf("     WIFI = %d\n", determinarBit(byte.s, WIFI));
    printf("      GPS = %d\n", determinarBit(byte.s, GPS));
    printf("    DATOS = %d\n", determinarBit(byte.s, DATOS));
    printf("  FRONTAL = %d\n", determinarBit(byte.s, FRONTAL));
    printf("  TRASERA = %d\n", determinarBit(byte.s, TRASERA));
    printf(" LINTERNA = %d\n", determinarBit(byte.s, LINTERNA));
    printf("   VIBRAR = %d\n", determinarBit(byte.s, VIBRAR));
    verBits(byte.u);
    invertirBit(&byte.s, FRONTAL);
    verBits(byte.u);
    invertirBit(&byte.s, TRASERA);
    printf("c = %d\n", byte.u);
    verBits(byte.u);
    printf("BLUETOOTH = %d\n", determinarBit(byte.s, BLUETOOTH));
    printf("     WIFI = %d\n", determinarBit(byte.s, WIFI));
    printf("      GPS = %d\n", determinarBit(byte.s, GPS));
    printf("    DATOS = %d\n", determinarBit(byte.s, DATOS));
    printf("  FRONTAL = %d\n", determinarBit(byte.s, FRONTAL));
    printf("  TRASERA = %d\n", determinarBit(byte.s, TRASERA));
    printf(" LINTERNA = %d\n", determinarBit(byte.s, LINTERNA));
    printf("   VIBRAR = %d\n", determinarBit(byte.s, VIBRAR));*/



    return 0;
}

void activarBit(byteS * byte, unsigned modulo){
    switch (modulo){
    case BLUETOOTH : byte->Bluetooth = 1; break;
    case WIFI : byte->Wifi = 1; break;
    case GPS : byte->Gps = 1; break;
    case DATOS : byte->Datos = 1; break;
    case FRONTAL : byte->Frontal = 1; break;
    case TRASERA : byte->Trasera = 1; break;
    case LINTERNA : byte->Linterna = 1; break;
    case VIBRAR : byte->Vibrar = 1; break;
    default : printf("modulo invalido");
    }
}
void desactivarBit(byteS * byte, unsigned modulo){
    switch (modulo){
    case BLUETOOTH : byte->Bluetooth = 0; break;
    case WIFI : byte->Wifi = 0; break;
    case GPS : byte->Gps = 0; break;
    case DATOS : byte->Datos = 0; break;
    case FRONTAL : byte->Frontal = 0; break;
    case TRASERA : byte->Trasera = 0; break;
    case LINTERNA : byte->Linterna = 0; break;
    case VIBRAR : byte->Vibrar = 0; break;
    default : printf("modulo invalido");
    }
}
void invertirBit(byteS * byte, unsigned modulo){
    switch (modulo){
    case BLUETOOTH : byte->Bluetooth ^= 1; break;
    case WIFI : byte->Wifi ^= 1; break;
    case GPS : byte->Gps ^= 1; break;
    case DATOS : byte->Datos ^= 1; break;
    case FRONTAL : byte->Frontal ^= 1; break;
    case TRASERA : byte->Trasera ^= 1; break;
    case LINTERNA : byte->Linterna ^= 1; break;
    case VIBRAR : byte->Vibrar ^= 1; break;
    default : printf("modulo invalido");
    }
}
int determinarBit(byteS byte, unsigned modulo){
    switch (modulo){
    case BLUETOOTH : return byte.Bluetooth; break;
    case WIFI : return byte.Wifi; break;
    case GPS : return byte.Gps; break;
    case DATOS : return byte.Datos; break;
    case FRONTAL : return byte.Frontal; break;
    case TRASERA : return byte.Trasera; break;
    case LINTERNA : return byte.Linterna; break;
    case VIBRAR : return byte.Vibrar; break;
    default : printf("modulo invalido");
    }
    return 404;
}

RGB16 RGB24a16(RGB24 a){
    RGB16 b;
    b.red = (a.red*5)/8;
    b.green = (a.green*6)/8;
    b.blue = (a.blue*5)/8;
    return b;
}
RGB24 RGB16a24(RGB16 a){
    RGB24 b;
    b.red = (a.red*8)/5;
    b.green = (a.green*8)/6;
    b.blue = (a.blue*8)/5;
    return b;
}

void leerHora(horaT * h){
    printf("ingresar horario:(hora:min:seg)");
    unsigned hora, min, seg;
    scanf("%d:%d:%d", &hora, &min, &seg);//&(h->hora), &(h->min), &(h->seg));
    h->hora = hora;
    h->min = min;
    h->seg = seg/2;
}
void imprimirHora(horaT h){
    printf("%d:%d:%d\n", h.hora, h.min, h.seg*2);
}

void activarMod(unsigned * byte, unsigned mascara){
    *byte |= mascara;
}
void desactivarMod(unsigned * byte, unsigned mascara){
    *byte &= ~mascara;
}
void invertirMod(unsigned * byte, unsigned mascara){
    *byte ^= mascara;
}
int determinarMod(unsigned byte, unsigned mascara){
    if (byte & mascara) return 1;
    return 0;
}
/*int determinarMod(unsigned byte, unsigned mascara){
    return ((byte & mascara));
}*/

char * queDia(semanaE d){
    switch (d){
    case DOM : return "domingo"; break;
    case LUN : return "lunes"; break;
    case MAR : return "martes"; break;
    case MIE : return "miercoles"; break;
    case JUE : return "jueves"; break;
    case VIE : return "viernes"; break;
    case SAB : return "sabado"; break;
    default : return "no es un dia valido";
    }
}
void imprimirDia(semanaE d){
    switch (d){
    case DOM : printf("domingo\n"); break;
    case LUN : printf("lunes\n"); break;
    case MAR : printf("martes\n"); break;
    case MIE : printf("miercoles\n"); break;
    case JUE : printf("jueves\n"); break;
    case VIE : printf("viernes\n"); break;
    case SAB : printf("sabado\n"); break;
    default : printf("no es un dia valido");
    }
}

void iniciarEstudiante(estudianteT * e){
    printf("Ingrese apellido:");
    scanf("%s", e->apellido);
    printf("Ingrese nombre:");
    scanf("%s", e->nombre);
    printf("Ingrese legajo:");
    scanf("%s", e->legajo);
    int i;
    printf("es argentino? (1=si; 0=no)");
    scanf("%d", &i);
    if (i){
        printf("Ingrese DNI:");
        scanf("%d", &(e->ID.DNI));
    }
    else{
        printf("Ingrese pasaporte:");
        scanf("%s", e->ID.pasaporte);
    }
}

int antes(int f1, int f2){
    if (f1<f2) {
        return 1;
    }
    return 0;
}

void iniciarCarta(cartaT * c, char palo[], int numero){
    c->numero = numero;
    strcpy(c->palo, palo);
}
void iniciarMazo(cartaT mazo[], int cant, char palo1[], char palo2[], char palo3[], char palo4[]){
    int i, j=0, k = cant/4;
    for(i=1; i<=k; i++){
        iniciarCarta(&mazo[j], palo1, i);
        j++;
    }
    for(i=1; i<=k; i++){
        iniciarCarta(&mazo[j], palo2, i);
        j++;
    }
    for(i=1; i<=k; i++){
        iniciarCarta(&mazo[j], palo3, i);
        j++;
    }
    for(i=1; i<=k; i++){
        iniciarCarta(&mazo[j], palo4, i);
        j++;
    }
}
void iniciarMazoTruco(cartaT mazo[]){
    int i, j=0;
    for(i=1; i<8; i++){
        iniciarCarta(&mazo[j], "espada", i);
        j++;
    }
    for(i=10; i<13; i++){
        iniciarCarta(&mazo[j], "espada", i);
        j++;
    }
    for(i=1; i<8; i++){
        iniciarCarta(&mazo[j], "basto", i);
        j++;
    }
    for(i=10; i<13; i++){
        iniciarCarta(&mazo[j], "basto", i);
        j++;
    }
    for(i=1; i<8; i++){
        iniciarCarta(&mazo[j], "oro", i);
        j++;
    }
    for(i=10; i<13; i++){
        iniciarCarta(&mazo[j], "oro", i);
        j++;
    }
    for(i=1; i<8; i++){
        iniciarCarta(&mazo[j], "copa", i);
        j++;
    }
    for(i=10; i<13; i++){
        iniciarCarta(&mazo[j], "copa", i);
        j++;
    }
}
void swapCarta(cartaT *ptra, cartaT *ptrb) {
    cartaT tmp;
    tmp = *ptra; // guarda el valor de a
    *ptra = *ptrb;   // almacena b en a
    *ptrb = tmp; // almacena a en b
    }
void barajar(cartaT mazo[], int cant){
    int i;
    for(i=0; i<(10*cant); i++){
        swapCarta(&mazo[rand()%cant], &mazo[rand()%cant]);
    }
}
cartaT sacarCarta(cartaT mazo[], int cant){
    int i;
    cartaT aux;
    aux=mazo[0];
    for(i=1; i<cant; i++){
        mazo[i-1]=mazo[i];
    }
    mazo[cant-1]=aux;
    return aux;
}
void imprimirCarta(cartaT carta){
    printf("%d de %s\n\n", carta.numero, carta.palo);
    printf(
    "__________\n"
    "|        |\n"
    "| %-2u     |\n"
    "|        |\n"
    "| %-6s |\n"
    "|        |\n"
    "|     %2u |\n"
    "|________|\n\n", carta.numero, carta.palo, carta.numero);
}


void iniciarDireccion(direccionT * d){
    printf("Ingrese calle:");
    gets(d->calle);
   // scanf("%s", d->calle);
    printf("Ingrese ciudad:");
    gets(d->ciudad);
   // scanf("%s", d->ciudad);
    printf("Ingrese codigo postal:");
    scanf("%d", &(d->codigo_postal));
    printf("Ingrese pais:");
    gets(d->pais);
   // scanf("%s", d->pais);
}
void iniciarAlumno(alumnoT * a){
    printf("Ingrese apellido:");
    fgets(a->apellido, 50, stdin);
  //  scanf("%10s", a->apellido);
    printf("Ingrese nombre:");
    gets(a->nombre);
  //  scanf("%s", a->nombre);
    printf("Ingrese legajo:");
    gets(a->legajo);
  //  scanf("%s", a->legajo);
    printf("Ingrese promedio:");
    scanf("%f", &(a->promedio));
    iniciarDireccion(&(a->domicilio));
}

void iniciarRectangulo(struct rectangulo * r){
    printf("Ingrese base:");
    scanf("%f", &(r->base));
    printf("Ingrese altura:");
    scanf("%f", &(r->altura));
}
float areaRectangulo(struct rectangulo r){
    return (r.base*r.altura);
}

void verBits(TIPO valor){

    unsigned size = (sizeof(valor)*8);
    TIPO mascara = 1 << (size-1);
    printf("%10u = ", valor);
    for (unsigned i=1; i <= size ; i++){
        printf( valor & mascara ? "1" : "0");
        valor <<= 1;
        if (i % 8 == 0) printf(" ");
    }
    printf("\n");
}
