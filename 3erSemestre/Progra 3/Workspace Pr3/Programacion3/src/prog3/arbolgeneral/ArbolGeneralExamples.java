package prog3.arbolgeneral;

import prog3.listagenerica.ListaGenerica;
import prog3.listagenerica.ListaGenericaEnlazada;

public class ArbolGeneralExamples<T> {

	public ListaGenerica<T> preorder(ArbolGeneral<T> arbol) {
		ListaGenerica<T> result = new ListaGenericaEnlazada<T>();
		this.preorder_private(arbol, result);
		return result;

	}

	private void preorder_private(ArbolGeneral<T> arbol, ListaGenerica<T> result) {
		if (!arbol.esVacio()) {
			result.agregarFinal(arbol.getDato());

			if (arbol.tieneHijos()) {

				ListaGenerica<ArbolGeneral<T>> hijos = arbol.getHijos();
				hijos.comenzar();
				while (!hijos.fin()) {
					ArbolGeneral<T> hijo = hijos.proximo();
					this.preorder_private(hijo, result);
				}

			}
		}

	}

	public ListaGenerica<T> posorder(ArbolGeneral<T> arbol) {
		ListaGenerica<T> result = new ListaGenericaEnlazada<T>();
		this.posorder_private(arbol, result);
		return result;
	}

	private void posorder_private(ArbolGeneral<T> arbol, ListaGenerica<T> result) {

		if (arbol.tieneHijos()) {

			ListaGenerica<ArbolGeneral<T>> hijos = arbol.getHijos();
			hijos.comenzar();
			while (!hijos.fin()) {
				ArbolGeneral<T> hijo = hijos.proximo();
				this.posorder_private(hijo, result);
			}

		}
		if (!arbol.esVacio()) {
			result.agregarFinal(arbol.getDato());
		}

	}

	public ListaGenerica<T> porNiveles(ArbolGeneral<T> arbol) {
		ListaGenerica<T> result = new ListaGenericaEnlazada<T>();
		ListaGenerica<ArbolGeneral<T>> cola = new ListaGenericaEnlazada<ArbolGeneral<T>>();
		ArbolGeneral<T> arbol_encolado;

		cola.agregarFinal(arbol);
		cola.agregarFinal(null);

		while (cola.tamanio() > 0) {
			arbol_encolado = cola.elemento(0);
			cola.eliminarEn(0);

			if (arbol_encolado != null) {
				result.agregarFinal(arbol_encolado.getDato());
				if (arbol_encolado.tieneHijos()) {
					ListaGenerica<ArbolGeneral<T>> hijos = arbol_encolado.getHijos();
					hijos.comenzar();
					while (!hijos.fin()) {
						cola.agregarFinal(hijos.proximo());
					}
				}

			} else {
				if (cola.tamanio() > 0)
					cola.agregarFinal(null);
			}

		}

		return result;
	}

	public int altura(ArbolGeneral<T> arbol) {
		int altura = 0;
		if (arbol.tieneHijos()) {
			ListaGenerica<ArbolGeneral<T>> hijos = arbol.getHijos();
			hijos.comenzar();
			while (!hijos.fin()) {
				altura = Math.max(altura, this.altura(hijos.proximo()));
			}
		} else {
			return 0;
		}
		return altura + 1;
	}

}
