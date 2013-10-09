#!/bin/bash

for file in `ls -R *.svg`
   do
      FILENAME=`basename $file .svg`
      EXTENSION=".png"
      echo "conversion svg->png de $file"
      inkscape --file="$file" --export-png=/home/martino/.icons/ALLBLACK/18x18/places/$FILENAME$EXTENSION --export-width=18
 done 
