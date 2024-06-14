package prog3.grafos.utiles;

import prog3.grafos.*;
import prog3.listagenerica.*;

public class GuiaDeTurismo {

	/*
	 * caminoConMenorNrodeViajes(Grafo<String> grafo, String puntoInteresOrigen,
	 * String puntoInteresDestino) : ListaGenerica <String> // Retorna la lista de
	 * puntos de interés que se deben atravesar en el grafo para ir de
	 * puntoInteresOrigen a puntoInteresDestino, haciendo la menor cantidad de
	 * viajes
	 */

	public ListaGenerica<String> caminoConMenorNrodeViajes(Grafo<String> grafo, String puntoInteresOrigen,
			String puntoInteresDestino) {
		ListaGenerica<Vertice<String>> vertices = grafo.listaDeVertices();
		boolean[] marca = new boolean[vertices.tamanio()];
		ListaGenerica<String> res = new ListaGenericaEnlazada<String>();
		ListaGenerica<String> lis = new ListaGenericaEnlazada<String>();
		int min = Integer.MAX_VALUE;
		int[] max = { Integer.MIN_VALUE };
		Vertice<String> aux = null, vOri = null, vDes = null;
		vertices.comenzar();
		while (!vertices.fin() && ((vOri == null) || (vDes == null))) {
			aux = vertices.proximo();
			if (aux.dato().equals(puntoInteresOrigen)) {
				vOri = aux;
			}
			if (aux.dato().equals(puntoInteresDestino)) {
				vDes = aux;
			}
		}
		caminoConMenorNrodeViajes(vOri, vDes, grafo, res, max, lis, min, marca);
		return res;
	}

	private void caminoConMenorNrodeViajes(Vertice<String> vOri, Vertice<String> vDes, Grafo<String> grafo,
			ListaGenerica<String> res, int[] max, ListaGenerica<String> lis, int min, boolean[] marca) {
		marca[vOri.posicion()] = true;
		lis.agregarFinal(vOri.dato());
		if (vOri.equals(vDes)) {
			if (min > max[0]) {
				res.comenzar();
				while (!res.esVacia()) {
					res.eliminarEn(0);
				}
				lis.comenzar();
				while(!lis.fin()) {
					res.agregarFinal(lis.proximo());
				}
				max[0] = min;
			}
		}
		else {
			ListaGenerica<Arista<String>> ady = grafo.listaDeAdyacentes(vOri);
			ady.comenzar();
			while (!ady.fin()) {
				Arista<String> arista = ady.proximo();
				if (!marca[arista.verticeDestino().posicion()]) {
					int x = Math.min(min, arista.peso());
					caminoConMenorNrodeViajes(arista.verticeDestino(), vDes, grafo, res, max, lis, x, marca);
				}
			}
		}
		lis.eliminarEn(lis.tamanio()-1);
		marca[vOri.posicion()] = false;
	}
}
