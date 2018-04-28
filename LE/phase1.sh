#!/bin/bash
file="phase1.txt"
if [ -f $file ] ; then
	rm $file
fi

while read line

do
	for i in {1..4}; do echo $line>> phase1.txt;done
done < ./nakshatras.txt 
