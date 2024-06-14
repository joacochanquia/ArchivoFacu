#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define CANT_PAISES 5
#include <math.h>

void maxnum (int n, float * ptrmin, float * ptrmax);
void swap(int * ptra, int * ptrb);
int primo(int n);
int factorialrec(int n);
int factorial(int n);
int damepar();
void imprimirBinario (unsigned int n);
void imprimirBinarioRec (unsigned int n);
float piF();
double piD();
void sumaDigitosSucesiva(int n);
int sumaDigitos(int n);
void juegoDados();

int main()
{
   /* int i;
    for (i=1;i<=50;i++)
        if (i%5==0)
            printf("i=%d\n",i);
    printf("\n");

    for (i=5;i<=50;i+=5)
        printf("i=%d\n",i);
    printf("\n");

    float d, m;
    scanf("%f",&d);
    m= d / 1.61;
    printf("%f Km son %f millas", d, m);
    printf("\n");  */

   /* char a, b;
    printf("Ingrese el primer caracter:\n");
    scanf(" %c", &a);
    printf("Se leyó el caracter: %c\n", a);
    printf("\n");
    printf("Ingrese el segundo caracter:\n");
    scanf(" %c", &b);
    printf("Se leyó el caracter: %c\n", b); */

   /* int edad;
    scanf(" %d", &edad);
    if (edad >= 40)
    printf("Tiene %d años o más",40);
    else
    printf("Tiene menos de %d años",40);
    printf("\n");


    int total, x = 1;
    total=0;
    while (x <= 10) {
    total += x;
    ++x;
    }
    printf("Total = %d",total);
    printf("\n");

    int valor;
    scanf("%d",&valor);
    switch (valor % 2) {
    case 0: printf("El valor es par");break;
    case 1: printf("El valor es impar");break;
    }
    printf("\n");

    int x, y;
    scanf("%d",&x);
    scanf("%d",&y);
    printf("x + y = %d ",x+y); */

   /* int x, y;
    char o;
    scanf("%d",&x);
    scanf("%d",&y);
    scanf(" %c",&o);
    switch (o) {
    case '+': printf("El valor es %d",x+y);break;
    case '-': printf("El valor es %d",x-y);break;
    case '*': printf("El valor es %d",x*y);break;
    case '/': printf("El valor es %d",x/y);break;
    default : printf("El operador ingresado no es valido");break;
    } */

   /* int i;
    for (i = 0; i <= 11; i++) printf("%d\n",i);
    printf("\n");
    for (i = 0; i <= 11; ++i) printf("%d\n",i);
    printf("\n");
    for (i = 2; i <= 11; i+=2) printf("%d\n",i);
    printf("\n");
    for (i = 1; i <= 11; i*=2) printf("%d\n",i);
    printf("\n");
    for (i = 11; i >= 1; i-=2) printf("%d\n",i);
    printf("\n");
    for (i = 11; i > 1; i=+1) printf("%d\n",i);
    printf("\n"); */

    /*

    int i;
    for (i = 1; i <= 10; i++) printf("%f\n",sqrt(i));
    printf("\printf("%d\n", r);n");
    for (i = 1; i <= 10; i++) printf("%f\n",pow(i,2));
    printf("\n");
    for (i = 1; i <= 10; i++) printf("%f\n",pow(i,3)); */

   /* int n;
    scanf("%d",&n);
    printf(" el factorial de %d es %d\n", n, factorial(n));
    printf(" el factorial de %d es %d\n", n, factorialrec(n)); */

   /* int n;
    scanf("%d",&n);

    if (primo(n)==0) printf("%d no es primo", n);
    else printf("%d es un numero primo", n); */

   /* int x, y;
    x = 10;
    y = 20;
    printf("x=%d\ty=%d\n",x,y);
    swap(&x, &y);
    printf("x=%d\ty=%d\n",x,y); */


   /* int n;int * min, int * max
    float max = -1, min = 32000;
    scanf ("%d", &n);
    maxnum (n, &min, &max);
    printf ("el minimo es %.2f y el maximo es %.2f", min, max); */


   /* int n, i;
    for (i = 0; i < 15; i++)
        printf ("%d\n", n = rand());
    printf ("\n");
    srand(time(NULL));
    for (i = 0; i < 15; i++)
        printf ("%d\n", n = rand()); */

   /* int a, b, c, nota = 0, i;
    srand(time(NULL));
    for (i = 0; i < 4; i++) {
        printf ("%d + %d = ", a = (rand()%100), b = (rand()%100));
        scanf ("%d", &c);
        if (c == (a + b)) nota++;
    }
    switch (nota) {
    case 0: printf("La nota es E");break;
    case 1: printf("La nota es D");break;
    case 2: printf("La nota es C");break;
    case 3: printf("La nota es B");break;
    case 4: printf("La nota es A");break;
    default : printf("El operador ingresado no es valido");break;
    } */

   /* int n, i;
    scanf ("%d", &n);
    for (i = 0; i < n; i++)
        printf ("%d\n", damepar()); */

   /* int cod, cant, min1 = 100000, minCod1, min2 = 100000, minCod2, i, cont = 0;

    for (i = 0; i < CANT_PAISES; i++){
    printf("ingrese el codigo de pais: ");
    scanf ("%d", &cod);
    printf("\ningrese las especies del pais: ");
    scanf ("%d", &cant);
    if (cant < min1){
        min1 = cant;
        minCod1 = cod;
    }
    else
    {
        if (cant < min2){
            min2 = cant;
            minCod2 = cod;
            }
    }
    if (cant > 40){
        cont++;
    }
    }
    printf("Los dos paises con menos especies son");
    printf(" el pais %d con %d especies y el pais %d con %d especies.\n", minCod1, min1, minCod2, min2);
    printf("El porcentaje de paises con mas de 40 especies es de %.1f", ((double)cont*100) / CANT_PAISES);
    */

   /* unsigned int n=0;
    scanf("%u", &n);
    imprimirBinario (n);
    printf("\n");
    imprimirBinarioRec (n);
    printf("\n"); */

   /* printf("Float = %.10f\n", piF());
    printf("Double = %.10f\n", piD());*/

   /* int n;
    scanf("%d", &n);
    while (n != 0){
        sumaDigitosSucesiva(n);
        printf("\n");
        scanf("%d", &n);
    }*/

  /*  int si;
    printf("Las reglas del juego son las siguientes:\n");
    printf("* Si en cualquier jugada los dados suman 2 o 12, el jugador pierde.\n");
    printf("* Si en la primer jugada los datos suman 7 u 11, el jugador gana.\n");
    printf("* Si en la primer jugada los dados no suman 2, 7, 11 ni 12, el jugador debera seguir\n"
           "arrojando los dados hasta conseguir el numero obtenido en la primer jugada para ganar.\n\n");
    printf("Ingrese 1 para jugar: ");
    scanf("%d", &si);
    while (si == 1){
        juegoDados();
        printf("\n\nIngrese 1 para jugar: ");
        scanf("%d", &si);
    }*/





    return 0;
}


int factorial(int n)
{
    int r, i;
    r = 1;
    for (i = 1; i <= n; i++) {
    r= r*i;
    }
    return r;
}


int factorialrec(int n)
{
    if (n==0) return 1;
    else return (n*factorialrec(n-1));
}


int primo(int n)
{
    int i;

   /* for (i=(n-1);i>0;i--)
        {
        if ((n%i)==0) break;
        } */
    int f=1;
    i=n-1;
    if (i>0){
    do
    {
        if ((n%i)==0) f=1;
    }
    while((i>0)&&(f==0));
    }
    else printf("El numero ingresado debe ser mayor a 1\n");

    printf("i=%d\n",i);
    if (i == 1) return 1;
    else return 0;
}


void swap(int *ptra, int *ptrb) {
    int tmp;
    tmp = *ptra; // guarda el valor de a
    *ptra = *ptrb;   // almacena b en a
    *ptrb = tmp; // almacena a en b
    }

void maxnum (int n, float * ptrmin, float * ptrmax) {
    int i;
    float num;
    for (i = 0; i < n; i++){
        scanf("%f", &num);
        if (num > *ptrmax) *ptrmax = num;
        else
            if (num < *ptrmin) *ptrmin = num;

    }
}

int damepar() {
    static int a = -2;
    a += 2;
    return a;
}

void imprimirBinario (unsigned int n){
    unsigned int r, b = 0, i = 1;
    r = n;
    do {
        b = (b + ((r%2) * i));
        r = (r/2);
        i *= 10;
    }
    while (r != 0);
    printf("%u", b);
}
void imprimirBinarioRec (unsigned int n) {
    unsigned int r = (n/2);
    if (r != 0){
        imprimirBinarioRec(r);
    }
    printf("%d", (n%2));
}

float piF(){
    int i, j=2;
    float pi, r=0;

    for (i=0; i<100; i++){
        r += ((float)4/(j*(j+1)*(j+2)));
        j+=2;
        r -= ((float)4/(j*(j+1)*(j+2)));
        j+=2;
    }
    pi = (3+r);
    return pi;
}

double piD(){
    int i, j=2;
    double pi, r=0;
    for (i=0; i<100; i++){
        r += ((double)4/(j*(j+1)*(j+2)));
        j+=2;
        r -= ((double)4/(j*(j+1)*(j+2)));
        j+=2;
    }
    pi = (3+r);
    return pi;
}

int sumaDigitos(int n){
    int r=0;
    while (n!=0){
        r += (n%10);
        n /= 10;
    }
    return r;
}

void sumaDigitosSucesiva(int n){
    printf("%d",n);
    while ((n/10)!=0){
        n = sumaDigitos(n);
        printf(" --> %d", n);
    }
}

void juegoDados(){
    int d1, d2, r, e, f=0;
    srand(time(NULL));
    printf("Tirando dados!\n");
    d1 = ((rand()%6)+1);
    d2 = ((rand()%6)+1);
    printf("Los dados dieron %d y %d!\n", d1, d2);
    r = d1 + d2;
    e = r;
    printf("La suma es de %d!\n", r);
    if ((r==7)||(r==11)){
        printf("Ganaste!!\n");
    }
    else{
        while (f!=1){
            if ((r==2)||(r==12)){
                printf("Perdiste!!\n\n");
                f=1;
            }
            else{
                printf("\nTira los dados:\n");
                scanf("%d", &r);
                d1 = ((rand()%6)+1);
                d2 = ((rand()%6)+1);
                printf("Los dados dieron %d y %d!\n", d1, d2);
                r = d1 + d2;
                printf("La suma es de %d!\n", r);
                if ((r==e)){
                    printf("Ganaste!!\n\n");
                    f=1;
                }
            }
        }


    }


}






