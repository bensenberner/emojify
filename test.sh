#!/bin/sh

count=0

for ((i=0; i<4; i=$(($i+1)))); do
    for ((j=0; j<5; j=$(($j+1)))); do
        count=$(($count+1))
    done
done

echo $count
