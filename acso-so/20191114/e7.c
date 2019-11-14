/*
Problema del produttore-consumatore 2. Problemi nel codice?
*/

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <time.h>

char carattere = '\x0';

void * th_fun1(void * arg){
	printf("Letto %c\n", carattere);
	return NULL;
}
void * th_fun2(void * arg){
	carattere = (rand(93
	return NULL;
}


int main(int argc, char * argv[]){
	
	return 0;
}
