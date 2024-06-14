#!/bin/bash

select i in "Listar" "DondeEstoy" "QuienEsta"
do
case $i in
	"Listar")
		ls
	;;
	"DondeEstoy")
		pwd
	;;
	"QuienEsta")
		who
	;;
	*)
		echo "Eleccion invalida"
		exit 1
	;;
esac
done
exit 0

