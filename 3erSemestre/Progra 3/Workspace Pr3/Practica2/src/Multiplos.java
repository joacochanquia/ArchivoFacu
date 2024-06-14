import java.util.Scanner;
public class Multiplos {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in); // Create a Scanner object
		getMultiplos(4);
		getMultiplos(5);
		int n;
		n = in.nextInt();
		do {
			getMultiplos(n);
			n = in.nextInt();
		}
		while (n != 0);
		in.close();
	}
	
	public static int[] getMultiplos(int n) {
		int[] a = new int[n];
		int i;
		for (i=0; i<n; i++) {
			a[i] = (i+1)*n;
		}
		for (i=0; i<n; i++) {
			System.out.print(a[i] + " ");
		}
		System.out.println();
		return a;
	}
}
