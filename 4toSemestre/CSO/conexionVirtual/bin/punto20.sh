#!/bin/bash

pila=()

push(){
    if [ $# -eq 1 ]
    then
        pila[${#pila[*]}]=$1
    fi
}

pop(){
    local tam=$(expr ${#pila[*]} - 1)
    if [ $tam -ne 0 ]
    then
        num=${pila[$tam]}
        unset pila[$tam]
    fi
}

length(){
    num=${#pila[*]}
}

print(){
    echo ${pila[*]}
}


push 1
push 2
push hola
push 6
push .,.
push 96
push 5
push joaco
push 28
push lo

pop
echo "numero = $num"
pop
echo "numero = $num"
pop
echo "numero = $num"

length
echo "tamaño = $num"

print
