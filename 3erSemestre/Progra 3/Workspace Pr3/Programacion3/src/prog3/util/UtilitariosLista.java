package prog3.util;
import prog3.listaenteros.*;

public class UtilitariosLista {
	public static ListaDeEnterosEnlazada mergeSort(ListaDeEnterosEnlazada listaParam) {
		
		if (listaParam.tamanio()<=1) {
			return listaParam;
		}
		
		int i;
		int med = (listaParam.tamanio()/2);
		listaParam.comenzar();
		
		ListaDeEnterosEnlazada left = new ListaDeEnterosEnlazada();
		for (i = 0; i < med; i++) {
	        left.agregarFinal(listaParam.proximo());
	    }
		left = mergeSort(left);
		
		ListaDeEnterosEnlazada right = new ListaDeEnterosEnlazada();
		for (i = med; !listaParam.fin(); i++) {
			right.agregarFinal(listaParam.proximo());
	    }
		right = mergeSort(right);
		
		
		return sort(left, right);
	}

	public static ListaDeEnterosEnlazada sort(ListaDeEnterosEnlazada lista, ListaDeEnterosEnlazada listaParam) {
		ListaDeEnterosEnlazada r = new ListaDeEnterosEnlazada();
		lista.comenzar();
		listaParam.comenzar();
		if (!lista.esVacia() && !listaParam.esVacia()) {
			int t = lista.proximo();
			int p = listaParam.proximo();
			while (!lista.fin() && !listaParam.fin()) {
				if (t <= p) {//
					r.agregarFinal(t);
					t = lista.proximo();
				} else {
					r.agregarFinal(p);
					p = listaParam.proximo();
				}
			}
			// una de las listas termino
			// ambas terminaron? caso listas de un nodo
			if (lista.fin() && listaParam.fin()) {
				if (p < t) {
					r.agregarFinal(p);//
					r.agregarFinal(t);//
				} else {
					r.agregarFinal(t);//
					r.agregarFinal(p);//
				}
			}
			else {
				//si termino la lista this
				if (lista.fin()) {
					//si el dato que quedo es menor
					if (t<=p) {
						r.agregarFinal(t);
						r.agregarFinal(p);
						while (!listaParam.fin()) r.agregarFinal(listaParam.proximo());
					}
					//si el dato que quedo es mayor
					else {
						while (!listaParam.fin() && (p < t)) {
							r.agregarFinal(p);
							p = listaParam.proximo();
						}
						//si la lista termino compruebo cual es mayor
						if (p < t) {
							r.agregarFinal(p);//
							r.agregarFinal(t);//
						} else {
							r.agregarFinal(t);//
							r.agregarFinal(p);//
						}
						while (!listaParam.fin())
							r.agregarFinal(listaParam.proximo());
					}
				}
				//termino la lista param
				else {
					//si el dato que quedo es menor
					if (p<=t) {
						r.agregarFinal(p);
						r.agregarFinal(t);
						while (!lista.fin()) r.agregarFinal(lista.proximo());
					}
					//si el dato que quedo es mayor
					else {
						while (!lista.fin() && (t < p)) {
							r.agregarFinal(t);
							t = lista.proximo();
						}
						//si la lista termino compruebo cual es mayor
						if (p < t) {
							r.agregarFinal(p);//
							r.agregarFinal(t);//
						} else {
							r.agregarFinal(t);//
							r.agregarFinal(p);//
						}
						while (!lista.fin())
							r.agregarFinal(lista.proximo());
					}
				}
			}
		}
		else {
			while (!lista.fin())
				r.agregarFinal(lista.proximo());
			while (!listaParam.fin())
				r.agregarFinal(listaParam.proximo());
		}
		return r;
	}

}

/*

if (listaParam.tamanio()<=1) {
			return listaParam;
		}
		int i;
		int med = (listaParam.tamanio()/2);
		listaParam.comenzar();
		
		ListaDeEnterosEnlazada left = new ListaDeEnterosEnlazada();
		for (i = 0; i < med; i++) {
	        left.agregarFinal(listaParam.proximo());
	    }
		left.ordenar();
		mergeSort(left, (fin/2)-1);
		
		ListaDeEnterosEnlazada right = new ListaDeEnterosEnlazada();
		for (i = med; i < fin; i++) {
	        right.agregarFinal(listaParam.proximo());
	    }
		right.ordenar();
		mergeSort(right, fin/2);
		
		listaParam = left.combinarOrdenado(right);
		return listaParam;

*/
/*

if (listaParam.tamanio()<=1) {
			return listaParam
		}
		ListaDeEnterosEnlazada left = new ListaDeEnterosEnlazada();
		ListaDeEnterosEnlazada right = new ListaDeEnterosEnlazada();
		listaParam.comenzar();
		int med = (((fin-ini)/2)+ini);
		int i;
		for (i = ini; i < med; i++) {
	        left.agregarFinal(listaParam.proximo());
	    }
	    for (i = med; i < fin; i++) {
	    	right.agregarFinal(listaParam.proximo());
	    }
	    mergeSort(left, ini, med-1);
	    mergeSort(right, med, fin);
		left = left.combinarOrdenado(right);
		return left;

*/