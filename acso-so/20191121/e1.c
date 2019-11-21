#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>
sem_t semaforo;
/*Questo codice crea uno stallo/deadlock perché crea due thread che attendono un semaforo che non fa mai scattare il verde. Tempo di esecuzione infinito. Questo perché in riga 18 ci sono 0 token che dà ai thread*/
void *tf(void *tID){
	sem_wait(&semaforo);
	printf("Sono thread n.%d\n", (int)tID);
	sleep(5);
	printf("Sono thread n.%d\n", (int)tID);
	sem_post(&semaforo);
	return NULL;
}

int main(void){
	pthread_t tID1, tID2;
	sem_init(&semaforo, 0, 0);
	pthread_create(&tID1, NULL, tf, (void *) 1);
	pthread_create(&tID2, NULL, tf, (void *) 2);
	pthread_join(tID1, NULL);
	pthread_join(tID2, NULL);
	return 0;
}
