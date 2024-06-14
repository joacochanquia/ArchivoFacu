#!/bin/bash

if [ $# != 1 ]
then
	exit 1
else
	if [ -d $1 ]
	then
		echo -e "Es un directorio\n"
	elif [ -f $1 ]
	then
		echo -e "Es un archivo\n"
	else
		touch $1
	fi
fi
exit 0
