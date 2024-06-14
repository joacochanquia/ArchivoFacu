#!/bin/bash

for i in $(ls)
do
	echo $(echo $i | tr -d 'aA' | tr '[:upper:][:lower:]' '[:lower:][:upper:]')
done

exit 0
