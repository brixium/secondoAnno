#define N 16 
int byte = 64;
int elem;
char list[N];

int * binary(int i, char val){
	int * p;
	p = &list[i];
	if(i<0)
		return list;
	else if(*p == val)
		return p;
	else
		return binary(i/2-1, val+1);
}

void main(){
	elem = *binary(N-1, byte);
}

