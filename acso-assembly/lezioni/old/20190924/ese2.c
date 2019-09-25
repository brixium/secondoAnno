/*Stesso esercizio ma coi puntatori*/

int vett[10] = {1,9,3,4,3,1,5,7,8,2,3};
int max, i, *p;
void main(){
	max = vett[0];
	p = vett;
	for(i=0; i<10; i++){
		if(*p > max)
			max = *p;
		p++;
	}
	return 0;
}
