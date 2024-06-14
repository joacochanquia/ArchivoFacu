package prog3.util;

import prog3.listagenerica.*;

public class MinHeap<T extends Comparable<T>> implements ColaPrioridades<T> {
	@SuppressWarnings("unchecked")
	private T[] datos = (T[]) new Comparable[100];
	private int cantEltos = 0;

	public MinHeap() {
	}

	public MinHeap(ListaGenerica<T> lista) {
		lista.comenzar();
		while (!lista.fin()) {
			this.insert(lista.proximo());
		}
	}

	public MinHeap(T[] elementos) {
		for (int i = 0; i < elementos.length; i++) {
			cantEltos++;
			datos[cantEltos] = elementos[i];
		}
		for (int i = cantEltos / 2; i > 0; i--)
			this.percolate_down(i);
	}

	public boolean insert(T elemento) {
		this.cantEltos++;
		this.datos[cantEltos] = elemento;
		this.percolate_up(cantEltos);
		return true;
	}

	private void percolate_up(int indice) {
		T temporal = datos[indice];
		while (indice / 2 > 0 && datos[indice / 2].compareTo(temporal) > 0) {
			datos[indice] = datos[indice / 2];
			indice = indice / 2;
		}
		datos[indice] = temporal;
	}

	public T deleteMin() {
		if (this.cantEltos > 0) {
			T elemento = this.datos[1];
			this.datos[1] = this.datos[this.cantEltos];
			this.cantEltos--;
			this.percolate_down(1);
			return elemento;
		}
		return null;
	}

	private void percolate_down(int posicion) {
		T candidato = datos[posicion];
		boolean detener_percolate = false;
		while (2 * posicion <= cantEltos && !detener_percolate) {
			// buscar el hijo maximo de candidato (hijo_máximo es el indice)
			int hijo_maximo = 2 * posicion;
			if (hijo_maximo != this.cantEltos) { // hay+ eltos,tiene hderecho
				if (datos[hijo_maximo + 1].compareTo(datos[hijo_maximo]) < 0) {
					hijo_maximo++;
				}
			}
			if (candidato.compareTo(datos[hijo_maximo]) < 0) { // padre<hijo
				datos[posicion] = datos[hijo_maximo];
				posicion = hijo_maximo;
			} else {
				detener_percolate = true;
			}
		}
		this.datos[posicion] = candidato;
	}
	
	public T tope() {
		return this.datos[1];
	}

	public boolean esVacia() {
		if (this.cantEltos > 0) {
			return false;
		}
		return true;
	}
	
}
