#!/bin/sh

# TODO: test to make sure that the image is the right size before cropping
img="test.png"
WIDTH=$(identify -format "%w" $img)
HEIGHT=$(identify -format "%h" $img)

for ((i=0; i<$WIDTH; i=$(($i+15)))); do
    for ((j=0; j<$HEIGHT; j=$(($j+15)))); do
        convert $img -crop 20x20+$i+$j test/pic$i$j
    done
done
