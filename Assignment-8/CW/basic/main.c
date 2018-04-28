#include<stdio.h>
#include"common.h"
main()
{
   printf("hello world in the universe of god\n");
   #ifdef DBG
   printf("bye world\n");
   #endif
}
