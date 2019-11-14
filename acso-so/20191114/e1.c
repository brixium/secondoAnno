#include <stdio.h>
#include <pthread.h>

void *tf(void *tID){
	printf("I'm thread n.%d\n", (int) tID);
	printf("I'm thread n.%d\n", (int) tID);
	return NULL;
}

int main(void){
	pthread_t tID1, tID2;
	pthread_create(&tID1, NULL, tf, (void *)1);
	pthread_create(&tID2, NULL, tf, (void *)2);
	pthread_join(tID1, NULL);
	pthread_join(tID2, NULL);
	return 0;
}

/*
Criticità: siccome non so se la printf è atomica può sparare fuori pezzi di cose a caso in contemporanea alle altre print. 
*/
