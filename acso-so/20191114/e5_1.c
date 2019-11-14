/*utilizzando somma, fare 3 thread che usano somma. sla seconda volta i thread posono essere eseguiti concorrentemente*/
#include <pthread.h>
#include <stdio.h>
int valore = 0;

void * somma(void * arg){
	int i;
	for(i=0; i<(int)arg; i++)
		valore++;
	printf("Thread: valore = %d\n", valore);
	return NULL;
}

int main(int argc, char * argv[]){
	pthread_t t1, t2, t3;
	pthread_create(&t1, NULL, somma, (void *)10);
	pthread_create(&t2, NULL, somma, (void *)20);
	pthread_create(&t3, NULL, somma, (void *)30);
	pthread_join(t1, NULL);
	pthread_join(t2, NULL);
	pthread_join(t3, NULL);
	printf("valore:%d\n", valore);
	return 0;
}
