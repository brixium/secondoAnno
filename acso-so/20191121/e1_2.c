#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>
sem_t semaforo;
/*Adesso metto 2 token nel cestello. È come se il semaforo non ci fosse perché partono tutti e due i thread uno a poca distanza dall'altro. Stavolta il tempo di esecuzione è >=5 secondi */
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
	sem_init(&semaforo, 0, 2);
	pthread_create(&tID1, NULL, tf, (void *) 1);
	pthread_create(&tID2, NULL, tf, (void *) 2);
	pthread_join(tID1, NULL);
	pthread_join(tID2, NULL);
	return 0;
}
