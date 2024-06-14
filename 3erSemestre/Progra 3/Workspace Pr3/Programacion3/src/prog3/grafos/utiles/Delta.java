package prog3.grafos.utiles;

import prog3.grafos.Arista;
import prog3.grafos.Grafo;
import prog3.grafos.Vertice;
import prog3.listagenerica.ListaGenerica;
import prog3.listagenerica.ListaGenericaEnlazada;

public class Delta {

	/*
	 * maxIslasDistintas(Grafo<String> grafo) : int // Retorna el número máximo de
	 * islas distintas que se pueden recorrer en el grafo comprando un único boleto.
	 */

	public int maxIslasDistintas(Grafo<String> grafo) {
		ListaGenerica<Vertice<String>> vert = grafo.listaDeVertices();
		boolean[] marca = new boolean[vert.tamanio()];
		Peso max = new Peso();
		max.maximo();
		boolean llegue = false;
		int i = 0;
		vert.comenzar();
		while (!vert.fin() && !llegue) {
			Vertice<String> dest = vert.proximo();
			if (dest.dato().equals("Muelle Principal")) {
				i = dest.posicion();
				llegue = true;
			}
		}
		distanciaMax(i, grafo, max, 0, marca);
		return max.getPeso();
	}

	private void distanciaMax(int i, Grafo<String> grafo, Peso max, int islas, boolean[] marca) {
		marca[i] = true;
		Vertice<String> v = grafo.listaDeVertices().elemento(i);
		islas++;
		if(islas > max.getPeso()) {
			max.setPeso(islas);
		}
		ListaGenerica<Arista<String>> ady = grafo.listaDeAdyacentes(v);
		Arista<String> arista;
		ady.comenzar();
		while (!ady.fin()) {
			arista = ady.proximo();
			int j = arista.verticeDestino().posicion();
			if (!marca[j]) {
				this.distanciaMax(j, grafo, max, islas, marca);
			}
		}
		marca[i] = false;
	}

	/*
	 * caminoMasCorto(Grafo<String> grafo, String islaO, String islaD) : RutaMinima
	 * // Retorna un objeto de la clase RutaMinima, el cual contiene el camino más
	 * corto entre islaO e islaD y si se puede realizar con un único boleto o es
	 * necesario comprar un nuevo boleto para completar el recorrido.
	 */

	public RutaMinima caminoMasCorto(Grafo<String> grafo, String islaO, String islaD) {
		RutaMinima res = new RutaMinima();
		ListaGenericaEnlazada<String> lis = new ListaGenericaEnlazada<String>();
		ListaGenerica<Vertice<String>> vert = grafo.listaDeVertices();
		boolean[] marca = new boolean[vert.tamanio()];
		Peso min = new Peso();
		min.minimo();
		int peso = 0;
		boolean llegue = false;
		int i = -1;
		vert.comenzar();
		while (!vert.fin() && !llegue) {
			Vertice<String> dest = vert.proximo();
			if (dest.dato().equals(islaO)) {
				i = dest.posicion();
				llegue = true;
			}
		}
		if (i >= 0) {
			llegue = false;
			this.caminoMasCorto(i, grafo, res, min, lis, peso, true, islaD, marca);
		}
		return res;
	}

	private void caminoMasCorto(int i, Grafo<String> grafo, RutaMinima res, Peso min, ListaGenericaEnlazada<String> lis,
			int peso, boolean unico, String islaD, boolean[] marca) {
		marca[i] = true;
		Vertice<String> v = grafo.listaDeVertices().elemento(i);
		lis.agregarFinal(v.dato());
		if (v.dato().equals(islaD)) {
			if (peso < min.getPeso()) {
				ListaGenerica<String> nueva = new ListaGenericaEnlazada<String>();
				lis.comenzar();
				while (!lis.fin()) {
					nueva.agregarFinal(lis.proximo());
				}
				res.setCamino(nueva);
				res.setUnico(unico);
				min.setPeso(peso);
			}
		} else {
			if (v.dato().equals("Muelle Principal") && (lis.incluye("Muelle Principal"))) {
				unico = false;
			}
			ListaGenerica<Arista<String>> ady = grafo.listaDeAdyacentes(v);
			Arista<String> arista;
			ady.comenzar();
			while (!ady.fin()) {
				arista = ady.proximo();
				int j = arista.verticeDestino().posicion();
				if (!marca[j]) {
					this.caminoMasCorto(j, grafo, res, min, lis, peso + arista.peso(), unico, islaD, marca);
				}
			}
		}
		lis.eliminarEn(lis.tamanio() - 1);
		marca[i] = false;
	}

}
