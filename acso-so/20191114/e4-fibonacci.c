/*
Scrivere un programma che calcoli l'N-esimo numero di Fibonacci usando i pthread. In particolare si ricorda che l'ennesimo numero di Fibonacci può essere calcolato come la somma dei due numeri di FIbonacci precedenti
fib(n) = fib(n-1) + (fib(n-2)

Quindi un thread andrà a calcolare fib(n-1) e l'altro fib(n-2)
Prima facciamo le funzioni ricorsive
*/

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

int fibonacci_ricorsiva(int n){
	if(n<=0)
		return 0;
	if(n==1)
		return 1;
	int res1 = fibonacci_ricorsiva(n-1);
	int res2 = fibonacci_ricorsiva(n-2);
	return res1 + res2;
}

void * fib_concorrente(void * arg){
    int n = (int) arg;
	int res = fibonacci_ricorsiva(n);
	return (void *) res;
}

int main(int argc, char * argv[]){
	if(argc < 2)
		return -42;
	int n = atoi(argv[1]);
	int risultato_seq = fibonacci_ricorsiva(n);
	printf("n=%d, fibonacci=%d\n", n, risultato_seq);

	int argT1, argT2, resT1, resT2;
	pthread_t idT1, idT2;

	argT1 = n-1;
	argT2 = n-2;
	
	pthread_create(&idT1, NULL, fib_concorrente, (void *)argT1);
	pthread_create(&idT2, NULL, fib_concorrente, (void *)argT2);
	
	pthread_join(idT1, (void **)&resT1);
	pthread_join(idT2, (void **)&resT2);

	printf("Fibonacci concorrente: %d\n", resT1+resT2);
    return 0;
}

