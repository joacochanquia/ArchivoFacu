package prog3.grafos.utiles;

import prog3.grafos.*;
import prog3.listagenerica.*;
import prog3.util.Cola;

public class Caminos<T> {

	Grafo<T> mapaCiudades = new GrafoImplListAdy<T>();

	public Caminos(Grafo<T> mapaCiudades) {
		super();
		this.mapaCiudades = mapaCiudades;
	}

	/*
	 * El método devolverCamino (String ciudad1, String ciudad2):
	 * ListaGenerica<String> // Retorna la lista de ciudades que se deben atravesar
	 * para ir de ciudad1 a ciudad2 en caso que se pueda llegar, si no retorna la
	 * lista vacía. (Sin tener en cuenta el combustible).
	 */
	public ListaGenerica<Vertice<T>> devolverCamino(T ciudad1, T ciudad2) {
		boolean[] marca = new boolean[mapaCiudades.listaDeVertices().tamanio()];
		ListaGenerica<Vertice<T>> res = new ListaGenericaEnlazada<Vertice<T>>();
		boolean llegue = false;
		int i = -1;
		ListaGenerica<Vertice<T>> vert = mapaCiudades.listaDeVertices();
		vert.comenzar();
		while (!vert.fin() && !llegue) {
			Vertice<T> dest = vert.proximo();
			if (dest.dato().equals(ciudad1)) {
				i = dest.posicion();
				llegue = true;
			}
		}
		if (i >= 0) {
			llegue = false;
			llegue = this.devolverCamino(i, mapaCiudades, res, ciudad2, marca);
			if (!llegue && (res.tamanio() == 1)) {
				res.eliminarEn(0);
			}
		}
		return res;
	}

	private boolean devolverCamino(int i, Grafo<T> grafo, ListaGenerica<Vertice<T>> lis, T ciudad2, boolean[] marca) {
		marca[i] = true;
		Vertice<T> v = grafo.listaDeVertices().elemento(i);
		lis.agregarFinal(v);
		if (v.dato().equals(ciudad2)) {
			return true;
		} else {
			ListaGenerica<Arista<T>> ady = grafo.listaDeAdyacentes(v);
			ady.comenzar();
			boolean llegue = false;
			while (!ady.fin() && !llegue) {
				int j = ady.proximo().verticeDestino().posicion();
				if (!marca[j]) {
					llegue = this.devolverCamino(j, grafo, lis, ciudad2, marca);
				}
			}
			if (llegue) {
				return true;
			} else {
				lis.eliminarEn(lis.tamanio() - 1);
				return false;
			}
		}
	}

	/*
	 * El método devolverCaminoExceptuando (String ciudad1, String ciudad2,
	 * ListaGenerica<String> ciudades): ListaGenerica<String> // Retorna la lista de
	 * ciudades que forman un camino desde ciudad1 a ciudad2, sin pasar por las
	 * ciudades que están contenidas en la lista ciudades pasada por parámetro, si
	 * no existe camino retorna la lista vacía. (Sin tener en cuenta el
	 * combustible).
	 */
	public ListaGenerica<Vertice<T>> devolverCaminoExceptuando(T ciudad1, T ciudad2, ListaGenerica<T> ciudades) {
		boolean[] marca = new boolean[mapaCiudades.listaDeVertices().tamanio()];
		ListaGenerica<Vertice<T>> res = new ListaGenericaEnlazada<Vertice<T>>();
		boolean llegue = false;
		int i = -1;
		ListaGenerica<Vertice<T>> vert = mapaCiudades.listaDeVertices();
		vert.comenzar();
		while (!vert.fin() && !llegue) {
			Vertice<T> dest = vert.proximo();
			if (dest.dato().equals(ciudad1)) {
				i = dest.posicion();
				llegue = true;
			}
		}
		if (i >= 0) {
			llegue = false;
			llegue = this.devolverCaminoExceptuando(i, mapaCiudades, res, ciudades, ciudad2, marca);
			if (!llegue && (res.tamanio() == 1)) {
				res.eliminarEn(0);
			}
		}
		return res;
	}

	private boolean devolverCaminoExceptuando(int i, Grafo<T> grafo, ListaGenerica<Vertice<T>> lis,
			ListaGenerica<T> excepto, T ciudad2, boolean[] marca) {
		marca[i] = true;
		Vertice<T> v = grafo.listaDeVertices().elemento(i);
		excepto.comenzar();
		while (!excepto.fin()) {
			if (v.dato().equals(excepto.proximo())) {
				return false;
			}
		}
		lis.agregarFinal(v);
		if (v.dato().equals(ciudad2)) {
			return true;
		} else {
			ListaGenerica<Arista<T>> ady = grafo.listaDeAdyacentes(v);
			ady.comenzar();
			boolean llegue = false;
			while (!ady.fin() && !llegue) {
				int j = ady.proximo().verticeDestino().posicion();
				if (!marca[j]) {
					llegue = this.devolverCaminoExceptuando(j, grafo, lis, excepto, ciudad2, marca);
				}
			}
			if (llegue) {
				return true;
			} else {
				marca[i] = false;
				lis.eliminarEn(lis.tamanio() - 1);
				return false;
			}
		}
	}

	/*
	 * El método caminoMasCorto(String ciudad1, String ciudad2):
	 * ListaGenerica<String> // Retorna la lista de ciudades que forman el camino
	 * más corto para llegar de ciudad1 a ciudad2, si no existe camino retorna la
	 * lista vacía. (Las rutas poseen la distancia). (Sin tener en cuenta el
	 * combustible).
	 */

	public ListaGenericaEnlazada<T> caminoMasCorto(T ciudad1, T ciudad2) {
		ListaGenericaEnlazada<T> res = new ListaGenericaEnlazada<T>();
		boolean llegue = false;
		int i = -1;
		ListaGenerica<Vertice<T>> vert = mapaCiudades.listaDeVertices();
		vert.comenzar();
		while (!vert.fin() && !llegue) {
			Vertice<T> dest = vert.proximo();
			if (dest.dato().equals(ciudad1)) {
				i = dest.posicion();
				llegue = true;
			}
		}
		if (i >= 0) {
			llegue = false;
			this.caminoMinNoPesado(i, mapaCiudades, res, ciudad2);
		}
		return res;
	}

	private void caminoMinNoPesado(int i, Grafo<T> grafo, ListaGenericaEnlazada<T> lis, T ciudad2) {
		ListaGenerica<Arista<T>> ady = null;
		Integer[] D = new Integer[mapaCiudades.listaDeVertices().tamanio()];
		Integer[] P = new Integer[mapaCiudades.listaDeVertices().tamanio()];
		int j, k = i;
		boolean llegue = false;
		for (j = 0; j < grafo.listaDeVertices().tamanio(); j++) {
			D[j] = null;
			P[j] = 0;
		}
		Cola<Vertice<T>> q = new Cola<Vertice<T>>();
		q.encolar(grafo.listaDeVertices().elemento(i));
		D[i] = 0;
		while (!q.esVacia() && !llegue) {
			Vertice<T> v = q.desencolar();
			ady = grafo.listaDeAdyacentes(v);
			ady.comenzar();
			while (!ady.fin()) {
				Arista<T> arista = ady.proximo();
				j = arista.verticeDestino().posicion();
				if (D[j] == null) {
					Vertice<T> w = arista.verticeDestino();
					D[j] = D[v.posicion()] + 1;
					P[j] = v.posicion();
					if (arista.verticeDestino().dato().equals(ciudad2)) {
						llegue = true;
						k = j;
						break;
					}
					q.encolar(w);
				}
			}
		}
		if (llegue) {
			int pos = k;
			while (D[pos] != 0) {
				lis.agregarInicio(grafo.listaDeVertices().elemento(pos).dato());
				pos = P[pos];
			}
			lis.agregarInicio(grafo.listaDeVertices().elemento(pos).dato());
		}

	}

	/*
	 * El método caminoSinCargarCombustible(String ciudad1, String ciudad2, int
	 * tanqueAuto): ListaGenerica<String> // Retorna la lista de ciudades que forman
	 * un camino para llegar de ciudad1 a ciudad2. El auto no debe quedarse sin
	 * combustible y no puede cargar. Si no existe camino retorna la lista vacía.
	 */

	/*
	 * El método caminoConMenorCargaDeCombustible (String ciudad1, String ciudad2,
	 * int tanqueAuto): ListaGenerica<String> // Retorna la lista de ciudades que
	 * forman un camino para llegar de ciudad1 a ciudad2 teniendo en cuenta que el
	 * auto debe cargar la menor cantidad de veces. El auto no se debe quedar sin
	 * combustible en medio de una ruta, además puede completar su tanque al llegar
	 * a cualquier ciudad. Si no existe camino retorna la lista vacía.
	 */

}