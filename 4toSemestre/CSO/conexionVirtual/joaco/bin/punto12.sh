#!/bin/bash

if [ $# -ne 3 ]
then
	echo "Ingrese primer numero: "
	read num1
	read -p "Ingrese segundo numero: " num2
	echo "Seleccione una operacion: "
	select op in SUMAR RESTAR MULTIPLICAR DIVIDIR RESTO SALIR
	do
	case $op in
		"SUMAR")
			echo -e "$num1 + $num2 = $(expr $num1 + $num2)\n"
		;;
		"RESTAR")
			echo -e "$num1 - $num2 = $(expr $num1 - $num2)\n"
		;;
		"MULTIPLICAR")
			echo -e "$num1 * $num2 = $(expr $num1 \* $num2)\n"
		;;
		"DIVIDIR")
			echo -e "$num1 / $num2 = $(expr $num1 / $num2)\n"
		;;
		"RESTO")
			echo -e "$num1 % $num2 = $(expr $num1 % $num2)\n"
		;;
		"SALIR")
			exit 0
		;;
		*)
			echo -e "no selecciono una operacion valida\n"
			exit 1
		;;
	esac
	done
else
	case $2 in
		"+")
			echo -e "$1 + $3 = $(expr $1 + $3)\n"
		;;
		"-")
			echo -e "$1 - $3 = $(expr $1 - $3)\n"
		;;
		"*")
			echo -e "$1 * $3 = $(expr $1 \* $3)\n"
		;;
		"/")
			echo -e "$1 / $3 = $(expr $1 / $3)\n"
		;;
		"%")
			echo -e "$1 % $3 = $(expr $1 % $3)\n"
		;;
		*)
			echo -e "no selecciono una operacion valida\n"
			exit 1
		;;
	esac
fi
exit 0
