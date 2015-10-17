#!/bin/sh

# TODO: test to make sure that the image is the right size before cropping
WIDTH=$(identify -format "%w" test.png)
HEIGHT=$(identify -format "%h" test.png)

#EXTRAWIDTH=$(expr 15 % $WIDTH)
#EXTRAHEIGHT=$(expr 15 % $HEIGHT)
#echo $EXTRAWIDTH
#for ((i=0; i<$WIDTH; i=$(($i+15)))); do
    #for ((j=0; j<$HEIGHT; j=$(($j+15)))); do
        #convert 222rightsize.png -crop 15x15+$i+$j test/pic$i$j
    #done
#done
