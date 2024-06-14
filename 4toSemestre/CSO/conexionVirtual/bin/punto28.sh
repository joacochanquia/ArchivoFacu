#!/bin/bash

if [ $# -ne 1 ]
then
    echo "No se recibio parametro"
    exit 1
fi
if [ ! -d $1 ]
then
    echo "El directorio no existe"
    exit 4
fi 
res=0
for i in $(ls $1)
do
    if [ -f $1/$i ] && [ -r $1/$i ] && [ -w $1/$i ]
    then
        echo "$1/$i"
        let res++
    fi
done
echo "El usuario tiene acceso a $res archivos"
