#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>
#include<pthread.h>
#include<sys/types.h>
#include<unistd.h>
#include<string.h>

#define Len 10000

int ind=0;
int trans,tds;
pthread_mutex_t locka,lockb,lockac[11001];
static char *dataptr;
static unsigned long *optr;

struct act
{
  int actno;
  float bal;
};

struct val
{
  int *type;
  float *amount;
  int *ac1;
  int *ac2;
  struct act* ptr;
};

struct act* ar1;
void cal(void *val3)
{
  struct val *val2=(struct val*)val3;
  // printf("in");  
   while(1){
     //  printf("%d",trans);
	if(ind>=trans)
        { break; }
	pthread_mutex_lock(&lockb);
        pthread_mutex_lock(&lockac[(val2->ac1)[ind]]);
      	if ((val2->type)[ind]==4){
	pthread_mutex_lock(&lockac[(val2->ac2)[ind]]);
	}	
        pthread_mutex_unlock(&lockb);
	ar1=val2->ptr;
       
   switch((val2->type)[ind])
	{
	case 1: 
       ar1[(val2->ac1)[ind]-1001].bal=ar1[(val2->ac1)[ind]-1001].bal+0.99*(val2->amount)[ind];
      break;
	case 2:  
          ar1[(val2->ac1)[ind]-1001].bal=ar1[(val2->ac1)[ind]-1001].bal-1.01*(val2->amount)[ind];
        break;	
        case 3:  
          ar1[(val2->ac1)[ind]-1001].bal=1.071*ar1[(val2->ac1)[ind]-1001].bal;
          break;
        case 4:  
          ar1[(val2->ac1)[ind]-1001].bal=ar1[(val2->ac1)[ind]-1001].bal-1.01*(val2->amount)[ind];
          ar1[(val2->ac2)[ind]-1001].bal=ar1[(val2->ac2)[ind]-1001].bal+0.99*(val2->amount)[ind];
          pthread_mutex_unlock(&lockac[(val2->ac2)[ind]]);
          break;
        default: break;
         } ind++;
          pthread_mutex_unlock(&lockac[(val2->ac1)[ind]]);
//          ind = ind+1; 
}	
   pthread_exit(NULL);
}
int main(int argc, char **argv)
{
     int fd1, ctr,start=0,count,n,end,i,j;
     FILE *fd2;
     unsigned long size, bytes_read = 0;
     char *buff, *cbuff;
     struct act arr[10000];
     
     //printf("%d\n",argc);
    
     if(argc != 5){
            printf("Usage: %s <account_file> <transaction_file> <no of transactions> <no of threads>\n", argv[0]);
            exit(-1);        
      }  
      
     trans = atoi(argv[3]);
     //printf("%d",trans);
     tds = atoi(argv[4]);  
     pthread_t threads[tds];
     char temp[trans][100];
     int t[trans];
     int a1[trans];
     int a2[trans];
     float a[trans]; 
      
     fd1 = open(argv[2], O_RDONLY);
     fd2 = fopen(argv[1],"r");
 
     for(int i=0;i<Len;i++)
{
     fscanf(fd2,"%d %f",(&arr[i].actno),(&arr[i].bal));
     //printf("%d %f\n",*(&arr[i].actno),*(&arr[i].bal));
  
}
    
     if(fd1 < 0){
           printf("Can not open transactions file\n");
           exit(-1);
     }
     
     if(fd2 < 0){
           printf("Can not open accounts file\n");
           exit(-1);
     }
      
    
    size = lseek(fd1, 0, SEEK_END);
    if(size <= 0){
           perror("lseek");
           exit(-1);
    }
    
    if(lseek(fd1, 0, SEEK_SET) != 0){
           perror("lseek");
           exit(-1);
    }
   
    buff = malloc(size);
    if(!buff){
           perror("mem");
           exit(-1);
    }   
   /*Read the complete file into buff
     XXX Better implemented using mmap */
   
    do{
         unsigned long bytes;
         cbuff = buff + bytes_read;
         bytes = read(fd1, cbuff, size - bytes_read);
         if(bytes < 0){
             perror("read");
             exit(-1);
         }
        bytes_read += bytes;
     }while(size != bytes_read);
 
     cbuff = buff + size;
     
     	for(i=0;i<trans;i++)
      {     end=0;
        for(j=1;j<size;j++)
      {
	if(buff[start+j]=='\n')
	{
	   end=j;
	   break;
	}
       }
		strncpy(temp[i],buff+start,j);
		start=start+end;
		
       }

      for (ctr = 0; ctr < 11001; ctr++) {
		pthread_mutex_init(&lockac[ctr],NULL);
	}
	pthread_mutex_init(&locka,NULL);
	pthread_mutex_init(&lockb,NULL);

     for(ctr=0; ctr < trans; ++ctr){
       sscanf(temp[ctr],"%d %d %f %d %d",&n,&t[ctr],&a[ctr],&a1[ctr],&a2[ctr]);
      }
     struct val val1;
     val1.type = t;
     val1.amount = a;
     val1.ac1 = a1;
     val1.ac2 = a2;
     val1.ptr = arr;	
   
     for(ctr=0; ctr < tds; ++ctr){
        if(pthread_create(&threads[ctr], NULL, cal, &val1) != 0){
              perror("pthread_create");
              exit(-1);
        }
 
     }
     
     for(ctr=0; ctr < tds; ++ctr)
          pthread_join(&threads[ctr], NULL);
      
     printf("A/C No\t Balance\n");
     printf("------\t -------\n");
     
     for(ctr=0;ctr<10000;ctr++){
       printf("%d\t%.2f\n",arr[ctr].actno,arr[ctr].bal);
	}
    //if(flag==1) printf("in");
   //  for(ctr=0; ctr < hash_count; ++ctr)
   //        printf("block# %d hash %lx\n", ctr, hashes[ctr]);  
     
     free(buff);
     close(fd1);
     close(fd2);
     return 0;

}

