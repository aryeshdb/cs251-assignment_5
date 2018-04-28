#! /bin/bash
read_file()
{ 
  i=3
 if [[ "$1" == "<name>" ]]; then 
  str=""
 fi
 # echo $1 
  #local IFS=\>
  #read -d "<" Keyi Valuei
if [[ "$2" ]]; then
   # echo "iii"
    if [[ "$dir_flag" -eq 1  ]]; then
       str=$2
       #echo "1"
       #echo ${!i}
       while [ ${!i} != "</name>" ] 
       do
       #echo ${!i}
       str=$str\ ${!i}
       #echo $str
       i=$((i+1))
       done
       mkdir "${str}"
       cd "${str}"
       
       #if [[ "$3" != "</name>" ]]; then
        # mkdir $2\ $3
        # cd $2\ $3
      # else
       #  mkdir $2
        # cd $2
      # fi 
     
 
    elif [[ "$file_flag" -eq 1 ]]; then
        
      if [[ "$1" == "<name>" ]]; then
       str="$2"
        while [ "${!i}" != "</name>" ]
        do
        str=$str\ ${!i}
        i=$((i+1))
        done 
        #echo "${str}"      
  
      elif [[ "$1" == "<size>" ]]; then
          Size=$2
          #if [[ "$3" != "</name>" ]]; then
          # fallocate -l $Size  $2\ $3
         # else
          # fallocate -l $Size $2
         # fi
         #echo ${str}
         fallocate -l $Size "${str}"
      fi    
    fi          
           
       
     
 
else
    if [[ $1 == "<dir>" ]]; then
    # echo "2"
      dir_flag=1
      file_flag=0
      dir=$((dir+1))
    elif [[ $1 == "<file>" ]]; then
      dir_flag=0
      file_flag=1
           
    elif [[ $1 ==  "</dir>" ]]; then
      dir=$((dir-1)) 
      cd ..
    fi
fi
 
  
}

sed -i -e 's/</ </g' $1
sed -i -e 's/>/> /g' $1
dir_flag=0
file_flag=0
dir=0
#echo "inside"
readarray -t lines < "$1"

#echo "put"
for line in "${lines[@]}"; do
   read_file $line
 #  echo $line 
done
sed -i -e 's/ </</g' $1
sed -i -e 's/> />/g' $1

