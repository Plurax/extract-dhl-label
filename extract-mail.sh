#!/bin/sh



INPUTPDF=$1
NUMOFSTAMPS=$2
STAMPSPERROW=4
ORIGINX=275
ORIGINY=172
STAMPWIDTH=488
STAMPHEIGHT=403
echo $INPUTPDF
PICTUREFILENAME=PICTURE.jpg
LABELFILENAME=LABEL.jpg
STAMPFILENAME=STAMP.jpg
FINALELABEL=FINAL.jpg
TEMPDIR=~/temp


echo $PICTUREFILENAME

#exit 0

convert -density 310 -trim $INPUTPDF  -quality 100 -flatten -sharpen 0x1.0 $TEMPDIR/$PICTUREFILENAME

for i in $(seq 0 $NUMOFSTAMPS)
do
    X=$(expr $ORIGINX + $i % 4 \* $STAMPWIDTH)
    Y=$(expr $ORIGINY + $i / 4 \* $STAMPHEIGHT)
    echo $X
    echo $Y
    convert $TEMPDIR/$PICTUREFILENAME -crop ${STAMPWIDTH}x${STAMPHEIGHT}+${X}+${Y} $TEMPDIR/${i}_$STAMPFILENAME
done

