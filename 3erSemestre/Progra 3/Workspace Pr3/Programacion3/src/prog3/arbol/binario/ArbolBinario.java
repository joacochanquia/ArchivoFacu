package prog3.arbol.binario;

import prog3.listagenerica.*;
import prog3.util.*;

public class ArbolBinario<T> {
	private T dato;
	private ArbolBinario<T> hijoIzquierdo;
	private ArbolBinario<T> hijoDerecho;

	public ArbolBinario() {
		super();
	}

	public ArbolBinario(T dato) {
		this.dato = dato;
	}

	/*
	 * getters y setters
	 * 
	 */
	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}

	public ArbolBinario<T> getHijoIzquierdo() {
		return this.hijoIzquierdo;
	}

	public ArbolBinario<T> getHijoDerecho() {
		return this.hijoDerecho;

	}

	public void agregarHijoIzquierdo(ArbolBinario<T> hijo) {
		this.hijoIzquierdo = hijo;
	}

	public void agregarHijoDerecho(ArbolBinario<T> hijo) {
		this.hijoDerecho = hijo;
	}

	public void eliminarHijoIzquierdo() {
		this.hijoIzquierdo = null;
	}

	public void eliminarHijoDerecho() {
		this.hijoDerecho = null;
	}

	public boolean esVacio() {
		return this.getDato() == null && !this.tieneHijoIzquierdo() && !this.tieneHijoDerecho();
	}

	public boolean esHoja() {
		return (!this.tieneHijoIzquierdo() && !this.tieneHijoDerecho());

	}

	@Override
	public String toString() {
		return this.getDato().toString();
	}

	public boolean tieneHijoIzquierdo() {
		return this.hijoIzquierdo != null;
	}

	public boolean tieneHijoDerecho() {
		return this.hijoDerecho != null;
	}

	public boolean esLleno() {
		ArbolBinario<T> arbol = null;
		Cola<ArbolBinario<T>> cola = new Cola<ArbolBinario<T>>();
		boolean lleno = true;
		cola.encolar(this);
		int cant_nodos = 0;
		cola.encolar(null);
		int nivel = 0;
		while (!cola.esVacia() && lleno) {
			arbol = cola.desencolar();
			if (arbol != null) {
				System.out.print(arbol.getDato());
				if (arbol.tieneHijoIzquierdo()) {
					if (!(arbol.getHijoIzquierdo().esVacio())) {
						cola.encolar(arbol.getHijoIzquierdo());
						cant_nodos++;
					}
				}
				if (arbol.tieneHijoDerecho()) {
					if (!(arbol.getHijoDerecho().esVacio())) {
						cola.encolar(arbol.getHijoDerecho());
						cant_nodos++;
					}
				}
			} else if (!cola.esVacia()) {
				if (cant_nodos == Math.pow(2, ++nivel)) {
					cola.encolar(null);
					cant_nodos = 0;
					System.out.println();
				} else
					lleno = false;
			}
		}
		return lleno;
	}

	/*
	 * public boolean esLleno() {
	 * 
	 * return false; }
	 */

	boolean esCompleto() {
		return false;
	}

	// imprime el árbol en preorden
	public void printPreorden() {
		System.out.println(dato);
		if (this.tieneHijoIzquierdo()) {
			hijoIzquierdo.printPreorden();
		}
		if (this.tieneHijoDerecho()) {
			hijoDerecho.printPreorden();
		}
	}

	// imprime el �rbol en postorden
	public void printInorden() {
		if (this.tieneHijoIzquierdo()) {
			hijoIzquierdo.printInorden();
		}
		System.out.println(dato);
		if (this.tieneHijoDerecho()) {
			hijoDerecho.printInorden();
		}
	}

	// imprime el �rbol en postorden
	public void printPostorden() {
		if (this.tieneHijoIzquierdo()) {
			hijoIzquierdo.printPostorden();
		}
		if (this.tieneHijoDerecho()) {
			hijoDerecho.printPostorden();
		}
		System.out.println(dato);
	}

	public void recorridoPorNiveles() {
		ArbolBinario<T> arbol = null;
		Cola<ArbolBinario<T>> cola = new Cola<ArbolBinario<T>>();
		cola.encolar(this);
		cola.encolar(null);
		while (!cola.esVacia()) {
			arbol = cola.desencolar();
			if (arbol != null) {
				System.out.print(arbol.getDato());
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
			} else if (!cola.esVacia()) {
				cola.encolar(null);
				System.out.println();
			}
		}
	}

	public ListaGenerica<T> frontera() {
		ListaGenerica<T> l = new ListaGenericaEnlazada<T>();
		if (this.esHoja()) {
			l.agregarFinal(dato);
		} else {
			if (this.tieneHijoIzquierdo()) {
				l = hijoIzquierdo.frontera();
			}
			if (this.tieneHijoDerecho()) {
				ListaGenerica<T> ld = new ListaGenericaEnlazada<T>();
				ld = hijoDerecho.frontera();
				ld.comenzar();
				while (!ld.fin()) {
					l.agregarFinal(ld.proximo());
				}
			}
		}
		return l;
	}

	public int contarHojas() {
		return 0;
	}

}
