#!/bin/bash
#Resumen de estructuras de control

let UNO=1
let DOS=2
let TRES=3
STRING="STRING"
STRING2="STRING"
STRING3="OTRO"
ARREGLO=(0 1 2)
ARREGLO2=(0 1 2)
ARREGLO3=(2 1 0)

if [ $# -lt 5 ]
then
	echo "Ingrese el numero 1: "
	read num
	echo -e "\nIngrese la palabra STRING: "
	read string
	echo -e "\nIngrese los numeros 0, 1 y 2: "
	read arreglo[0]
	read arreglo[1]
	read arreglo[2]
elif [ $# = 5 ]; then
	num=$1
	string=$2
	arreglo[0]=$3
	arreglo[1]=$4
	arreglo[2]=$5
	echo -e "$1 \n $2 \n $3 \t $4 \t $5 \n"
else
	exit 100
fi

echo -e "${num} \n ${string} \n ${arreglo[0]} \t ${arreglo[1]} \t ${arreglo[2]} \n"


#IF
if [ $num -eq 1 ]
then
	echo -e "\nEscribiste bien el uno!\n"
elif [ $string = $STRING ]
then
	echo -e "\nEscribiste bien STRING!\n"
else
	echo -e "\nEscribiste todo mal!!!\n"
fi

#SWITCH
case $num in
	${arreglo[0]})
		echo -e "el numero $num es igual al primer elemento!!\n"
	;;
	${arreglo[1]})
		echo -e "el numero $num es igual al segundo elemento!!\n"
	;;
	${arreglo[2]})
		echo -e "el numero $num es igual al tercer elemento!!\n"
	;;
	*)
		echo -e "¿no le pegaste a ninguno?\n"
	;;
esac

#MENU??
select variable in $UNO $DOS $TRES $STRING
do
	echo -e "Elegiste ${variable}?"
done

#FOR
for ((i=1; i <= ${arreglo[1]}; i++))
do
	echo -e "$i"
done

#FOREACH
for i in "UNO" "DOS" "TRES" "FIN"
do
	echo -e "$i"
done

#WHILE
while [ $num != 0 ]
do
	echo -e "Sigue el while? (0=NO): "
	read num
done

#UNTIL
until [ $num != 0 ]
do
	echo -e "Sigue el until? (0=SI): "
	read num
done
