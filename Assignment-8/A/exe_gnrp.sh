#!/bin/bash
num=100;

$(> log.txt)

while read p;
do 
file1=$p
par_n=$(echo $file1 | wc -w)
#echo $par_n
par=($file1)
#echo ${par[0]}
done<"$1"

while read q;
do
file2=$q
td_n=$(echo $file2 | wc -w)
td=($file2)
done<"$2"

for i in "${par[@]}" 
do
  for j in "${td[@]}"
  do
    for (( k=0 ; k<num ; k++ )) 
    do
      #echo $((i))
      #echo $((j))
      val=$(./App $((i)) $((j)))
       
      echo $i $j $val>>"log.txt"
    done 
  done
done
 


 
