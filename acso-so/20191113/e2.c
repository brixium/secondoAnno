#include <pthread.h>
#include <stdio.h>
void * tf1(void * tID){
    int conta = 0; 
    conta++;
    printf("sono il thread n.%d, conta=%d\n", (int)tID, conta);
    return NULL;
}

int main(){
    pthread_t tID1, tID2;
    pthread_create(&tID1, NULL, &tf1, (void *)1);
    pthread_create(&tID2, NULL, &tf1, (void *)2);
    pthread_join(tID1, NULL);
    pthread_join(tID2, NULL);
    return 0;
}
