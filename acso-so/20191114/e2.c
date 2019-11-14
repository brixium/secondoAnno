#include <stdio.h>
#include <pthread.h>

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void * tf(void * tID){
	pthread_mutex_lock(&mutex);
	printf("I'm thread n.%d\n", (int) tID);
	printf("I'm thread n.%d\n", (int) tID);
	pthread_mutex_unlock(&mutex);
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
Criticità: questa volta le printf sono fatte bene ma il main e tf sono concorrenti, per cui non si sa se viene eseguita prima la seconda o la prima istanza di tf
*/

