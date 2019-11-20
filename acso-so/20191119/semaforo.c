#include <semaphore.h>
sem_t sem1, sem2;
void tf1(void * arg){
	sem_wait(&sem1);
	printf("x");
	sem_post(&sem2);
	sem_wait(&sem1);
	printf("y");
	sem_post(&sem2);
	sem_wait(&sem1);
	printf("z");
	return NULL;
}

void tf2(void * arg){
	printf("a");
	sem_post(&sem2);
	sem_wait(&sem1);
	printf("b");
	sem_post(&sem2);
	sem_wait(&sem1);
	printf("c");
	sem_post(&sem1);
	return NULL;
}
int main(void){
	pthread_t tID1, tID2;
	sem_init(&sem1, 0, 0);
	sem_init(&sem2, 0, 0);
	/*(...)*/
	return 0;
}
