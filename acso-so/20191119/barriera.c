/*Codice eseguito da ogni thread per la parte di sincronizzazione con gli altri alla barriera*/
pthread_mutex_lock(&mutex);
count++;
pthread_mutex_unlock(&mutex);
if(count==T)
	sem_post(&barriera);	//con queste due istruzioni si può
sem_wait(&barriera);		//verificare un deadlock per T-1 thread
//modifica
pthread_mutex_lock(&mutex);
count++;
pthread_mutex_unlock(&mutex);
if(count==T)
	sem_post(&barriera);
else{
	sem_wait(&barriera);
	sem_post(&barriera);
}
//andrebbe tutto bene solo alla prima esecuzione, dopo il primo ciclo si sputtana* tutto
//*termine tecnico
//the little book of semaphores è un libro con dentro problemi che si possono risolvere con la programmazione concorrente
//il problema dei cinque filosofi con implementazione in C con 5 semafori. Nel libretto c'è anche il problema del barbiere
