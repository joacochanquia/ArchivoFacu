package prog3.arbolgeneral;

import prog3.listagenerica.ListaGenerica;
import prog3.listagenerica.ListaGenericaEnlazada;
import prog3.util.Cola;

public class ArbolGeneral<T> {

	private T dato;

	private ListaGenerica<ArbolGeneral<T>> hijos = new ListaGenericaEnlazada<ArbolGeneral<T>>();

	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}

	public void setHijos(ListaGenerica<ArbolGeneral<T>> hijos) {
		this.hijos = hijos;
	}

	public ArbolGeneral(T dato) {
		this.dato = dato;
		this.hijos = new ListaGenericaEnlazada<ArbolGeneral<T>>();
	}

	public ArbolGeneral(T dato, ListaGenerica<ArbolGeneral<T>> hijos) {
		this(dato);
		this.hijos = hijos;
	}

	public ListaGenerica<ArbolGeneral<T>> getHijos() {
		return this.hijos;
	}

	public void agregarHijo(ArbolGeneral<T> unHijo) {

		this.getHijos().agregarFinal(unHijo);
	}

	public boolean esHoja() {

		return !this.tieneHijos();
	}

	public boolean tieneHijos() {
		return this.hijos != null && !this.hijos.esVacia();
	}

	public boolean esVacio() {

		return this.dato == null && !this.tieneHijos();
	}

	public void eliminarHijo(ArbolGeneral<T> hijo) {
		if (this.tieneHijos()) {
			ListaGenerica<ArbolGeneral<T>> hijos = this.getHijos();
			if (hijos.incluye(hijo))
				hijos.eliminar(hijo);
		}
	}

	public ListaGenericaEnlazada<T> preOrden() {
		return null;
	}

	public Integer altura() {
		if (this.esHoja()) {
			return 0;
		} else {
			int max = Integer.MIN_VALUE;
			this.hijos.comenzar();
			while (!this.hijos.fin()) {
				max = Math.max(this.hijos.proximo().altura(), max);
			}
			return max + 1;
		}
	}

	public boolean include(T dato) {
		if (this.dato.equals(dato)) {
			return true;
		} else {
			boolean b = false;
			this.hijos.comenzar();
			while (!this.hijos.fin() && !b) {
				b = this.hijos.proximo().include(dato);
			}
			return b;
		}

	}

	public Integer nivel(T dato) {
		if (this.dato.equals(dato)) {
			return 0;
		} else {
			boolean b = false;
			int dat = -1;
			this.hijos.comenzar();
			while (!this.hijos.fin() && !b) {
				dat = this.hijos.proximo().nivel(dato);
				if (dat >= 0) {
					b = true;
				}
			}
			if (b) {
				return dat + 1;
			}
			return -1;
		}
	}

	public void recorridoPorNiveles() {
		ArbolGeneral<T> arbol = null;
		Cola<ArbolGeneral<T>> cola = new Cola<ArbolGeneral<T>>();
		cola.encolar(this);
		cola.encolar(null);
		while (!cola.esVacia()) {
			arbol = cola.desencolar();
			if (arbol != null) {
				System.out.print(arbol.getDato());
				if (arbol.tieneHijos()) {
					arbol.hijos.comenzar();
					while (!arbol.hijos.fin()) {
						cola.encolar(hijos.proximo());
					}
				}
			} else if (!cola.esVacia()) {
				cola.encolar(null);
				System.out.println();
			}
		}
	}

	public Integer ancho() {
		ArbolGeneral<T> arbol = null;
		Cola<ArbolGeneral<T>> cola = new Cola<ArbolGeneral<T>>();
		cola.encolar(this);
		cola.encolar(null);
		int cant_nodos = 0, max = 1;
		while (!cola.esVacia()) {
			arbol = cola.desencolar();
			if (arbol != null) {
				System.out.print(arbol.getDato() + " - ");
				if (arbol.tieneHijos()) {
					arbol.hijos.comenzar();
					while (!arbol.hijos.fin()) {
						cola.encolar(arbol.hijos.proximo());
						cant_nodos++;
					}
				}
			} else if (!cola.esVacia()) {
				if (cant_nodos > max)
					max = cant_nodos;
				cant_nodos = 0;
				cola.encolar(null);
				System.out.println();
			}
		}
		return max;
	}

}