#!/bin/bash

count=1
mv phase2-10 phase2-010
mv phase2-11 phase2-011
mv phase2-12 phase2-012

while read line

do

	printf "$line :" > temp.txt
	awk '/:/||/^$/{next}{a[toupper($0)]++}END{for(i in a) print a[i],i}' phase2-0$count >> temp.txt

       #(cat $temp | tr '\r\n' ' ' )> temp.txt
	cat temp.txt >> tempo.txt

	((count++))
# printf $count

done < ./rashis.txt 


#awk '/:/||/^$/{next}{a[toupper($0)]++}END{for(i in a) print i,a[i]}' INPUT_FILE

mv phase2-010 phase2-10
mv phase2-011 phase2-11
mv phase2-012 phase2-12
