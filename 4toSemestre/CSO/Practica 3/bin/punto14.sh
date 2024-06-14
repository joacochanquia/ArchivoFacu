#!/bin/bash

if [ $# -ne 3 ]
then
	echo "Cantidad equivocada de parametros"
	exit 1
fi
if [ ! -d $1 ]
then
	echo "El primer parametro no es un fichero existente"
	exit 2
fi
if [ -z $3 ]
then
	echo "El tercer parametro es vacio"
	exit 3
fi
archivos=$(find $1 -maxdepth 1 -type f)
#echo "$archivos"
cant=$(echo "$archivos" | wc -l)
#echo "$cant"
if [ $2 = -a ]
then
	for ((i=1 ; i <= $cant ; i++))
	do
		nombre=$(echo $archivos | cut -d' ' -f$i)
		fin=${nombre:$(expr index $nombre '.')}
		#fin=$(echo $nombre | cut -d'.' -f-1)
		nuevo=${nombre/%.*/$3.$fin}  #reemplazo el punto por $3.$fin
		#echo $nuevo
		mv $nombre $nuevo
	done
elif [ $2 = -b ]
then
	for ((i=1 ; i <= $cant ; i++))
        do
                nombre=$(echo $archivos | cut -d' ' -f$i)
		#echo "nombre = $nombre"
		#fin=$(echo $nombre | cut -d'/' -f-1)
                fin=$(echo ${nombre} |cut -d'/' -f1-$(echo $nombre | cut -d'/' --output-delimiter=' ' -f1-1000 | wc -w) --complement)
		#echo "fin = $fin"
		nuevo=$(echo ${nombre} |cut -d'/' -f1-$(echo $nombre | cut -d'/' --output-delimiter=' ' -f1-1000 | wc -w))\/$3$fin
                #echo "nuevo = $nuevo"
                mv $nombre $nuevo
        done
else
	echo "No se ingreso un modo valido"
fi
exit 0
