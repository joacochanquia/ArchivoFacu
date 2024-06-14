#!/bin/bash

res=0

if [ ! -d $HOME/bin ]
then
	mkdir $HOME/bin
fi

for i in $(find $(pwd) -type f -name "*.sh")
do
	cp -a $i $HOME/bin/$(echo $i | cut -d'/' -f$(echo $i | cut -d'/' -f1-100 | wc -w))
	echo $i
	let res++
done

echo "se han movido $res programas"

