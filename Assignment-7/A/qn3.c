#include<stdio.h>
#include<stdlib.h>
#include<sys/time.h>
#include<string.h>
#include<pthread.h>
#include<math.h>


#define MAX_THREADS 64
#define USAGE_EXIT(s) do{ \
                             printf("Usage: %s <# of elements> <# of threads> \n %s\n", argv[0], s); \
                            exit(-1);\
                    }while(0);

#define TDIFF(start, end) ((end.tv_sec - start.tv_sec) * 1000000UL + (end.tv_usec - start.tv_usec))
int inc = 1;
int num,res;
pthread_mutex_t lock;
pthread_t threads[20];

struct num_array{
                    double num1;
                    double num2;
                    double result;
};

struct thread_param{
                       pthread_t tid;
                       struct num_array *array;
                       int size;
                       int skip;
                       int thread_ctr;
};

int xor(int x, int y)
{
  int ans = (x|y) & (~x|~y);
  return ans;
}

/*void function(struct num_array *a)
{
    double square = a->num1 * a->num1 +  a->num2 * a->num2  + 2 * a->num1 * a->num2;
    a->result = log(square)/sin(square);
    return;
}*/

int thread_func(void *arg, int num)
{
     int *pt1 = (int *) arg;
     printf("in");
    // int ctr = param->thread_ctr;
     int ctr;
     pthread_mutex_lock(&lock);
     if(inc==num) return pt1[0];

     for(ctr=0;ctr*inc<num;ctr+=2)
{
    pt1[ctr*inc] =  xor(pt1[ctr*inc],pt1[(ctr+1)*inc]);
}
     inc*=2;
     pthread_mutex_unlock(&lock);
     if(inc == 2) return thread_func(pt1, num);
     else return thread_func(pt1, num);     
          
     
}

int main(int argc, char **argv)
{
 // void *params;
  struct timeval start, end;
  int ctr, num_threads = 20, seed;
  int *pt;
  //char *a, *ptr;
  //struct num_array *pa;
  if(argc !=3)
           USAGE_EXIT("not enough parameters");

  pt = (int *)malloc(num*sizeof(int));
  num = atoi(argv[1]);
  seed = atoi(argv[2]);
  srand(seed);  

  for(ctr=0;ctr<num;ctr++)
{
  pt[ctr] = random();
  printf("%d\n",pt[ctr]);
}

  if(num <=0)
          USAGE_EXIT("invalid num elements");
  
  //num_threads = atoi(argv[2]);
  if(num_threads <=0 || num_threads > MAX_THREADS){
          USAGE_EXIT("invalid num of threads");
  }


  /* Parameters seems to be alright. Lets start our business*/

//  ptr= malloc(num * 3 * sizeof(double));
 // if(!ptr){
  //        USAGE_EXIT("invalid num elements, not enough memory");
 // }

/*  a = ptr;
  for(ctr=0; ctr<num; ++ctr){
       pa = (struct num_array *) a;
       pa->num1 = (double) ctr + (double) ctr * 0.1;
       pa->num2 = pa->num1 + 1.0;
       a += 3 * sizeof(double);
   }
*/

  /*Allocate thread specific parameters*/
  //params = malloc(num_threads * sizeof(struct thread_param));
  //bzero(params, num_threads * sizeof(struct thread_param));

  gettimeofday(&start, NULL);
  num = num/2;
  pthread_mutex_init(&lock,NULL);
  printf("1");
 

  /*Partion data and create threads*/      
  for(ctr=0; ctr < num_threads; ++ctr){
        /*struct thread_param *param = ((struct thread_param *)params) + ctr;
        param->size = num;
        param->skip = num_threads;
        param->array = (struct num_array *) ptr;
        param->thread_ctr = ctr;*/
        printf("in1"); 
       if(pthread_create(&threads[ctr], NULL, thread_func, (void *)pt) != 0){
              perror("pthread_create");
              exit(-1);
        }
 
  }
  
  /*Wait for threads to finish their execution*/      
 // for(ctr=0; ctr < num_threads; ++ctr){
   //     pthread_join(threads[ctr], NULL);
 // }
  
     
  //pa = (struct num_array *) (ptr + (num -1)*3*sizeof(double));
 // printf("num1=%f num2=%f result=%f\n", pa->num1, pa->num2, pa->result);
  gettimeofday(&end, NULL);
  printf("Time taken = %ld microsecs\n", TDIFF(start, end));

  //free(pt);
 // free(params);
printf("%d\n",res);
}
