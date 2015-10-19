#!/bin/sh

cd '20x20'
for img in *
do
    convert $img -background white -alpha remove $img
done
