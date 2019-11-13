#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

int c = 0;

void * th_fun(void * arg){
    int a = 0, b=(int)arg;
    a = b+c;
    c=a*a;
    return (void *)a;
}
int main(int argc, char * argv[]){
    pthread_t th1, th2, th3;
    int d;

    pthread_create(&th1, NULL, &th_fun, (void *)3);
    pthread_join(th1, (void *)&d);
    pthread_create(&th2, NULL, &th_fun, (void *)d);
    pthread_join(th2, (void *)&d);
    pthread_create(&th3, NULL, &th_fun, (void *)d);
    pthread_join(th3, (void *)&d);
    return 0;
}
/*
Cosa succede dopo la riga 	a	b	c		d	arg
15, rispetto al main		NE  NE  0   	U	U/NE	(NE: non esiste)
10, dopo r.17 (th1)			3	3	9		U	3
18, rispetto al main		U	U	9		3	U
10, dopo istr. 19			12	3	144 	3	3
20 (main)					U	U	144 	12	U
10, dopo istr. 21			156 12	156*12	12	12
22							U	U	156*156	156	U
*/

