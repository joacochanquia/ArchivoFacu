#!/bin/bash

for ((i=1;i<=100;i++))
do
	echo -e "$i\t$(expr $i \* $i)"
done
