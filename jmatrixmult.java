public class jmatrixmult {
	/*
	public static void printMatrix(int[][] m) {
		for(int i = 0; i < m.length; i++) {
			for(int j = 0; j < m[i].length; j++) {
				System.out.printf("%d ", m[i][j]);
			}
			System.out.println();
		}
	}
*/
	public static void main(String[] args) {
		int n;
		if(!(args.length == 1 && (n = Integer.parseInt(args[0])) > 0)) {
			System.out.println("Usage: java jmatrixmult <N>");
			return;
		}
		int[][] a, b, c;
		a = new int[n][n];
		b = new int[n][n];
		c = new int[n][n];
		
		int inc = 0;
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++) {
				// a[i][j] = inc++;
				// b[i][j] = inc++;
				a[i][j] = b[i][j] = 2;
			}
		}
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++) {
				for(int k = 0; k < n; k++) {
					c[i][j] += a[i][k] * b[k][j];
				}
			}
		}
		//jmatrixmult.printMatrix(c);
	}
}
