#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
int main(){
    int i,j,k,stato;
    pid_t pid1, pid2;
    i=10; j=20; k=30;
    pid1 = fork();
    if(pid1==0){
        j++; 
        pid2 = fork();
        if(pid2==0){
            k++; 
            exit(0);
        }else{
            wait(&stato);
            exit(0);
        }    
    }else{
        i++; 
        wait(&stato);
        exit(0);
    }    
}
