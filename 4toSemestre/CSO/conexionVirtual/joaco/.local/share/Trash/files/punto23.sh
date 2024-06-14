#!/bin/bash

num=(10 3 5 7 9 3 5 4)

contarImprimir(){
    res=0
    for i in ${num[*]}
    do
        if [ expr $(expr $i % 2) -eq 0 ]
        then
            echo $i
        else
            let res++
        fi
    done
}

contarImprimir

echo "cantidad de impares = $res"
