#!/bin/bash

num=(10 3 5 7 9 3 5 4)

productoria(){
    res=1
    for i in ${num[*]}
    do
        res=$(expr $res \* $i)
    done
}

productoria

echo $res
