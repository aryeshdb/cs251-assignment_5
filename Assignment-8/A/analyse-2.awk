#!/usr/bin/awk
BEGIN{
   #system("test -f lineplt.out") ? system("rm lineplt.out") : system(">" "empty" "lineplt.out")
  count1=0
  count2=0
  td1=0
  td2=0
  td3=0
  td4=0
  td5=0
}
{

 
  if($2 == 1)
{
  if(count1 == 99)
{
  td1=td1+$6
  td1=td1/100
  count1=0
  count2=count2+1
}
  else
{
  td1=td1+$6
  count1=count1+1
}
}

    if($2 == 2)
  {                   
    if(count1 == 99)
  {
    td2=td2+$6
    td2=td2/100
    count1=0
    count2=count2+1
  }
    else
 {
    td2=td2+$6
    count1=count1+1
 }
  }

    if($2 == 4)
  {
    if(count1 == 99)
  {
    td3=td3+$6
    td3=td3/100
    count1=0
    count2=count2+1
  }
    else
  {
    td3=td3+$6
    count1=count1+1
  }
  }

    if($2 == 8)
  {
    if(count1 == 99)
  {
    td4=td4+$6
    td4=td4/100
    count1=0
    count2=count2+1
  }
    else
   {
    td4=td4+$6
    count1=count1+1
   }
  }

     if($2 == 16)
   {
     if(count1 == 99)
   {
     td5=td5+$6
     td5=td5/100
     count1=0
     if(count2 == 4)
   {
     
     print $1" "td1" "td2" "td3" "td4" "td5 >>"lineplt.out"
     td1=0
     td2=0
     td3=0
     td4=0
     td5=0
     count2=0
     
   }
       
   }
     else
   {
     td5=td5+$6
     count1=count1+1
   }
         
   }

     
}

END{
}
