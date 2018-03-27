#define M 100
#define N 100

long P[M][N];
long Q[N][M];

long sum_element(long i, long j) {
	return P[i][j] + Q[i][j];
}
