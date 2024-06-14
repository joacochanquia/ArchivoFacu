#!/bin/bash

inicializar(){
    array=()
}

agregar_elem(){
    if [ $# -eq 1 ]
    then
        array[${#array[*]}]=$1
    else
        echo "No se recibio el parametro"
    fi
}

eliminar_elem(){
    local tam=${#array[*]}
    if [ $# -eq 1 ] && [ $1 -lt $tam ]
    then
        unset array[$1]
    else
        echo "No se recibio el parametro correcto"
    fi
}

longitud(){
    echo ${#array[*]}
}

imprimir(){
    echo ${array[*]}
}

inicializar_Con_Valores(){
    if [ $# -eq 2 ]
    then
        for((i=0 ; i < $1 ; i++))
        do
            array[$i]=$2
        done
    else
        echo "No se recibio la cantidad correcta de parametros"
    fi
}

SALIR(){
    exit 0
}

select OPCION in inicializar agregar_elem eliminar_elem longitud imprimir inicializar_Con_Valores SALIR
do
    case $OPCION in
        inicializar)
            inicializar
        ;;
        agregar_elem)
            echo "Ingrese elemento: "
            read param
            agregar_elem $param
        ;;
        eliminar_elem)
            echo "Ingrese posicion "
            read param
            eliminar_elem $param
        ;;
        longitud)
            longitud
        ;;
        imprimir)
            imprimir
        ;;
        inicializar_Con_Valores)
            echo "Ingrese tamano: "
            read param1
            echo "Ingrese elemento: "
            read param2
            inicializar_Con_Valores $param1 $param2
        ;;
        SALIR)
            exit 0
        ;;
        *)
            echo "opcion invalida"
        ;;
    esac
done
