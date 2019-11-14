/*utilizzando somma, fare 3 thread che usano somma. la prima volta assicurarsi che questi 3 non possano mia eseguire nulla in maniera concorrente*/
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
	pthread_create(&t1, NULL, somma, (void *)5);
	pthread_join(t1, NULL);
	return 0;
}
