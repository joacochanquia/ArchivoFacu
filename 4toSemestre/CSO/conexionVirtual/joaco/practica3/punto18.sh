#!/bin/bash

if [ $# -ne 1 ]
then
	echo "cantidad equivocada de parametros"
	exit 1
fi

for i in $(cat /etc/passwd | cut -d: -f1)
do
	if [ $i = $1 ]
	then
		while true
		do
			let logueado=$(who | grep $1 | wc -l)
			echo "logueado = $logueado"
			if [ $logueado -ne 0 ]
			then
				echo "El usuario $1 se logueo"
				exit 0
			fi
			sleep 10
		done
	fi
done
echo "El usuario no existe"
exit 2
