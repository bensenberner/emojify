#!/bin/sh

img="test.png"
WIDTH=$(identify -format "%w" $img)
HEIGHT=$(identify -format "%h" $img)
EXTRAWIDTH=$(expr $WIDTH % 15)
EXTRAHEIGHT=$(expr $HEIGHT % 15)
WIDTH=$(($WIDTH-$EXTRAWIDTH))
HEIGHT=$(($HEIGHT-$EXTRAHEIGHT))

convert $img -resize "$WIDTH"x"$HEIGHT" $img
