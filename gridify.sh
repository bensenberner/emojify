#!/bin/sh

# TODO: test to make sure that the image is the right size before cropping
img="falcon.png"
WIDTH=$(identify -format "%w" $img)
HEIGHT=$(identify -format "%h" $img)

count=0
for ((i=0; i<$HEIGHT; i=$(($i+20)))); do
    for ((j=0; j<$WIDTH; j=$(($j+20)))); do
        ext=".png"
        num=`printf "%04d" $count`
        filename=test/pic$num$ext
        convert $img -crop 20x20+$j+$i $filename
        count=$(($count+1))
    done
done
