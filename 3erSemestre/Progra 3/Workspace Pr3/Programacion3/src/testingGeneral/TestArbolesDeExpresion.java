package testingGeneral;

import prog3.arbol.binario.*;

public class TestArbolesDeExpresion {
	
	static Expresion e = new Expresion();
	
	public static void main(String[] args) {
		//aca convertirXXfija para cambiar la expresion que ingreso SIN ESPACIOS
		ArbolBinario<Character> arbol = e.convertirPostfija("abc*d-ef/g/-*");
		
		System.out.println("Prefija: " + e.Prefija(arbol));
		System.out.println("Postfija: " + e.Postfija(arbol));
		System.out.println("Infija: " + e.Infija(arbol));
		System.out.println();
		arbol.recorridoPorNiveles();
		System.out.println();
		System.out.println("resultado: "+ e.evaluar(arbol));
	}

}
