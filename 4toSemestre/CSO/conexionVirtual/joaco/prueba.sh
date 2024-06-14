#!/bin/bash

if [ "hola" = "HOLA" ]
then
    echo "Hola"
else
    echo "Chau"
fi

for i in `seq 1 100`; do echo "$i"; done

if [ "hola" == "hola" ]
then 
echo "es un directorio"
fi

arreglo=()

arreglo+=5

echo ${arreglo[1]}

for i; do
echo $i
break
done

