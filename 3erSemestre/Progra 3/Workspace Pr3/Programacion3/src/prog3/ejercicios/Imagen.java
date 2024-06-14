package prog3.ejercicios;

import prog3.arbolgeneral.ArbolGeneral;
import prog3.listagenerica.ListaGenerica;
import prog3.listagenerica.ListaGenericaEnlazada;

public class Imagen {

	private boolean[][] imagen;

	public Imagen(int num) {
		imagen = new boolean[num][num];
	}

	private Imagen(Imagen img, int dim, int fromFila, int fromColumna) {
		this(dim);
		for (int i = fromFila; i < dim + fromFila; i++) {
			for (int j = fromColumna; j < dim + fromColumna; j++) {
				set(i, j, img.get(i, j));
			}
		}
	}

	private Imagen(Imagen img, int num, int nada) { // num es el numero del cuadrante
		this(img.imagen.length / 2);
		int aux = img.imagen.length / 2;
		switch (num) {
		case 0:
			for (int i = 0; i < aux; i++) {
				for (int j = 0; j < aux; j++) {
					set(i, j, img.get(i, j));
				}
			}
			break;
		case 1:
			for (int i = 0; i < aux; i++) {
				for (int j = aux; j < img.imagen.length; j++) {
					set(i, j - aux, img.get(i, j));
				}
			}
			break;
		case 2:
			for (int i = aux; i < img.imagen.length; i++) {
				for (int j = 0; j < aux; j++) {
					set(i - aux, j, img.get(i, j));
				}
			}
			break;
		case 3:
			for (int i = aux; i < img.imagen.length; i++) {
				for (int j = aux; j < img.imagen.length; j++) {
					set(i - aux, j - aux, img.get(i, j));
				}
			}
			break;
		}

	}

	private Imagen(Imagen img, int num) {
		// testing
		int aux = img.imagen.length / 2;
		int auxF, auxC;
		/*
		switch (num) {
		case 0:
			auxF = 0;
			auxC = 0;
			break;
		case 1:
			auxF = 0;
			auxC = aux;
			break;
		case 2:
			auxF = aux;
			auxC = 0;
			break;
		case 3:
			auxF = aux;
			auxC = aux;
			break;
		}
		*/
		// posibilidad 2
		auxF = 0;
		auxC = 0;
		if (num >= 2) { // (2 o 3) son los cuadrantes de abajo
			auxF = aux;
		}
		if (num % 2 == 1) { // (1 o 3) son los cuadrantes de la derecha
			auxC = aux;
		}

		for (int i = 0; i < aux; i++, auxF++) {
			for (int j = 0; j < aux; j++, auxC++) {
				set(i, j, img.get(auxF, auxC)); // chequear cuenta luego
			}
		}

	}

	public boolean igualColor() {
		boolean b = imagen[0][0];
		for (int i = 0; i < imagen.length; i++) {
			for (int j = 0; j < imagen.length; j++) {
				if (imagen[i][j] != b)
					return false;
			}
		}
		return true;
	}

	public boolean color() {
		return imagen[0][0];
	}

	public ListaGenerica<Imagen> dividirEnSubimagenes() {
		ListaGenerica<Imagen> lista = new ListaGenericaEnlazada<Imagen>();
		/*
		 * int dim = this.imagen.length/2;
		 * 
		 * lista.agregarFinal(new Imagen(this, dim, 0, 0));
		 * 
		 * lista.agregarFinal(new Imagen(this, dim, 0, dim+1));
		 * 
		 * lista.agregarFinal(new Imagen(this, dim, dim+1, 0));
		 * 
		 * lista.agregarFinal(new Imagen(this, dim, dim+1, dim+1));
		 */

		lista.agregarFinal(new Imagen(this, 0));
		lista.agregarFinal(new Imagen(this, 1));
		lista.agregarFinal(new Imagen(this, 2));
		lista.agregarFinal(new Imagen(this, 3));

		return lista;
	}

	public ArbolGeneral<Boolean> imagenComprimida() {
		ArbolGeneral<Boolean> arbol = null;
		if (this.igualColor()) {
			arbol = new ArbolGeneral<Boolean>(this.color());
		} else {
			ListaGenerica<Imagen> auxl = this.dividirEnSubimagenes();
			arbol = new ArbolGeneral<Boolean>(null); // ver
			ArbolGeneral<Boolean> auxArbol;
			auxl.comenzar();
			while (!auxl.fin()) {
				auxArbol = auxl.proximo().imagenComprimida();
				arbol.agregarHijo(auxArbol);
			}
		}

		return arbol;
	}

	public int dimension() {
		return imagen.length;
	}

	public void set(int uno, int dos, boolean b) {
		imagen[uno][dos] = b;
	}

	public boolean get(int uno, int dos) {
		return imagen[uno][dos];
	}
}