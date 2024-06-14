#!/bin/bash

arreglo=()

elem(){
    if [ $1 -le ${#arreglo[*]} ] && [ $1 -ge 0 ]
    then
        echo "El usuario numero $1 es ${arreglo[$1]}"
    else
        echo "No hay tantos usuarios en users"
        exit 1
    fi
}

length(){
    echo "\"users\" tiene ${#arreglo[*]} miembros"
}

print(){
    echo -e "Usuarios en \"users\": \n${arreglo[*]}"
}

for usuario in $(cat /etc/passwd | cut -d: -f1)
do
    for grupo in $(groups $usuario)
    do
        if [ $grupo = "users" ]
        then
            arreglo[${#arreglo[*]}]=$usuario
        fi
    done
done

if [ $# -ne 0 ]
then
    case $1 in
        '-b')
            if [ $# -eq 2 ]
            then
                elem $2
            else
                echo "Debe pasar la posicion del elemento"
                exit 3
            fi
        ;;
        '-l')
            length
        ;;
        '-i')
            print
        ;;
        *)
            echo "parametro desconocido"
            exit 2
        ;;
    esac
fi


