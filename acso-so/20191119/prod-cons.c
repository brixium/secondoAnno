/*
Problema: se t1.16 (fine=1) < t2.23 (while(fine==0)) il consumatore non entra nel ciclo e il carattere non viene più letto.
Si risolve aggiungendo 3 righe per la condizione finale
*/
#include <semaphore.h>
char buffer;
int fine = 0;
sem_t pieno, vuoto;
void scrivi(void * arg){
	int i;
	for(i=0; i<5; i++){
		sem_wait(&vuoto);
		buffer = 'a' + i;
		sem_post(&pieno);
	}
	fine=1;
	return NULL;
}

void leggi(void * arg){
	char miobuffer;
	int i;
	while(fine==0){
		sem_wait(&pieno);
		miobuffer=buffer;
		sem_post(&vuoto);
		printf("%.ls\n", &miobuffer);
	}
	/*QUI VANNO LE 3 RIGHEsem_getvalue*/
	return NULL;
}
int main(void){
	pthread_t tID1, tID2;
	sem_init(&pieno, 0, 0);
	sem_init(&vuoto, 0, 1);
	pthread_create(&tID1, NULL, &scrivi, NULL);
	pthread_create(&tID2, NULL, &leggi, NULL);
	pthread_join(tID1, NULL);
	pthread_join(tID2, NULL);
	printf("fine\n");
	return 0;
}
