#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#define TOTAL (TAMF*TAMC)
#define PRIN_F 8
#define PRIN_C 8
#define PRIN_B 10
#define FACIL_F 10
#define FACIL_C 10
#define FACIL_B 16
#define MEDIO_F 12
#define MEDIO_C 16
#define MEDIO_B 25
#define DIFICIL_F 12
#define DIFICIL_C 26
#define DIFICIL_B 35
#define IMPOS_F 12
#define IMPOS_C 26
#define IMPOS_B 50

char const BOMBA = 0xFE;
char const OCULTO = 0xB1;
char const MARCA = 0xB2;

int TAMF = 8;
//MAXIMO TAMC == 26
int TAMC = 8;
int C_BOMB = 10;

typedef enum {FALSE, TRUE} boolean;

typedef struct{
    int visible : 1;
    int bomba : 1;
    int marca : 1;
    int cantidad : 5;
} casillaT;

void clear();
void reservarTablero(casillaT *** mat, int n, int m);
casillaT ** newTablero(int n, int m);
void iniciarTablero(casillaT ** mat, int fil, int col);
void imprimirTablero(casillaT ** mat, int  fil, int col);
void imprimirDescubierto(casillaT ** mat, int  fil, int col);
void imprimirPerdido(casillaT ** mat, int  fil, int col);
void freeTablero(casillaT ** mat, int fil);
int juego(casillaT ** tab, int filas, int columnas);
void procesoLugar(char lugar[], int * fil, int * col);
void posicion(char c, int * fil, int * col);
int revelar(casillaT ** tab, int  fil, int col);
int revelarCero(casillaT ** tab, int  i, int j);
int menu();
void dificultad();
void personalizado();
void portada();
void tutorial();

int main()
{   casillaT ** tablero;
    portada();
    while (menu()){
        clear();
        tablero = newTablero(TAMF, TAMC);
        iniciarTablero(tablero, TAMF, TAMC);
        imprimirTablero(tablero, TAMF, TAMC);
        if(juego(tablero, TAMF, TAMC)){
            printf("\nGANASTE!!\n");
        }
        else{
            printf("\nPERDISTE!!\n");
        }
        freeTablero(tablero, TAMF);
    }
    return 0;
}

int menu(){
    int n;
    printf("\n\tSalir[0]\tJugar[1]\tDificultad[2]\n");
    scanf("%d", &n);
    while(n){
        switch(n){
        case 1 : return 1;
        case 2 : clear(); dificultad(); break;
        default : printf("CARACTER NO VALIDO"); break;
        }
        printf("\n\tSalir[0]\tJugar[1]\tDificultad[2]\n");
        scanf("%d", &n);
    }
    return 0;
}
void dificultad(){
    int n;
    printf("\n\t\t\tBUSCAMINAS\n\n");
    printf("Elija la dificultad: \n\n");
    printf("Principiante [0] |  %-2d filas  |  %-2d columnas  |  %-2d bombas\n\n",PRIN_F,PRIN_C,PRIN_B);
    printf("Facil        [1] |  %-2d filas  |  %-2d columnas  |  %-2d bombas\n\n",FACIL_F,FACIL_C,FACIL_B);
    printf("Medio        [2] |  %-2d filas  |  %-2d columnas  |  %-2d bombas\n\n",MEDIO_F,MEDIO_C,MEDIO_B);
    printf("Dificil      [3] |  %-2d filas  |  %-2d columnas  |  %-2d bombas\n\n",DIFICIL_F,DIFICIL_C,DIFICIL_B);
    printf("Imposible    [4] |  %-2d filas  |  %-2d columnas  |  %-2d bombas\n\n",IMPOS_F,IMPOS_C,IMPOS_B);
    printf("Personalizado[5]\n\n");
    printf("Cancelar     [6]\n\n");
    scanf("%d", &n);
    sigo:
    switch(n){
    case 0 : TAMF = PRIN_F; TAMC = PRIN_C; C_BOMB = PRIN_B; break;
    case 1 : TAMF = FACIL_F; TAMC = FACIL_C; C_BOMB = FACIL_B; break;
    case 2 : TAMF = MEDIO_F; TAMC = MEDIO_C; C_BOMB = MEDIO_B; break;
    case 3 : TAMF = DIFICIL_F; TAMC = DIFICIL_C; C_BOMB = DIFICIL_B; break;
    case 4 : TAMF = IMPOS_F; TAMC = IMPOS_C; C_BOMB = IMPOS_B; break;
    case 5 : clear(); personalizado(); break;
    case 6 : break;
    default : printf("CARACTER NO VALIDO\n\nIngrese otro numero: ");
    scanf("%d", &n); goto sigo;
    }
    clear();
    portada();
}

void personalizado(){
    int fil, col, bomb;
    printf("\n\t\t\tBUSCAMINAS\n\n");
    printf("El numero de filas debe estar entre 2 y 16\n");
    personalizado_fila:
    printf("\nFilas:  ");
    scanf("%d", &fil);
    printf("\n");
    if (fil<2){printf("EL NUMERO INGRESADO ES MUY CHICO(MIN = 2)\n"); goto personalizado_fila;}
    else if (fil>64){printf("EL NUMERO INGRESADO ES MUY GRANDE(MAX = 16)\n"); goto personalizado_fila;}
    TAMF = fil;
    printf("El numero de columnas debe estar entre 2 y 26\n");
    personalizado_columna:
    printf("\nColumnas:  ");
    scanf("%d", &col);
    printf("\n");
    if (col<2){printf("EL NUMERO INGRESADO ES MUY CHICO(MIN = 2)\n"); goto personalizado_columna;}
    else if (col>26){printf("EL NUMERO INGRESADO ES MUY GRANDE(MAX = 26)\n"); goto personalizado_columna;}
    TAMC = col;
    int maxBomb = ((fil*col)/5);
    printf("El numero de bombas debe estar entre 1 y %d\n", maxBomb);
    personalizado_bomba:
    printf("\nBombas:  ");
    scanf("%d", &bomb);
    printf("\n");
    if (bomb<1){printf("EL NUMERO INGRESADO ES MUY CHICO(MIN = 1)\n"); goto personalizado_bomba;}
    else if (bomb>maxBomb){printf("EL NUMERO INGRESADO ES MUY GRANDE(MAX = %d)\n", maxBomb); goto personalizado_bomba;}
    C_BOMB = bomb;
}

int juego(casillaT ** tab, int filas, int columnas){
    int fil=0, col=0, casillas = (TOTAL - C_BOMB);
    char lugar[10];
    while(casillas){
        printf("Ingrese Posicion: ");
        scanf("%s", lugar);
        clear();
        procesoLugar(lugar, &fil, &col);
        if(lugar[strlen(lugar)-1] == '?'){
            tab[fil][col].marca ^= 1;
        }
        else{
            if (tab[fil][col].bomba){
                tab[fil][col].visible = TRUE;
                imprimirPerdido(tab, filas, columnas);
                return 0;
            }
            if(!tab[fil][col].visible){
                casillas -= revelar(tab, fil, col);
            }
        }
        imprimirTablero(tab, filas, columnas);
    }
    return 1;
}

int revelar(casillaT ** tab, int  fil, int col){
    tab[fil][col].visible = TRUE;
    if (tab[fil][col].cantidad == 0){
        return revelarCero(tab, fil, col);
    }
    return 1;
}
int revelarCero(casillaT ** tab, int fil, int col){
    int suma = 1;
    if(fil!=0){
        if(!tab[fil-1][col].visible){
            suma += revelar(tab, fil-1, col);//sup cent
        }
        if((col!=0)&&(!tab[fil-1][col-1].visible)){
            suma += revelar(tab, fil-1, col-1);//sup izq
        }
        if((col!=(TAMC-1))&&(!tab[fil-1][col+1].visible)){
            suma += revelar(tab, fil-1, col+1);//sup der
        }
    }
    if(fil!=(TAMF-1)){
        if (!tab[fil+1][col].visible){
            suma += revelar(tab, fil+1, col);//inf cent
        }
        if((col!=0)&&(!tab[fil+1][col-1].visible)){
            suma += revelar(tab, fil+1, col-1);//inf izq
        }
        if((col!=(TAMC-1))&&(!tab[fil+1][col+1].visible)){
            suma += revelar(tab, fil+1, col+1);//inf der
        }
    }
    if((col!=0)&&(!tab[fil][col-1].visible)){
        suma += revelar(tab, fil, col-1);//centro izq
    }
    if((col!=(TAMC-1))&&(!tab[fil][col+1].visible)){
        suma += revelar(tab, fil, col+1);//centro der
    }
    return suma;
}

void procesoLugar(char lugar[], int * fil, int * col){
    if(strlen(lugar)<3){
        posicion(lugar[0], fil, col);
        posicion(lugar[1], fil, col);
    }
    else{
        int i=0, num=0;
        char c = lugar[i];
        while (c!='\0'){
            if ((c>='0')&&(c<='9')){
                num = ((num*10) + (c-'0'));
            }
            else{
                posicion(c, fil, col);
            }
            i++;
            c = lugar[i];
        }
        *fil = num-1;
    }
    *fil %= TAMF;
    *col %= TAMC;
}

void posicion(char c, int * fil, int * col){
    if ((c>='a')&&(c<='z')){
        *col = c-'a';
    }
    else{
        if ((c>='A')&&(c<='Z')){
            *col = c-'A';
        }
        else{
            if ((c>='1')&&(c<='9')){
                *fil = (c-'0')-1;
            }
        }
    }
}

casillaT ** newTablero(int fil, int col){
    int i=0;
    casillaT ** aux = (casillaT **) calloc(fil, sizeof(*aux));
    for(i=0; i<fil; i++){
        aux[i] = (casillaT *) calloc(col, sizeof(**aux));
    }
    return aux;
}

void iniciarTablero(casillaT ** mat, int fil, int col){
    int bombas = C_BOMB, i, j;
    srand(time(NULL));
    while(bombas){
        i = (rand()%fil);
        j = (rand()%col);
        if (!(mat[i][j].bomba)){
            mat[i][j].bomba = TRUE;
            bombas--;
            if(i!=0){
                //sup cent
                mat[i-1][j].cantidad += 1;
                if(j!=0){
                    //sup izq
                    mat[i-1][j-1].cantidad += 1;
                }
                if(j!=(col-1)){
                    //sup der
                    mat[i-1][j+1].cantidad += 1;
                }
            }
            if(i!=(fil-1)){
                //inf cent
                mat[i+1][j].cantidad += 1;
                if(j!=0){
                    //inf izq
                    mat[i+1][j-1].cantidad += 1;
                }
                if(j!=(col-1)){
                    //inf der
                    mat[i+1][j+1].cantidad += 1;
                }
            }
            if(j!=0){
                //centro izq
                mat[i][j-1].cantidad += 1;
            }
            if(j!=(col-1)){
                //centro der
                mat[i][j+1].cantidad += 1;
            }
        }
    }
}

void imprimirTablero(casillaT ** mat, int  fil, int col){
    int i, j;
    char c = 'A';
    printf("Para descubrir una celda ingrese una coordenada de una letra y un numero (no importa el orden).\n");
    printf("Para marcar o desmarcar una celda como sospechosa agregue un signo de pregunta (?) al final de la coordenada.\n");
    printf("   ");
    for(i=0; i<col; i++){
        printf("   %c", c+i);
    }
    printf("\n    %c",0xDA);
    for(j=0; j<col-1; j++){
        printf("%c%c%c%c",0xC4,0xC4,0xC4,0xC2);
    }
    printf("%c%c%c%c\n",0xC4,0xC4,0xC4,0xBF);
    for (i=0; i<fil-1; i++){
        printf(" %-3d", i+1);
        for (j=0; j<col; j++){
            if(mat[i][j].visible){
                if(mat[i][j].bomba){
                    printf("%c%2c ", 0xB3, BOMBA);
                }
                else{
                    printf("%c%2d ", 0xB3, mat[i][j].cantidad);
                }
            }
            else{
                if(mat[i][j].marca){
                    printf("%c%2c ", 0xB3, MARCA);
                }
                else{
                    printf("%c%2c ", 0xB3, OCULTO);
                }
            }
        }
        printf("%c\n    %c", 0xB3, 0xC3);
        for(j=0; j<col-1; j++){
            printf("%c%c%c%c",0xC4,0xC4,0xC4,0xC5);
        }
        printf("%c%c%c%c\n",0xC4,0xC4,0xC4,0xB4);
    }
    printf(" %-3d", i+1);
    for (j=0; j<col; j++){
        if(mat[i][j].visible){
            if(mat[i][j].bomba){
                printf("%c%2c ", 0xB3, BOMBA);
            }
            else{
                printf("%c%2d ", 0xB3, mat[i][j].cantidad);
            }
        }
        else{
            if(mat[i][j].marca){
                printf("%c%2c ", 0xB3, MARCA);
            }
            else{
                printf("%c%2c ", 0xB3, OCULTO);
            }
        }
    }
    printf("%c\n    %c", 0xB3, 0xC0);
    for(j=0; j<col-1; j++){
        printf("%c%c%c%c",0xC4,0xC4,0xC4,0xC1);
    }
    printf("%c%c%c%c\n",0xC4,0xC4,0xC4,0xD9);
}
void imprimirDescubierto(casillaT ** mat, int  fil, int col){
    int i, j;
    char c = 'A';
    printf("Para descubrir una celda ingrese una coordenada de una letra y un numero (no importa el orden).\n");
    printf("Para marcar o desmarcar una celda como sospechosa agregue un signo de pregunta (?) al final de la coordenada.\n");
    printf("   ");
    for(i=0; i<col; i++){
        printf("   %c", c+i);
    }
    printf("\n    %c",0xDA);
    for(j=0; j<col-1; j++){
        printf("%c%c%c%c",0xC4,0xC4,0xC4,0xC2);
    }
    printf("%c%c%c%c\n",0xC4,0xC4,0xC4,0xBF);
    for (i=0; i<fil-1; i++){
        printf(" %-3d", i+1);
        for (j=0; j<col; j++){
            if(mat[i][j].bomba){
                printf("%c%2c ", 0xB3, BOMBA);
            }
            else{
                printf("%c%2d ", 0xB3, mat[i][j].cantidad);
            }
        }
        printf("%c\n    %c", 0xB3, 0xC3);
        for(j=0; j<col-1; j++){
            printf("%c%c%c%c",0xC4,0xC4,0xC4,0xC5);
        }
        printf("%c%c%c%c\n",0xC4,0xC4,0xC4,0xB4);
    }
    printf(" %-3d", i+1);
    for (j=0; j<col; j++){
        if(mat[i][j].bomba){
            printf("%c%2c ", 0xB3, BOMBA);
        }
        else{
            printf("%c%2d ", 0xB3, mat[i][j].cantidad);
        }
    }
    printf("%c\n    %c", 0xB3, 0xC0);
    for(j=0; j<col-1; j++){
        printf("%c%c%c%c",0xC4,0xC4,0xC4,0xC1);
    }
    printf("%c%c%c%c\n",0xC4,0xC4,0xC4,0xD9);
}
void imprimirPerdido(casillaT ** mat, int  fil, int col){
    int i, j;
    char c = 'A';
    printf("\n\n");
    printf("   ");
    for(i=0; i<col; i++){
        printf("   %c", c+i);
    }
    printf("\n    %c",0xDA);
    for(j=0; j<col-1; j++){
        printf("%c%c%c%c",0xC4,0xC4,0xC4,0xC2);
    }
    printf("%c%c%c%c\n",0xC4,0xC4,0xC4,0xBF);
    for (i=0; i<fil-1; i++){
        printf(" %-3d", i+1);
        for (j=0; j<col; j++){
            if(mat[i][j].bomba){
                printf("%c%2c ", 0xB3, BOMBA);
            }
            else{
                if(mat[i][j].visible){
                    printf("%c%2d ", 0xB3, mat[i][j].cantidad);
                }
                else{
                    if(mat[i][j].marca){
                        printf("%c%2c ", 0xB3, MARCA);
                    }
                    else{
                        printf("%c%2c ", 0xB3, OCULTO);
                    }
                }
            }
        }
        printf("%c\n    %c", 0xB3, 0xC3);
        for(j=0; j<col-1; j++){
            printf("%c%c%c%c",0xC4,0xC4,0xC4,0xC5);
        }
        printf("%c%c%c%c\n",0xC4,0xC4,0xC4,0xB4);
    }
    printf(" %-3d", i+1);
    for (j=0; j<col; j++){
        if(mat[i][j].bomba){
            printf("%c%2c ", 0xB3, BOMBA);
        }
        else{
            if(mat[i][j].visible){
                printf("%c%2d ", 0xB3, mat[i][j].cantidad);
            }
            else{
                if(mat[i][j].marca){
                    printf("%c%2c ", 0xB3, MARCA);
                }
                else{
                    printf("%c%2c ", 0xB3, OCULTO);
                }
            }
        }


    }
    printf("%c\n    %c", 0xB3, 0xC0);
    for(j=0; j<col-1; j++){
        printf("%c%c%c%c",0xC4,0xC4,0xC4,0xC1);
    }
    printf("%c%c%c%c\n",0xC4,0xC4,0xC4,0xD9);
}

void freeTablero(casillaT ** mat, int fil){
    int i=0;
    for(i=0; i<fil; i++){
        free(mat[i]);
    }
    free(mat);
}

void portada(){
    printf("\n\t\t\tBUSCAMINAS\n\n");
    printf("\t      A   B   C   D   E   F   G   H\n");
    printf("\t    %c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",0xDA,0xC4,0xC4,0xC4,0xC2,0xC4,0xC4,0xC4,0xC2,0xC4,0xC4,0xC4,0xC2,0xC4,0xC4,0xC4,0xC2);
    printf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c\n",0xC4,0xC4,0xC4,0xC2,0xC4,0xC4,0xC4,0xC2,0xC4,0xC4,0xC4,0xC2,0xC4,0xC4,0xC4,0xBF);
    printf("\t  1 %c 0 %c 1 %c %c %c 1 %c 0 %c 0 %c 1 %c %c %c\n", 0xB3, 0xB3, 0xB3, MARCA, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, OCULTO, 0xB3);
    printf("\t    %c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",0xC3,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5);
    printf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c\n",0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xB4);
    printf("\t  2 %c 0 %c 1 %c 1 %c 1 %c 0 %c 1 %c 2 %c %c %c\n", 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, OCULTO, 0xB3);
    printf("\t    %c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",0xC3,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5);
    printf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c\n",0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xB4);
    printf("\t  3 %c 0 %c 0 %c 0 %c 0 %c 0 %c 1 %c %c %c %c %c\n", 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, MARCA, 0xB3, OCULTO, 0xB3);
    printf("\t    %c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",0xC3,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5);
    printf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c\n",0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xB4);
    printf("\t  4 %c 1 %c 1 %c 1 %c 0 %c 0 %c 1 %c %c %c %c %c\n", 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, OCULTO, 0xB3, OCULTO, 0xB3);
    printf("\t    %c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",0xC3,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5);
    printf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c\n",0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xB4);
    printf("\t  5 %c 1 %c %c %c 2 %c 1 %c 0 %c 1 %c %c %c %c %c\n", 0xB3, 0xB3, MARCA, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, OCULTO, 0xB3, OCULTO, 0xB3);
    printf("\t    %c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",0xC3,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5);
    printf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c\n",0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xB4);
    printf("\t  6 %c 1 %c 2 %c %c %c 1 %c 0 %c 1 %c %c %c %c %c\n", 0xB3, 0xB3, 0xB3, MARCA, 0xB3, 0xB3, 0xB3, 0xB3, OCULTO, 0xB3, OCULTO, 0xB3);
    printf("\t    %c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",0xC3,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5);
    printf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c\n",0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xB4);
    printf("\t  7 %c 0 %c 1 %c 1 %c 1 %c 1 %c 2 %c %c %c %c %c\n", 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, OCULTO, 0xB3, OCULTO, 0xB3);
    printf("\t    %c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",0xC3,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5);
    printf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c\n",0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xC5,0xC4,0xC4,0xC4,0xB4);
    printf("\t  8 %c 0 %c 0 %c 0 %c 0 %c 1 %c %c %c %c %c %c %c\n", 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, 0xB3, MARCA, 0xB3, OCULTO, 0xB3, OCULTO, 0xB3);
    printf("\t    %c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c",0xC0,0xC4,0xC4,0xC4,0xC1,0xC4,0xC4,0xC4,0xC1,0xC4,0xC4,0xC4,0xC1,0xC4,0xC4,0xC4,0xC1);
    printf("%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c\n",0xC4,0xC4,0xC4,0xC1,0xC4,0xC4,0xC4,0xC1,0xC4,0xC4,0xC4,0xC1,0xC4,0xC4,0xC4,0xD9);
}

void clear()
{
    system("cls");
}
