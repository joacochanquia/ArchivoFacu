

public class IteradorAB {

	public static void main(String[] args) {
		iteracionConFor(2,7);
		iteracionConWhile(2,7);
		recursivo(2,7);
	}
	
	public static void iteracionConFor(int a, int b) {
		for (; a<=b; a++) {
			System.out.print(a + " ");
		}
		System.out.println();
	}
	
	public static void iteracionConWhile(int a, int b) {
		do 
		{
			System.out.print(a + " ");
			a++;
		}
		while(a<=b);
		System.out.println();
	}
	
	public static void recursivo(int a, int b) {
		if (a<=b){
			System.out.print(a + " ");
			recursivo(a+1, b);
		}
	}
}

