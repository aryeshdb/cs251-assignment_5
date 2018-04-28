#!/usr/bin/awk
BEGIN{ #if(-f "td-1.out") system("rm td-1.out")
       #if(-f "td-2.out") system("rm td-2.out")
       #if(-f "td-3.out") system("rm td-3.out")
       #if(-f "td-4.out") system("rm td-4.out")
       #if(-f "td-5.out") system("rm td-5.out")
}
{
 if($2 == 1) 
 {
   print $1" "$6 >>"td-1.out"
 }
 else if($2 == 2)
 {
   print $1" "$6 >>"td-2.out"
 }
 else if($2 == 4)
 {
   print $1" "$6 >>"td-3.out"
 }
 else if($2 == 8)
 {
   print $1" "$6 >>"td-4.out"
 }
 else if($2 == 16)
 {
   print $1" "$6 >>"td-5.out"
 }

}
END{
}
