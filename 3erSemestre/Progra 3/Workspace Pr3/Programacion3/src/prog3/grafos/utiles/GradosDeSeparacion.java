package prog3.grafos.utiles;

import prog3.grafos.*;
import prog3.listagenerica.*;
import prog3.util.Cola;

public class GradosDeSeparacion {

	/*
	 * maximoGradoDeSeparacion(Grafo<String> grafo) : int // Retorna el máximo grado
	 * de separación del grafo recibido como parámetro. Si en el grafo hubiera dos
	 * personas cualesquiera que no están conectadas por una cadena de relaciones
	 * entonces se retorna 0
	 */
	public int maximoGradoDeSeparacion(Grafo<String> grafo) {
		ListaGenerica<Vertice<String>> vert = grafo.listaDeVertices();
		boolean[] marca = new boolean[vert.tamanio()];
		int max = Integer.MIN_VALUE;
		int i, j;
		vert.comenzar();
		for(i=0;i<vert.tamanio();i++) {
			max = Math.max(max, maximoGradoDeSeparacion(i, grafo, marca));
			for(j=0; j<vert.tamanio();j++) {
				if(marca[j]) {
					marca[j] = false;
				}
				else return 0;
			}
			
		}
		return max;
	}

	private int maximoGradoDeSeparacion(int i, Grafo<String> grafo, boolean[] marca) {
		ListaGenerica<Arista<String>> ady = null;
		Cola<Vertice<String>> q = new Cola<Vertice<String>>();
		q.encolar(grafo.vertice(i));
		q.encolar(null);
		marca[i] = true;
		int nivel = 0;
		while (!q.esVacia()) {
			Vertice<String> v = q.desencolar();
			if (v != null) {
				ady = grafo.listaDeAdyacentes(v);
				ady.comenzar();
				while (!ady.fin()) {
					Arista<String> arista = ady.proximo();
					int j = arista.verticeDestino().posicion();
					if (!marca[j]) {
						Vertice<String> w = arista.verticeDestino();
						marca[j] = true;
						q.encolar(w);
					}
				}
			} else if (!q.esVacia()) {
				q.encolar(null);
				nivel++;
			}
		}
		nivel++;
		return nivel;
	}

}
