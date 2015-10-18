#!/bin/sh

# TODO: test to make sure that the image is the right size before cropping
#IMGS='160x160/*'
cd '160x160'
for img in *
do
    convert $img -resize 20x20 ../20x20/$img
done
