#!/bin/bash

arreglo=()

verArchivo(){
    if [ $# -ne 1 ]
    then
        echo "Numero de parametros incorrecto"
        exit 1
    fi
    encontrado=0
    for((i=0; i < ${#arreglo[*]} ;i++))
    do
        if [ $1 = ${arreglo[$i]} ]
        then
            cat $1
            encontrado=1
        fi
    done
    if [ $encontrado = 0 ]
    then
        echo "Archivo no encontrado"
        exit 5
    fi
}

cantidadArchivos(){
    echo "Hay ${#arreglo[*]} archivos con terminacion .doc"
}

borrarArchivo(){
    if [ $# -ne 1 ]
    then
        echo "Numero de parametros incorrecto"
        exit 1
    fi
    encontrado=0
    for((i=0; i < ${#arreglo[*]} ;i++))
    do
        if [ $1 = ${arreglo[$i]} ]
        then
            encontrado=1
            echo "Eliminar logicamente?"
            read opcion
            if [ $opcion = 'Si' ]
            then
                unset arreglo[$i]
            elif [ $opcion = 'No' ]
            then
                rm ${arreglo[$i]}
                unset arreglo[$i]
            else
                echo "No es una opcion correcta"
                exit 2
            fi
        fi
    done
    if [ $encontrado = 0 ]
    then
        echo "Archivo no encontrado"
        exit 10
    fi
}

for i in $(find $HOME -type f -name "*.doc")
do
    arreglo[${#arreglo[*]}]=$i
done

cantidadArchivos
echo "Archivo a ver: "
read archivo
while [ $archivo != 'FIN' ]
do
    verArchivo $archivo
    echo "Archivo a ver: "
    read archivo
done

cantidadArchivos
echo "Archivo a eliminar: "
read archivo
while [ $archivo != 'FIN' ]
do
    borrarArchivo $archivo
    cantidadArchivos
    echo "Archivo a eliminar: "
    read archivo
done





