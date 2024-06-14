
public class PruebaRetorno {

	public static void main(String[] args) {
		int a[] = {12,5,5,6,8,8,7,4,1,5};
		System.out.println(a[0]+" "+a[1]+' '+a[2]+' '+a[3]+' '+a[4]+' '+a[5]+' '+a[6]+' '+a[7]+' '+a[8]+' '+a[9]);
		System.out.println(sumaArreglo(a, 10));
	}
	
	public static int sumaArreglo(int[] a, int cant) {
		int r=0, i;
		for (i=0; i<cant; i++) {
			r+=a[i];
		}
		return r;
	}
}
