package prog3.listaenteros.test;
import java.util.Scanner;
import prog3.listagenerica.*;
import prog3.util.*;

public class TestListaGenerica {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		ListaGenericaEnlazada<String> l = new ListaGenericaEnlazada<String>();
		Pila<String> p = new Pila<String>();
		Cola<String> c = new Cola<String>();
		String n = in.next();
		while (!n.equals("0")) {
			l.agregarFinal(n);
			p.apilar(n);
			c.encolar(n);
			n = in.next();
		}
		System.out.println(l);
		l = l.invertir();
		System.out.println(l);
		System.out.println();
		while (!p.esVacia()) {
			System.out.println(p.desapilar());
		}
		System.out.println();
		while (!c.esVacia()) {
			System.out.println(c.desencolar());
		}
		in.close();
	}
	
	

}
