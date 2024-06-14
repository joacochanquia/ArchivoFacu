package prog3.arbol.binario.util;

import prog3.arbol.binario.*;
import prog3.listagenerica.ListaGenericaEnlazada;
import prog3.util.Cola;

public class Utiles {
	public static Integer sumaMaximaVertical(ArbolBinario<Integer> arbol) {
		if ((arbol != null) && (!arbol.esVacio())) {
			if (arbol.esHoja()) {
				return arbol.getDato();
			} else {
				return Math.max(sumaMaximaVertical(arbol.getHijoIzquierdo()),
						sumaMaximaVertical(arbol.getHijoDerecho())) + arbol.getDato();
			}
		}
		return 0;
	}
	/*
	 * int izq = sumaMaximaVertical(arbol.getHijoIzquierdo()); int der =
	 * sumaMaximaVertical(arbol.getHijoDerecho()); if (izq > der) { return izq +
	 * arbol.getDato(); } else { return der + arbol.getDato(); }
	 */
	/*
	 * return Math.max(sumaMaxima(hijo izq), sumaMaxima(hijo derecho))+ dato actual
	 */

	public static Integer sumaMaximaHorizontal(ArbolBinario<Integer> arbol) {
		Cola<ArbolBinario<Integer>> cola = new Cola<ArbolBinario<Integer>>();
		int suma = 0, max = -30999999;
		cola.encolar(arbol);
		cola.encolar(null);
		while (!cola.esVacia()) {
			arbol = cola.desencolar();
			if (arbol != null) {
				suma += arbol.getDato();
				if (arbol.tieneHijoIzquierdo()) {
					if (!(arbol.getHijoIzquierdo().esVacio())) {
						cola.encolar(arbol.getHijoIzquierdo());
					}
				}
				if (arbol.tieneHijoDerecho()) {
					if (!(arbol.getHijoDerecho().esVacio())) {
						cola.encolar(arbol.getHijoDerecho());
					}
				}
			} else {
				if (suma > max) {
					max = suma;
				}
				if (!cola.esVacia()) {
					suma = 0;
					cola.encolar(null);
				}
			}

		}
		return max;
	}

	public static ListaGenericaEnlazada<Integer> trayectoriaPesada(ArbolBinario<Integer> arbol) {
		ListaGenericaEnlazada<Integer> lista = new ListaGenericaEnlazada<Integer>();
		pesada(arbol, lista, 0, 0);
		return lista;
	}

	private static void pesada(ArbolBinario<Integer> a, ListaGenericaEnlazada<Integer> l, int n, int total) {
		if (a != null) {
			if (a.esHoja()) {
			l.agregarFinal((n * a.getDato()) + total);
		} else {
			if (a.tieneHijoIzquierdo()) {
				pesada(a.getHijoIzquierdo(), l, n + 1, (a.getDato() * n) + total);
			}
			if (a.tieneHijoDerecho()) {
				pesada(a.getHijoDerecho(), l, n + 1, (a.getDato() * n) + total);
			}
		}
		}
	}
}
