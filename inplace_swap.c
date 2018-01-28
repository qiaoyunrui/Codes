#include <stdio.h>

//对于任一位向量 a，有 a ^ a = 0
void inplace_swap(int *x,int *y) {
	*y = *x ^ *y;
	*x = *x ^ *y;
	*y = *x ^ *y;
}

int main() {
	int x = 4;
	int y = 6;
	printf("%d %d\n", x, y);
	inplace_swap(&x, &y);
	printf("%d %d\n", x, y);
	return 0;
}
