package prog3.grafos.utiles;

import prog3.grafos.*;
import prog3.listagenerica.*;
import prog3.util.*;

public class Mapa {

	Grafo<String> mapaCiudades = new GrafoImplListAdy<String>();

	public Mapa(Grafo<String> mapaCiudades) {
		super();
		this.mapaCiudades = mapaCiudades;
	}

	/*
	 * El método devolverCamino (String ciudad1, String ciudad2):
	 * ListaGenerica<String> // Retorna la lista de ciudades que se deben atravesar
	 * para ir de ciudad1 a ciudad2 en caso que se pueda llegar, si no retorna la
	 * lista vacía. (Sin tener en cuenta el combustible).
	 */
	public ListaGenerica<String> devolverCamino(String ciudad1, String ciudad2) {
		boolean[] marca = new boolean[mapaCiudades.listaDeVertices().tamanio()];
		ListaGenerica<String> res = new ListaGenericaEnlazada<String>();
		boolean llegue = false;
		int i = -1;
		ListaGenerica<Vertice<String>> vert = mapaCiudades.listaDeVertices();
		vert.comenzar();
		while (!vert.fin() && !llegue) {
			Vertice<String> dest = vert.proximo();
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

	private boolean devolverCamino(int i, Grafo<String> grafo, ListaGenerica<String> lis, String ciudad2,
			boolean[] marca) {
		marca[i] = true;
		Vertice<String> v = grafo.listaDeVertices().elemento(i);
		lis.agregarFinal(v.dato());
		if (v.dato().equals(ciudad2)) {
			return true;
		} else {
			ListaGenerica<Arista<String>> ady = grafo.listaDeAdyacentes(v);
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
	public ListaGenerica<String> devolverCaminoExceptuando(String ciudad1, String ciudad2,
			ListaGenerica<String> ciudades) {
		boolean[] marca = new boolean[mapaCiudades.listaDeVertices().tamanio()];
		ListaGenerica<String> res = new ListaGenericaEnlazada<String>();
		boolean llegue = false;
		int i = -1;
		ListaGenerica<Vertice<String>> vert = mapaCiudades.listaDeVertices();
		vert.comenzar();
		while (!vert.fin() && !llegue) {
			Vertice<String> dest = vert.proximo();
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

	private boolean devolverCaminoExceptuando(int i, Grafo<String> grafo, ListaGenerica<String> lis,
			ListaGenerica<String> excepto, String ciudad2, boolean[] marca) {
		marca[i] = true;
		Vertice<String> v = grafo.listaDeVertices().elemento(i);
		excepto.comenzar();
		while (!excepto.fin()) {
			if (v.dato().equals(excepto.proximo())) {
				return false;
			}
		}
		lis.agregarFinal(v.dato());
		if (v.dato().equals(ciudad2)) {
			return true;
		} else {
			ListaGenerica<Arista<String>> ady = grafo.listaDeAdyacentes(v);
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
	public ListaGenericaEnlazada<String> caminoMasCorto(String ciudad1, String ciudad2) {
		ListaGenericaEnlazada<String> res = new ListaGenericaEnlazada<String>();
		ListaGenericaEnlazada<String> lis = new ListaGenericaEnlazada<String>();
		boolean[] marca = new boolean[mapaCiudades.listaDeVertices().tamanio()];
		Peso min = new Peso();
		min.minimo();
		int peso = 0;
		boolean llegue = false;
		int i = -1;
		ListaGenerica<Vertice<String>> vert = mapaCiudades.listaDeVertices();
		vert.comenzar();
		while (!vert.fin() && !llegue) {
			Vertice<String> dest = vert.proximo();
			if (dest.dato().equals(ciudad1)) {
				i = dest.posicion();
				llegue = true;
			}
		}
		if (i >= 0) {
			llegue = false;
			this.caminoMasCorto(i, mapaCiudades, res, min, lis, peso, ciudad2, marca);
		}
		return res;
	}

	private void caminoMasCorto(int i, Grafo<String> grafo, ListaGenericaEnlazada<String> res, Peso min,
			ListaGenericaEnlazada<String> lis, int peso, String ciudad2, boolean[] marca) {
		marca[i] = true;
		Vertice<String> v = grafo.listaDeVertices().elemento(i);
		lis.agregarFinal(v.dato());
		if (v.dato().equals(ciudad2)) {
			if (peso < min.getPeso()) {
				res.comenzar();
				while (!res.esVacia()) {
					res.eliminarEn(0);
				}
				lis.comenzar();
				while (!lis.fin()) {
					res.agregarFinal(lis.proximo());
				}
				min.setPeso(peso);
			}
		} else {
			ListaGenerica<Arista<String>> ady = grafo.listaDeAdyacentes(v);
			Arista<String> arista;
			ady.comenzar();
			while (!ady.fin()) {
				arista = ady.proximo();
				int j = arista.verticeDestino().posicion();
				if (!marca[j]) {
					this.caminoMasCorto(j, grafo, res, min, lis, peso + arista.peso(), ciudad2, marca);
				}
			}
		}
		lis.eliminarEn(lis.tamanio() - 1);
		marca[i] = false;
	}

	@SuppressWarnings("unused")
	private void dijkstra(int i, Grafo<String> grafo, ListaGenericaEnlazada<String> lis, String ciudad2) {// Dijkstra(G,w,
																											// s){
		ListaGenerica<Arista<String>> ady = null;
		Integer[] D = new Integer[grafo.listaDeVertices().tamanio()];
		Integer[] P = new Integer[grafo.listaDeVertices().tamanio()];
		boolean[] C = new boolean[grafo.listaDeVertices().tamanio()];
		int j, k = i, l;
		boolean llegue = false;
		for (j = 0; j < grafo.listaDeVertices().tamanio(); j++) {// (1) para cada vértice v Є V
			D[j] = null;// (2) Dv = ∞; Pv = 0;
			P[j] = 0;
			C[j] = false;
		}
		D[i] = 0;// (3) Ds = 0;
		for (j = 0; j < grafo.listaDeVertices().tamanio() && !llegue; j++) {// (4) para cada vértice v Є V {
			int min = Integer.MAX_VALUE, posMin = 0;
			for (k = 0; k < grafo.listaDeVertices().tamanio(); k++) {// (5) u = vérticeDesconocidoMenorDist;
				if ((!C[k]) && (D[k] != null)) {
					if (D[k] < min) {
						min = D[k];
						posMin = k;
					}
				}
			}
			C[posMin] = true;// (6) Marcar u como conocido;
			Vertice<String> v = grafo.listaDeVertices().elemento(posMin);
			ady = grafo.listaDeAdyacentes(v);
			ady.comenzar();
			while (!ady.fin()) {// (7) para cada vértice w Є V adyacente a u
				Arista<String> arista = ady.proximo();
				l = arista.verticeDestino().posicion();
				if (!C[l]) {// (8) si (w no está conocido)
					Vertice<String> w = arista.verticeDestino();
					if (D[l] > (D[v.posicion()] + arista.peso())) {// (9) si (Dw > Du + c(u,w)) {
						D[l] = (D[v.posicion()] + arista.peso());// (10) Dw = Du + c(u,w);
						P[l] = v.posicion();// (11) Pw = u;
					}
					if (arista.verticeDestino().dato().equals(ciudad2)) {
						llegue = true;
						k = j;
						break;
					}
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

	@SuppressWarnings("unused")
	private void caminoMinNoPesado(int i, Grafo<String> grafo, ListaGenericaEnlazada<String> lis, String ciudad2) {
		ListaGenerica<Arista<String>> ady = null;
		Integer[] D = new Integer[mapaCiudades.listaDeVertices().tamanio()];
		Integer[] P = new Integer[mapaCiudades.listaDeVertices().tamanio()];
		int j, k = i;
		boolean llegue = false;
		for (j = 0; j < grafo.listaDeVertices().tamanio(); j++) {
			D[j] = null;
			P[j] = 0;
		}
		Cola<Vertice<String>> q = new Cola<Vertice<String>>();
		q.encolar(grafo.listaDeVertices().elemento(i));
		D[i] = 0;
		while (!q.esVacia() && !llegue) {
			Vertice<String> v = q.desencolar();
			ady = grafo.listaDeAdyacentes(v);
			ady.comenzar();
			while (!ady.fin()) {
				Arista<String> arista = ady.proximo();
				j = arista.verticeDestino().posicion();
				if (D[j] == null) {
					Vertice<String> w = arista.verticeDestino();
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
	public ListaGenerica<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto) {
		boolean[] marca = new boolean[mapaCiudades.listaDeVertices().tamanio()];
		ListaGenerica<String> res = new ListaGenericaEnlazada<String>();
		boolean llegue = false;
		int i = -1;
		ListaGenerica<Vertice<String>> vert = mapaCiudades.listaDeVertices();
		vert.comenzar();
		while (!vert.fin() && !llegue) {
			Vertice<String> dest = vert.proximo();
			if (dest.dato().equals(ciudad1)) {
				i = dest.posicion();
				llegue = true;
			}
		}
		if (i >= 0) {
			llegue = false;
			llegue = this.caminoSinCargarCombustible(i, mapaCiudades, res, ciudad2, tanqueAuto, marca);
			if (!llegue && (res.tamanio() == 1)) {
				res.eliminarEn(0);
			}
		}
		return res;
	}

	private boolean caminoSinCargarCombustible(int i, Grafo<String> grafo, ListaGenerica<String> lis, String ciudad2,
			int tanqueAuto, boolean[] marca) {
		marca[i] = true;
		Vertice<String> v = grafo.listaDeVertices().elemento(i);
		lis.agregarFinal(v.dato());
		if (v.dato().equals(ciudad2)) {
			return true;
		} else {
			ListaGenerica<Arista<String>> ady = grafo.listaDeAdyacentes(v);
			ady.comenzar();
			boolean llegue = false;
			while (!ady.fin() && !llegue) {
				Arista<String> arista = ady.proximo();
				if ((tanqueAuto - arista.peso()) >= 0) {
					int j = arista.verticeDestino().posicion();
					if (!marca[j]) {
						llegue = this.caminoSinCargarCombustible(j, grafo, lis, ciudad2, tanqueAuto - arista.peso(),
								marca);
					}
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
	 * El método caminoConMenorCargaDeCombustible (String ciudad1, String ciudad2,
	 * int tanqueAuto): ListaGenerica<String> // Retorna la lista de ciudades que
	 * forman un camino para llegar de ciudad1 a ciudad2 teniendo en cuenta que el
	 * auto debe cargar la menor cantidad de veces. El auto no se debe quedar sin
	 * combustible en medio de una ruta, además puede completar su tanque al llegar
	 * a cualquier ciudad. Si no existe camino retorna la lista vacía.
	 */
	public ListaGenericaEnlazada<String> caminoConMenorCargaDeCombustible(String ciudad1, String ciudad2,
			int tanqueAuto) {
		ListaGenericaEnlazada<String> res = new ListaGenericaEnlazada<String>();
		ListaGenericaEnlazada<String> lis = new ListaGenericaEnlazada<String>();
		boolean[] marca = new boolean[mapaCiudades.listaDeVertices().tamanio()];
		Peso min = new Peso();
		min.minimo();
		int peso = 0;
		boolean llegue = false;
		int i = -1;
		ListaGenerica<Vertice<String>> vert = mapaCiudades.listaDeVertices();
		vert.comenzar();
		while (!vert.fin() && !llegue) {
			Vertice<String> dest = vert.proximo();
			if (dest.dato().equals(ciudad1)) {
				i = dest.posicion();
				llegue = true;
			}
		}
		if (i >= 0) {
			llegue = false;
			this.caminoConMenorCargaDeCombustible(i, mapaCiudades, res, min, lis, peso, tanqueAuto, tanqueAuto, ciudad2,
					marca);
		}
		return res;
	}

	private void caminoConMenorCargaDeCombustible(int i, Grafo<String> grafo, ListaGenericaEnlazada<String> res,
			Peso min, ListaGenericaEnlazada<String> lis, int peso, int tanqueAuto, int lleno, String ciudad2,
			boolean[] marca) {
		marca[i] = true;
		Vertice<String> v = grafo.listaDeVertices().elemento(i);
		lis.agregarFinal(v.dato());
		if (v.dato().equals(ciudad2)) {
			if (peso < min.getPeso()) {
				res.comenzar();
				while (!res.esVacia()) {
					res.eliminarEn(0);
				}
				lis.comenzar();
				while (!lis.fin()) {
					res.agregarFinal(lis.proximo());
				}
				min.setPeso(peso);
			}
		} else {
			ListaGenerica<Arista<String>> ady = grafo.listaDeAdyacentes(v);
			Arista<String> arista;
			ady.comenzar();
			while (!ady.fin()) {
				arista = ady.proximo();
				int j = arista.verticeDestino().posicion();
				if (lleno >= arista.peso()) {
					if ((tanqueAuto - arista.peso()) >= 0) {
						if (!marca[j]) {
							this.caminoConMenorCargaDeCombustible(j, grafo, res, min, lis, peso + 1,
									lleno - arista.peso(), lleno, ciudad2, marca);
						}
					} else {
						if (!marca[j]) {
							this.caminoConMenorCargaDeCombustible(j, grafo, res, min, lis, peso,
									tanqueAuto - arista.peso(), lleno, ciudad2, marca);
						}
					}
				}

			}
		}
		lis.eliminarEn(lis.tamanio() - 1);
		marca[i] = false;
	}

}
