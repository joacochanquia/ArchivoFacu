#!/bin/bash

if [ $# -lt 1 ]
then
    echo "No se recibieron parametros"
    exit 1
fi

res=0
arreglo=($*)

for ((i=0 ; i < $# ; i+=2))
do
    #echo ${arreglo[$i]}
    if [ -d ${arreglo[$i]} ]
    then
        echo "${arreglo[$i]} es un directorio"
    elif [ -f ${arreglo[$i]} ]
    then
        echo "${arreglo[$i]} es un archivo"
    else
        let res++
    fi
done

echo "Hay $res archivos inexistentes"
