
int potencia(int x, int y){// – Eleva x a la y-ésima potencia.
    int i, res = 1;
    for (i=0; i<y; i++){
        res *= x;
    }
    return res;
}

int cuadrado(int x){// – Eleva x al cuadrado.
    return (x*x);
}

int cubo(int x){// – Eleva x al cubo.
    return (x*x*x);
}

int absoluto(int i){// – Retorna el valor absoluto entero de i.
    if (i<0){
        i = ~i+1;
    }
    return i;
}

int factorial (int i){// – Retorna el factorial de i.
    if ((i == 0)||(i == 1)){
        return 1;
    }
    if(i>1){
        return (factorial(i-1) * i);
    }
    else{
        return -1;
    }
}

int sumatoria (int i){// – Retorna la sumatoria de 0 hasta i.
    if(i>=0){
        int j, suma=0;
        for (j=1; j<=i; j++){
            suma += i;
        }
        return suma;
    }
    else{
        return -1;
    }
}

int multiplo (int x, int y){// – Retorna 1 si y es divisor de x, 0 en otro caso.
    if (y){
        return ((x % y) ? 0 : 1);
    }
    return 0;
}

int divisor (int x, int y){// – Retorna 1 si y es múltiplo de x, 0 en otro caso.
    if (x){
        return ((y % x) ? 0 : 1);
    }
    return 0;
}

int par (int i){// – Retorna 1 si i es par, 0 en otro caso.
    return ((i % 2) ? 0 : 1);
}

int impar (int i){// – Retorna 1 si i es impar, 0 en otro caso.
    return ((i % 2) ? 1 : 0);
}
