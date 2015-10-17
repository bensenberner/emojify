#!/bin/sh

# TODO: test to make sure that the image is the right size before cropping
WIDTH=$(identify -format "%w" 222rightsize.png)
HEIGHT=$(identify -format "%h" 222rightsize.png)

for ((i=0; i<$WIDTH; i=$(($i+15)))); do
    for ((j=0; j<$HEIGHT; j=$(($j+15)))); do
        convert 222rightsize.png -crop 15x15+$i+$j test/pic$i$j
    done
done
