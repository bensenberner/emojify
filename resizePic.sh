#!/bin/sh

img="falcon.png"
WIDTH=$(identify -format "%w" $img)
HEIGHT=$(identify -format "%h" $img)
EXTRAWIDTH=$(expr $WIDTH % 20)
EXTRAHEIGHT=$(expr $HEIGHT % 20)
WIDTH=$(($WIDTH-$EXTRAWIDTH))
HEIGHT=$(($HEIGHT-$EXTRAHEIGHT))

convert $img -resize "$WIDTH"x"$HEIGHT" $img
