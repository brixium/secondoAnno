#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>
sem_t semaforo;
/*Adesso il codice non va più in stallo e il programma termina, grazie alla modifica effettuata in riga 18 con l'init del semaforo con 1 token, per cui solo uno alla volta può funzionare*/
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
	sem_init(&semaforo, 0, 1);
	pthread_create(&tID1, NULL, tf, (void *) 1);
	pthread_create(&tID2, NULL, tf, (void *) 2);
	pthread_join(tID1, NULL);
	pthread_join(tID2, NULL);
	return 0;
}
