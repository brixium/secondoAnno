#define N 4
int vector [N]
int *addresses;
int dato;

int * search(int);

void main(){
	data = ...
	address = search(data);
}

int * search(int value){
	int gunter;
	gunter = 0;
	while(gunter < N){
		if(vector[gunter] == value)
			break;
		gunter++;
	}
	return &vector[gunter];
}

