int sums(int n, int m){
	return n*m+17;
}
int big-fun(int a, int b, int c, int d, int e){
	return c+sums(d,e)+a*b;
}
void main(){
	int a=1, b=2, c=3, d=4, e=5, res;
	res = big-fun(a,b,c,d,e);
}