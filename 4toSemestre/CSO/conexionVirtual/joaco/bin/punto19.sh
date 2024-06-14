#!/bin/bash

calculadora(){
    /home/joaco/practica3/punto12.sh
}
verCuadrados(){
    /home/joaco/practica3/punto13a.sh
}
menu13(){
    /home/joaco/practica3/punto13b.sh
}
crearFichero(){
    echo "Ingrese un archivo: "
    read archivo
    /home/joaco/practica3/punto13c.sh $archivo
}
renombrar(){
    echo "Ingrese un archivo: "
    read archivo
    echo "Que cadena quiere agregar?"
    read cadena
    echo "Agregar al inicio (-b) o al final (-a)?"
    read donde
    /home/joaco/practica3/punto14.sh $archivo $donde $cadena
}
cantidadArchivos(){
    echo "Ingrese una extension de archivo: "
    read archivo
    /home/joaco/practica3/punto16.sh $archivo
}
imprimirRaro(){
    /home/joaco/practica3/punto17.sh $archivo
}
usuarioLogueado(){
    echo "Ingrese un usuario: "
    read usuario
    /home/joaco/practica3/punto18.sh $usuario
}
SALIR(){
    exit 0
}
select OPCION in calculadora verCuadrados menu13 crearFichero renombrar cantidadArchivos imprimirRaro usuarioLogueado SALIR
do
    if [ $OPCION ]
    then
        $OPCION
    fi
done
