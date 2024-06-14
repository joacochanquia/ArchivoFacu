#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define M_PI 3.14159265358979323846

typedef enum { CIRCULO, ELIPSE, TRIANGULO, CUADRADO, RECTANGULO } figuraE;

typedef struct {
    float radio;
} circuloT;

typedef struct {
    float radioMax;
    float radioMin;
} elipseT;

typedef struct {
    float lado1;
    float lado2;
    float lado3;
    float h;
} trianguloT;

typedef struct {
    float lado;
} cuadradoT;

typedef struct {
    float ladoA;
    float ladoB;
} rectanguloT;

typedef union {
    circuloT o;
    elipseT e;
    trianguloT t;
    cuadradoT c;
    rectanguloT r;
}figuraU;

typedef struct {
    unsigned tipo;
    figuraU datos;
}figuraT;

void cargarCirculo(circuloT * o);
void cargarElipse(elipseT * e);
void cargarTriangulo(trianguloT * t);
void cargarCuadrado(cuadradoT * c);
void cargarRectangulo(rectanguloT * r);
void cargarFigura(figuraT * f);
float areaCirculo(circuloT o);
float areaElipse(elipseT e);
float areaTriangulo(trianguloT t);
float areaCuadrado(cuadradoT c);
float areaRectangulo(rectanguloT r);
float areaFigura(figuraT f);

int main()
{
    figuraT fig;
    unsigned i;
    printf("Cargar una figura?(si=1; no=0)\n");
    scanf("%u", &i);
    while(i!=0){
        cargarFigura(&fig);
        printf("area = %.2f\n", areaFigura(fig));
        printf("Cargar una figura?(si=1; no=0)\n");
        scanf("%d", &i);
    }
    return 0;
}

void cargarCirculo(circuloT * o){
    printf("radio: ");
    scanf("%f", &(o->radio));
}
void cargarElipse(elipseT * e){
    printf("radioMax: ");
    scanf("%f", &(e->radioMax));
    printf("radioMin: ");
    scanf("%f", &(e->radioMin));
}
void cargarTriangulo(trianguloT * t){
    printf("base: ");
    scanf("%f", &(t->lado1));
    printf("lado2: ");
    scanf("%f", &(t->lado2));
    printf("lado3: ");
    scanf("%f", &(t->lado3));
    int s = (t->lado1+t->lado2+t->lado3)/2;
    t->h = ((2/t->lado1)*sqrt(s*(s-t->lado1)*(s-t->lado2)*(s-t->lado3)));
}
void cargarCuadrado(cuadradoT * c){
    printf("lado: ");
    scanf("%f", &(c->lado));
}
void cargarRectangulo(rectanguloT * r){
    printf("ladoA: ");
    scanf("%f", &(r->ladoA));
    printf("ladoB: ");
    scanf("%f", &(r->ladoB));
}
void cargarFigura(figuraT * f){
    printf("Que figura quiere cargar?\n"
           "Circulo     (0)\n"
           "Elipse      (1)\n"
           "Triangulo   (2)\n"
           "Cuadrado    (3)\n"
           "Rectangulo  (4)\n");
    scanf("%d", &(f->tipo));
    switch (f->tipo){
    case CIRCULO : cargarCirculo(&f->datos.o); break;
    case ELIPSE : cargarElipse(&f->datos.e); break;
    case TRIANGULO :cargarTriangulo(&f->datos.t); break;
    case CUADRADO : cargarCuadrado(&f->datos.c); break;
    case RECTANGULO : cargarRectangulo(&f->datos.r); break;
    default : printf("NO ES UNA FORMA VALIDA\n"); break;
    }
}
float areaCirculo(circuloT o){
    return (o.radio*o.radio*M_PI);
}
float areaElipse(elipseT e){
    return (e.radioMax*e.radioMin*M_PI);
}
float areaTriangulo(trianguloT t){
    return ((t.lado1*t.h)/2);
}
float areaCuadrado(cuadradoT c){
    return (c.lado*c.lado);
}
float areaRectangulo(rectanguloT r){
    return (r.ladoA*r.ladoB);
}
float areaFigura(figuraT f){
    switch (f.tipo){
    case CIRCULO : return areaCirculo(f.datos.o); break;
    case ELIPSE : return areaElipse(f.datos.e); break;
    case TRIANGULO : return areaTriangulo(f.datos.t); break;
    case CUADRADO : return areaCuadrado(f.datos.c); break;
    case RECTANGULO : return areaRectangulo(f.datos.r); break;
    default : printf("NO ES UNA FORMA VALIDA\n"); return 0; break;
    }
}
