#!/bin/bash

for file in `ls -R *.svg`
   do
      FILENAME=`basename $file .svg`
      EXTENSION=".png"
      echo "conversion svg->png de $file"
      inkscape --file="$file" --export-png=/home/martino/.icons/ALLBLACK/scalable/places/$FILENAME$EXTENSION --export-width=128
 done 
