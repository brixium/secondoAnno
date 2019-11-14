#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

void *tf(void *tID){
	while(1)
		;
	return NULL;
}
int main(int argc, char * argv[]){
	pthread_t tID;
    pthread_create(&tID, NULL, tf, (void *)1);
	return 0;
}
