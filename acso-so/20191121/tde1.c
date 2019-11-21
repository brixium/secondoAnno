/*
Questo è il primo esercizio del tema d'esame sulla seconda parte
Richieste: 
	1) completare la tabella indicando lo stato di esistenza del thread (Esiste, non esiste, boh?)
	2) indicare valori delle variabili globali ad un certo punto del sistema
	3) riconoscere ed indentificare i deadlock
*/

pthread_mutex_t root;
sem_t stem, leaf;
int global = 0;

void * seed(void * arg){
	sem_wait(&stem);
	mutex_lock(&root);
	sem_wait(&leaf);
	mutex_unlock(&root);	/*A*/
	global = 1;
	sem_post (&stem);		/*B*/
	return (void * 2);
}

void * fruit(void * arg){
	mutex_lock(&root);
	sem_post(&leaf);
	global = 3;				/*C*/
	sem_wait(&stem);
	mutex_unlock(&root);
	sem_post(&stem);
	return NULL;
}

void main(){
	pthread_t th_1, th_2;
	sem_init(&stem, 0, 1);
	sem_init(&leaf, 0, 0);
	create(&th_1, NULL, seed, NULL);
	create(&th_2, NULL, leaf, NULL);
	join(th_1, &global);	/*D*/
	join(th_2, NULL);
	return;
}


/**	TABELLA 1
	threads:
	th1-seed	|	th2-fruit |
------------------------------|
A| esiste       | potrebbe es.|
B| esiste       | potrebbe es.|
C| esiste       | esiste      |
D| non esiste   | potrebbe es.|
-------------------------------

Caso esecuzione 1: parte il main, avvia il primo thread e arriva fino alla seconda istruzione di see e si blocca. Torna il main, secondo thread, cerca di bloccare la risorsa bloccata. DEADLOCK.
Caso esecuzione 2: main->th_1 esegue la prima istruzione e aspetta stem. Il main fa partire th_2. Il processore manda in esecuzione th_2 e blocca lui root. Il thread 2 allora fa la post su leaf, che adessa ha 1 fiche. Va avanti il 2 perché l'1 e il main è bloccato. Esegue C e all'istruzione dopo va in DEADLOCK.
Caso esecuzione 3: main fa partire il thread 1 e 2 e va in attesa sulla join. Il th2 esegue 2 istruzioni (1 fiche a leaf) e mette global = 3 (esegue C). Parte il thread 1 ed esegue solo la prima istruzione che lo manda in attesa di stem. Va avanti il th2 che va a sbloccare root così il th1 può proseguire. Il thread 1 arriva fino alla istruzione A e finisce di eseguirla

TABELLA 2:
	variabili globali
|-----------------------------|
| |  stem  |  leaf  |  global |
|-|--------|--------|---------|
|A|   0    |    0   |    3    |
|B|   1    |    0   |    1    |
|C|  0/1   |    1   |    3    |
|D|   1    |    0   |    2    |
|------------------------------

TABELLA 3: deadlock
|caso   |th_1-seed |th_2-fruit| global     |
--------------------------------------------
|  1    |m_lck(root|wait(stem)|     3      |
|  2    |w8(leaf)  |lck(root) |     0      |
-----------------------------------------------
**/

