#include<stdio.h>

int adder(int a, int b) {
	return(a+b);
}

void main() {
	printf("hello world\n");
	printf("Eredmeny: %u \n", adder(5,6));
}