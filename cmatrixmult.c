#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
	int n;
	if(!(argc == 2 && (n = atoi(argv[1])) > 0)) {
		fprintf(stderr, "Usage: %s <N>\n", argv[0]);
		return -1;
	}
	int a[n][n], b[n][n], c[n][n]; 

	int i, j, k;
	// populate a
	k = 0;
	for(i = 0; i < n; i++) {
		for(j = 0; j < n; j++) {
			//a[i][j] = i * (j+2) * 3;
			//a[i][j] = k++;
			//b[i][j] = k++;
			a[i][j] = b[i][j] = 2;
			c[i][j] = 0;
			// printf("%d ", a[i][j]);
		}
		// printf("\n");
	}
	// printf("\n");

/*
	// populate b
	for(i = 0; i < n; i++) {
		for(j = 0; j < n; j++) {
			// b[i][j] = i * (j+3) * 2;
			b[i][j] = k++;
			printf("%d ", b[i][j]);
		}
		printf("\n");
	}
	printf("\n");

	// initialise c
	for(i = 0; i < n; i++) {
		for(j = 0; j < n; j++) {
			c[i][j] = 0;
		}
}
*/
	// matrix mult
	for(i = 0; i < n; i++) {
		for(j = 0; j < n; j++) {
			for(k = 0; k < n; k++) {
				c[i][j] += a[i][k] * b[k][j];
			}
		}
	}
	/*	
	// print c
	for(i = 0; i < n; i++) {
		for(j = 0; j < n; j++) {
			printf("%d ", c[i][j]);
		}
		printf("\n");
	}
	*/
	return 0;
}
