package prog3.grafos.utiles;

import prog3.grafos.Arista;
import prog3.grafos.Grafo;
import prog3.grafos.Vertice;
import prog3.listagenerica.ListaGenerica;

public class Algoritmos<T> {

	/*
	 * subgrafoCuadrado(Grafo<T> grafo): boolean // Retorna true si un dígrafo
	 * contiene un subgrafo cuadrado, false en caso contrario. Un subgrafo cuadrado
	 * es un ciclo simple de longitud 4.
	 */

	public boolean subgrafoCuadrado(Grafo<T> grafo) {
		boolean[] marca = new boolean[grafo.listaDeVertices().tamanio()];
		boolean ciclo = false;
		for (int i = 0; (i < marca.length) && !ciclo; i++) {
			ciclo = this.subgrafoCuadrado(i, grafo, marca, 4, i);
		}
		return ciclo;
	}

	private boolean subgrafoCuadrado(int i, Grafo<T> grafo, boolean[] marca, int cant, int pos) {
		if (cant > 0) {
			boolean ciclo = false;
			marca[i] = true;
			Vertice<T> v = grafo.listaDeVertices().elemento(i);
			ListaGenerica<Arista<T>> ady = grafo.listaDeAdyacentes(v);
			ady.comenzar();
			while (!ady.fin() && (!ciclo)) {
				int j = ady.proximo().verticeDestino().posicion();
				if (!marca[j]) {
					ciclo = this.subgrafoCuadrado(j, grafo, marca, cant - 1, pos);
				} else {
					if ((j == pos)&&(cant == 1)) {
						ciclo = true;
					}
				}
			}
			marca[i] = false;
			return ciclo;
		}
		return false;
	}

	/*
	 * getGrado(Grafo<T> grafo) : int // Retorna el grado del digrafo pasado como
	 * parámetro. El grado de un digrafo es el de su vértice de grado máximo. El
	 * grado de un vértice en un grafo dirigido es la suma del número de aristas que
	 * salen de él (grado de salida) y el número de aristas que entran en él (grado
	 * de entrada).
	 */

	public int getGrado(Grafo<T> grafo) {
		int[] grado = new int[grafo.listaDeVertices().tamanio()];
		ListaGenerica<Vertice<T>> vert = grafo.listaDeVertices();
		vert.comenzar();
		int i, j, max = Integer.MIN_VALUE;
		while(!vert.fin()) {
			Vertice<T> v = vert.proximo();
			i = v.posicion();
			ListaGenerica<Arista<T>> ady = grafo.listaDeAdyacentes(v);
			grado[i] += ady.tamanio();
			ady.comenzar();
			while (!ady.fin()) {
				Arista<T> arista = ady.proximo();
				j = arista.verticeDestino().posicion();
				grado[j] += 1;
			}
		}
		for (i=0; i<vert.tamanio(); i++) {
			if (grado[i]>max) {
				max = grado[i];
			}
		}
		return max;
	}

	/*
	 * tieneCiclo(Grafo<T> grafo): boolean // Retorna true si el grafo dirigido
	 * pasado como parámetro tiene al menos un ciclo, false en caso contrario.
	 */

	public boolean tieneCiclo(Grafo<T> grafo) {
		boolean[] marca = new boolean[grafo.listaDeVertices().tamanio()];
		boolean ciclo = false;
		for (int i = 0; (i < marca.length) && !ciclo; i++) {
			if (!marca[i])
				ciclo = this.tieneCiclo(i, grafo, marca);
		}
		return ciclo;
	}

	private boolean tieneCiclo(int i, Grafo<T> grafo, boolean[] marca) {
		marca[i] = true;
		Vertice<T> v = grafo.listaDeVertices().elemento(i);
		boolean ciclo = false;
		ListaGenerica<Arista<T>> ady = grafo.listaDeAdyacentes(v);
		ady.comenzar();
		while (!ady.fin() && (!ciclo)) {
			int j = ady.proximo().verticeDestino().posicion();
			if (!marca[j]) {
				ciclo = this.tieneCiclo(j, grafo, marca);
			} else {
				ciclo = true;
			}
		}
		return ciclo;
	}

}
