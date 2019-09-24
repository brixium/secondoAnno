int vett[10] = {1,9,3,4,3,1,5,7,8,2,3};
int max, i;
void main(){
	max = vett[0];
	for(i=0; i<10; i++)
		if(vett[i] > max)
			max = vett[i];
	return 0;
}

