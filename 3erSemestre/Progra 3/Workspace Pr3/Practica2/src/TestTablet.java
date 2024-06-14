//import java.util.Scanner;

public class TestTablet {
	
	public static void main(String[] args) {
		//Scanner in = new Scanner(System.in); // Create a Scanner object
		Tablet[] t = new Tablet[3];
		int i;
		for(i=0; i<3; i++) {
			t[i] = new Tablet();
		}
		for(i=0; i<3; i++) {
			System.out.println(t[i].devolverDatos());
		}
		//in.close();
	}
	

}
