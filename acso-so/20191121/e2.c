/*
BEVUTA.C
Questa implementazione fa schifo, utilizza il coidice su beep

Sei amici fanno una scommessa, il premio per il vincitore è fare bere uno a caso degli amici (thread).
Chi vince la scommessa lancia un dado per decidere a chi tocca bere mentre gli altri aspettano.
Alla fine viene proposta un'altra scommessa e il gioco va avanti all'infinito
##variante: dopo 15 bevute un amico sviene e non può più partecipare. Si va avanti ad oltranza finché non ne rimarrà soltanto uno.
Cosa ci serve? 6 thread + main + thread scommessa/vittoria, il dado
I thread devono poter bere oppure, se sono vincitori della scommessa, possono tirare il dado
*/
#include <stdio.h> 
#include <stdlib.h> 
#include <time.h> 

#define N_AMICI 6

int bevi = 0;
sem_t azione_disponibile[N_AMICI];
sem_t azioni_temrinate;

void * amico(void * arg){
	int my_id = (int)arg, scelta;
	while(1){
		sem_wait(&azione_disponibile[my_id]);
		if(bevi){
			printf("Sono l'amico n. e sto bevendo!\n");
			bevi = 0;
			sem_post(&azione_compiuta);
		}else{
			scelta = rand() % N_AMICI;
			printf("Lancio!\n");
			bevi = 1;
			sem_post(&azione_disponibile[scelta]);
		}
	}
}

void * scommessa(void * arg){
	int v;
	while(1){
		printf("Inizia una nuova scommessa\n");
		v = rand()%6;
		/*Noi vogliamo che solo il vincitore possa prendere la fiche*/
		sem_post(&azione_disponibile[v]);
	}
}

int main(int argc, char * argv[]){
	pthread_t tID[N_AMICI], scommessaID;
	for(int i=0; i<N_AMICI; i++)
		sem_init(&azione_disponibile[i], 0, 1);
	sem_init(&azioni_terminate, 0, 1);
	for(int i=0; i<N_AMICI; i++)
		pthread_create(&tID[i], NULL, tf, (void *) 6);
	pthread_join(a1, NULL);
	pthread_join(a2, NULL);
	pthread_join(a3, NULL);
	pthread_join(a4, NULL);
	pthread_join(a5, NULL);
	pthread_join(a6, NULL);
	return 0;
}
