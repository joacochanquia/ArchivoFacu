package prog3.listaenteros.test;
import java.util.Scanner;
import prog3.listaenteros.*;
import prog3.util.*;

public class ListaDeEnterosEnlazadaTestBasico {
	
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		ListaDeEnterosEnlazada l = new ListaDeEnterosEnlazada();
		int n = in.nextInt();
		while (n!=0) {
			l.agregarFinal(n);
			n = in.nextInt();
		}
		System.out.println("l = "+l);
		l.comenzar();
		//imprimirInversa(l);
		System.out.println();
		//l=l.ordenar();
		l = UtilitariosLista.mergeSort(l);
		System.out.println("l ordenada = "+l);
		ListaDeEnterosEnlazada l2 = new ListaDeEnterosEnlazada();
		n = in.nextInt();
		while (n!=0) {
			l2.agregarFinal(n);
			n = in.nextInt();
		}
		System.out.println("l2 = "+l2);
		l2=l2.ordenar();
		System.out.println("l2 ordenada = "+l2);
		System.out.println();
		System.out.println("l = "+l);
		System.out.println("l2 = "+l2);
		ListaDeEnterosEnlazada lr = new ListaDeEnterosEnlazada();
		lr = l.combinarOrdenado(l2);
		System.out.println("lista resultado = "+lr);
		in.close();
	}
	
	public static void imprimirInversa(ListaDeEnterosEnlazada l) {
		int n;
		if (!(l.fin())){
			n = l.proximo();
			imprimirInversa(l);
			System.out.print(n + " ");
		}
		
	}
	
}
