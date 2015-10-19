#!/bin/sh

# TODO: test to make sure that the image is the right size before cropping
img="falcon.png"
WIDTH=$(identify -format "%w" $img)
HEIGHT=$(identify -format "%h" $img)

count=0
for ((i=0; i<$WIDTH; i=$(($i+15)))); do
    for ((j=0; j<$HEIGHT; j=$(($j+15)))); do
        ext=".png"
        filename=test/pic$count$ext
        convert $img -crop 20x20+$j+$i $filename
        count=$(($count+1))
    done
done
