package prog3.grafos.utiles;

import prog3.grafos.*;
import prog3.listagenerica.*;
import prog3.util.Cola;

public class Recorridos<T> {

	public void dfsPrint(Grafo<T> grafo) {
		boolean[] marca = new boolean[grafo.listaDeVertices().tamanio()];
		for (int i = 0; i < marca.length; i++) {
			if (!marca[i])
				this.dfsPrint(i, grafo, marca);
		}
	}

	private void dfsPrint(int i, Grafo<T> grafo, boolean[] marca) {
		marca[i] = true;
		Vertice<T> v = grafo.listaDeVertices().elemento(i);
		System.out.println(v);
		ListaGenerica<Arista<T>> ady = grafo.listaDeAdyacentes(v);
		ady.comenzar();
		while (!ady.fin()) {
			int j = ady.proximo().verticeDestino().posicion();
			if (!marca[j]) {
				this.dfsPrint(j, grafo, marca);
			}
		}
	}

	public ListaGenericaEnlazada<Vertice<T>> DFS(Grafo<T> grafo) {
		boolean[] marca = new boolean[grafo.listaDeVertices().tamanio()];
		ListaGenericaEnlazada<Vertice<T>> lis = new ListaGenericaEnlazada<Vertice<T>>();
		for (int i = 0; i < marca.length; i++) {
			if (!marca[i])
				this.DFS(i, grafo, lis, marca);
		}
		return lis;
	}

	private void DFS(int i, Grafo<T> grafo, ListaGenericaEnlazada<Vertice<T>> lis, boolean[] marca) {
		marca[i] = true;
		Vertice<T> v = grafo.listaDeVertices().elemento(i);
		lis.agregarFinal(v);
		ListaGenerica<Arista<T>> ady = grafo.listaDeAdyacentes(v);
		ady.comenzar();
		while (!ady.fin()) {
			int j = ady.proximo().verticeDestino().posicion();
			if (!marca[j]) {
				this.DFS(j, grafo, lis, marca);
			}
		}
	}

	public void bfsPrint(Grafo<T> grafo) {
		boolean[] marca = new boolean[grafo.listaDeVertices().tamanio()];
		for (int i = 0; i < marca.length; i++) {
			if (!marca[i])
				this.bfsPrint(i, grafo, marca); // las listas empiezan en la pos 1
		}
	}

	private void bfsPrint(int i, Grafo<T> grafo, boolean[] marca) {
		ListaGenerica<Arista<T>> ady = null;
		Cola<Vertice<T>> q = new Cola<Vertice<T>>();
		q.encolar(grafo.listaDeVertices().elemento(i));
		marca[i] = true;
		while (!q.esVacia()) {
			Vertice<T> v = q.desencolar();
			System.out.println(v);
			ady = grafo.listaDeAdyacentes(v);
			ady.comenzar();
			while (!ady.fin()) {
				Arista<T> arista = ady.proximo();
				int j = arista.verticeDestino().posicion();
				if (!marca[j]) {
					Vertice<T> w = arista.verticeDestino();
					marca[j] = true;
					q.encolar(w);
				}
			}
		}
	}

	public ListaGenericaEnlazada<Vertice<T>> BFS(Grafo<T> grafo) {
		boolean[] marca = new boolean[grafo.listaDeVertices().tamanio()];
		ListaGenericaEnlazada<Vertice<T>> lis = new ListaGenericaEnlazada<Vertice<T>>();
		for (int i = 0; i < marca.length; i++) {
			if (!marca[i])
				this.BFS(i, grafo, lis, marca); // las listas empiezan en la pos 1
		}
		return lis;
	}

	private void BFS(int i, Grafo<T> grafo, ListaGenericaEnlazada<Vertice<T>> lis, boolean[] marca) {
		ListaGenerica<Arista<T>> ady = null;
		Cola<Vertice<T>> q = new Cola<Vertice<T>>();
		q.encolar(grafo.listaDeVertices().elemento(i));
		marca[i] = true;
		while (!q.esVacia()) {
			Vertice<T> v = q.desencolar();
			lis.agregarFinal(v);
			ady = grafo.listaDeAdyacentes(v);
			ady.comenzar();
			while (!ady.fin()) {
				Arista<T> arista = ady.proximo();
				int j = arista.verticeDestino().posicion();
				if (!marca[j]) {
					Vertice<T> w = arista.verticeDestino();
					marca[j] = true;
					q.encolar(w);
				}
			}
		}
	}
	
}
