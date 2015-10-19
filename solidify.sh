#!/bin/sh

img="result.png"
WIDTH=$(identify -format "%w" $img)
HEIGHT=$(identify -format "%h" $img)

count=0
for ((i=0; i<$HEIGHT; i=$(($i+20)))); do
    for ((j=0; j<$WIDTH; j=$(($j+20)))); do
        ext=".png"
        num=`printf "%04d" $count`
        filename=result/pic$num$ext
        composite -geometry +$j+$i $filename $img $img
        count=$(($count+1))
    done
done
