#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Cantidad equivocada de parametros"
	exit 1
fi
if [ -z $1 ]
then
	echo "El parametro esta vacio"
	exit 2
fi
if [ ! -d $HOME/resultados ]
then
	mkdir $HOME/resultados
fi
echo -e "$(date)\t$1" >> $HOME/resultados/reporte.txt
for i in $(cat /etc/passwd | cut -d' ' --output-delimiter='_' -f1-100)
do
	#echo "i = $i"
	let uid=$(echo $i | cut -d: -f3)
	#echo $uid
	if [ $uid -ge 1000 ]
	then
		user=$(echo $i | cut -d: -f1) #usuario
		princ=$(echo $i | cut -d: -f6) #directorio principal de usuario
		if [ -d $princ ] && [ -r $princ ]
		then
			cant=$(find $princ -type f -perm -444 -name "*.$1" | wc -l)
			echo -e "$user\t\t$cant" >> $HOME/resultados/reporte.txt
		fi
	fi
done
echo -e "\n" >> $HOME/resultados/reporte.txt
exit 0
