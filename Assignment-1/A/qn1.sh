#!/bin/bash
read num

lent=${#num}
#echo $len

expr='^0$'

if  [[ $num =~ $expr ]];
then
echo "zero"
exit -1
fi

num=$(echo $num | sed 's/^0*//g')

if [ -z "$num" ] && [ $lent -le 11 ]; 
then
      echo "zero"
      exit -1
fi
exp='^[0-9]{1,11}$'

if ! [[ $num =~ $exp ]];
then 
   echo "invalid input"
   exit -1
fi

#echo ${num[0]}

#for i in "${#num[@]}"; do
#  echo ${num[i]}
#done
#

len=${#num}
# echo $len

n=$num
declare -a arr

for (( i=0; i<$len; i++ )) 
do
   arr[i]=$((n%10))
   n=$n/10
   n=${n%.*}
  # echo ${arr[i]}
done




for (( i=$len-1; i>=0; i--))
do
 # echo "$i" 
  if [ $i -eq 1 ] || [ $i -eq 4 ] || [ $i -eq 6 ] || [ $i -eq 8 ];
  then
    # echo "1"
    # echo "${arr[i]}"
    if [ ${arr[i]} -eq 1 ];
    then
       
       case "${arr[i-1]}" in
        0)
          echo -n "ten "
          ;;
         
        1)
          echo -n "eleven "
            ;;
         
        2)
          echo -n "twelve "
            ;;
        3)
          echo -n "thirteen "
            ;;
        4)
          echo -n "fourteen "
            ;;
        5)
          echo -n "fifteen "
            ;;
        6)
	  echo -n "sixteen "
            ;;
        7)
	  echo -n "seventeen "
            ;;
        8) 
          echo -n "eighteen "
            ;;
        9)
          echo -n "nineteen "
            ;;
        *)
            ;;
 
esac
i=$((i-1))
#echo $i

if [ $i -eq 0 ];
then
   echo -n $'\n'
   exit -1
fi

else
     case "${arr[i]}" in
        0)
          ;;
         
        1)
          ;;
         
        2)
          echo -n "twenty "
            ;;
        3)
          echo -n "thirty "
            ;;
        4)
          echo -n "forty "
            ;;
        5)
          echo -n "fifty "
            ;;
        6)
	  echo -n "sixty "
            ;;
        7)
	  echo -n "seventy "
            ;;
        8) 
          echo -n "eighty "
            ;;
        9)
          echo -n "ninety "
            ;;
        *)
            ;;
 
esac
fi

 else
    # echo "2"
     case "${arr[i]}" in
        0)
          ;;
         
        1)
          echo -n "one "
            ;;
         
        2)
          echo -n "two "
            ;;
        3)
          echo -n "three "
            ;;
        4)
          echo -n "four "
            ;;
        5)
          echo -n "five "
            ;;
        6)
	  echo -n "six "
            ;;
        7)
	  echo -n "seven "
            ;;
        8) 
          echo -n "eight "
            ;;
        9)
          echo -n "nine "
            ;;
        *)
            ;;

esac
if [ $i -eq 0 ];
then 
   echo -n $'\n' 
fi
fi


if ([ $i -eq 2 ] || [ $i -eq 9 ]) && [ ${arr[i]} -ne 0 ];
then 
  # echo "3"
   echo -n "hundred "
elif ([ $i -eq 3 ] || [ $i -eq 10 ]) && ([ ${arr[i]} -ne 0 ] || ([ ${arr[i]} -eq 0 ] && [ ${arr[i+1]} -ne 0 ]));
then 
  # echo "4"
   echo -n "thousand "
elif  [ $i -eq 5 ] && ([ ${arr[i]} -ne 0 ] || ([ ${arr[i]} -eq 0 ] && [ ${arr[i+1]} -ne 0 ]));
then
  # echo "5"
   echo -n "lakh "
elif  [ $i -eq 7 ] && ([ ${arr[i]} -ne 0 ] || ([ ${arr[i]} -eq 0 ] && [ ${arr[i+1]} -ne 0 ]));
then
  # echo "6"
   echo -n "crore "
fi
done
