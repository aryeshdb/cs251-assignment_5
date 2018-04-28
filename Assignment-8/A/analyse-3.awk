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
  var1=0
  var2=0
  var3=0
  var4=0
  var5=0
  flag=0
  print "#Thread Thread-1 Thread-2 Thread-4 Thread-8 Thread-16" >> "bargraph.out"
}
{

 
  if($2 == 1)
{
  if(count1 == 99)
{
  td1=td1+$6
  var1=var1+(1/($6*$6))
  td1=td1/100
  var1=var1*(td1*td1)
  var1=var1/100
  var1=var1-1
  count1=0
  count2=count2+1
}
  else
{
  td1=td1+$6
  var1=var1+(1/($6*$6))
  count1=count1+1
}
}

    if($2 == 2)
  {                   
    if(count1 == 99)
  {
    td2=td2+$6
    var2=var2+(td1*td1)/($6*$6) 
    td2=td2/100
    td2=td1/td2
    var2=var2/100
    var2=var2-(td2*td2)
    count1=0
    count2=count2+1
  }
    else
 {
    td2=td2+$6
    var2=var2+(td1*td1)/($6*$6)
    count1=count1+1
 }
  }

    if($2 == 4)
  {
    if(count1 == 99)
  {
    td3=td3+$6
    var3=var3+(td1*td1)/($6*$6)
    td3=td3/100
    td3=td1/td3
    var3=var3/100
    var3=var3-(td3*td3)
    count1=0
    count2=count2+1
  }
    else
  {
    td3=td3+$6
    var3=var3+(td1*td1)/($6*$6)
    count1=count1+1
  }
  }

    if($2 == 8)
  {
    if(count1 == 99)
  {
    td4=td4+$6
    var4=var4+(td1*td1)/($6*$6)
    td4=td4/100
    td4=td1/td4
    var4=var4/100
    var4=var4-(td4*td4)
    count1=0
    count2=count2+1
  }
    else
   {
    td4=td4+$6
    var4=var4+(td1*td1)/($6*$6)
    count1=count1+1
   }
  }

     if($2 == 16)
   {
     if(count1 == 99)
   {
     td5=td5+$6
     var5=var5+(td1*td1)/($6*$6)
     td5=td5/100
     td5=td1/td5
     var5=var5/100
     var5=var5-(td5*td5)
     count1=0
     if(count2 == 4)
   {
     if(flag == 0) 
     {
       print $1" ""1"" "td2" "td3" "td4" "td5" "var1" "var2" "var3" "var4" "var5 >"bargraph.out"
       flag=1
     }
      
     else
     {
        print $1" ""1"" "td2" "td3" "td4" "td5" "var1" "var2" "var3" "var4" "var5 >>"bargraph.out"  
     }
     td1=0
     td2=0
     td3=0
     td4=0
     td5=0
     count2=0
     var1=0
     var2=0
     var3=0
     var4=0
     var5=0
     
   }
       
   }
     else
   {
     td5=td5+$6
     var5=var5+(td1*td1)/($6*$6)
     count1=count1+1
   }
         
   }

     
}

END{
}
