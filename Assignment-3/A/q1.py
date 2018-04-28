#! /usr/bin/python

#import numpy as np
import sys

def lent(string):
 index=0
 try:

    while string[index]:
      index=index+1

 except:

    return index 

def convert (string,length):
   
   ind1=0
   place_value = {8:1000000000,7:100000000,6:10000000,5:100000, 4:10000, 3:1000, 2:100, 1:10, 0:1}
   face_value = {'0':0,'1':1,'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9}
   int_num=0
   while length!=-1:
     val=string[ind1]
     int_num=int_num+(place_value[length] * face_value[val])
     ind1+=1
     length-=1
   return int_num
  
num = sys.argv[1]
base = sys.argv[2]
count = lent(num)
f=0
ind = 0
minus=0
decimal=0
flag=0
dot=0
dotflag=0
dotplace=0
first=0

#print ord("A")+1


while count != 0:
 
  if num[0] == '-':
   if minus==0:
    minus=1
    count=count-1
    ind =ind+1
    continue
 
  if num[ind] != '0':
   
    if  dotflag == 0:
      numx = num[ind:]
      first=ind
    # print len(numx)
      dotflag = 1
     
    if num[ind] == '.':
      dotplace=ind-first
      f=1
    # print dotplace

  
   
  count=count-1
  ind=ind+1

base_int=convert(base,lent(base)-1)  
if base_int<2: 
 print "invalid input"    
 exit()               
if base_int>36:        
 print "invalid input"
 exit()



try:
 count = lent(numx)
 ind=0
 
except:
  print "0"
  exit()

if f==1 :
 count1=dotplace
else:
 count1=lent(numx)
count2=1

dict ={'0':0,'1':1,'2':2,'3':3,'4':4,'5':5,'6':6,'7':7,'8':8,'9':9,'A':10,
 'B':11, 'C':12, 'D':13, 'E':14, 'F':15, 'G':16,
 'H':17, 'I':18, 'J':19, 'K':20, 'L':21, 'M':22, 'N':23, 'O':24,
 'P':25, 'Q':26, 'R':27, 'S':28, 'T':29, 'U':30, 'V':31, 'W':32, 'X':33, 'Y':34, 'Z':35}
 #print dict[A]

try:

 while count != -1:
    
   if ind==lent(numx):           
    #decimal=decimal+dict[val]val=numx[ind]
    break 
   
   val=numx[ind]                    
   if val=='.':
    dot=1
    ind=ind+1
    count=count-1
    continue
   
   if dot==0:
    
   # print 11    
     
    if dict[val] > base_int-1:
     print "invalid input"
     flag=1
     break

    else :
     #print dict[val] 
     decimal=decimal+(base_int**(count1-1))*dict[val]
     #print decimal

    count1=count1-1 
    count=count-1
    ind=ind+1

   else:                                         
  #  print 12
                                                    
    if dict[val] > base_int-1:                         
     print "invalid input"
     flag=1                                          
     break
                                                     
    else :
    
     decimal=decimal+(base_int**(-count2))*dict[val]
    
    count2=count2+1
    count=count-1
    ind=ind+1
   
 if decimal<=999999999:
  if decimal>=-999999999:
   if flag==0:
    if minus==0:
     print decimal
    else :
     print "-%d" %(decimal)
 

 else:
  print "invalid input"
except:
  print "invalid input"
    



