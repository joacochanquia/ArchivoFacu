#!/bin/bash
for i in {1..100}; do
 while true; do
  if ! (($i % 25)); then
   echo "$i es divisible por 25"
   continue 2
  elif [ $i -eq 53 ]; then
   break 2
  elif [ "$i % $i" ]; then
   break
  fi
 done
done
