package prog3.listaenteros;

/**
 * La clase ListaDeEnterosEnlazada es una ListaDeEnteros, donde los elementos de
 * la lista (nodos) referencian al siguiente elemento (nodo), por este motivo,
 * la ListaDeEnterosEnlazada no tiene límite en la cantidad de elementos que se
 * pueden almacenar.
 */
public class ListaDeEnterosEnlazada extends ListaDeEnteros {
	/* primer nodo de la lista, si la lista esta vacia, inicio es null */
	private NodoEntero inicio;

	/*
	 * nodo actual que se va actualizando a medida que recorremos la lista, si la
	 * lista esta vacia, actual es null
	 */
	private NodoEntero actual;

	/* ultimo nodo de la lista, si la lista esta vacia, fin es null */
	private NodoEntero fin;

	/* cantidad de nodos en la lista */
	private int tamanio;

	@Override
	public void comenzar() {
		actual = inicio;
	}

	@Override
	public Integer proximo() {
		Integer elem = this.actual.getDato();
		this.actual = this.actual.getSiguiente();
		return elem;
	}

	@Override
	public boolean fin() {
		return (this.actual == null);
	}

	@Override
	public Integer elemento(int pos) {
		if (pos < 0 || pos > this.tamanio() - 1) // no es posicion valida
			return null;
		NodoEntero n = this.inicio;
		while (pos-- > 0)
			n = n.getSiguiente();
		return n.getDato();
	}

	@Override
	public boolean agregarEn(Integer elem, int pos) {
		if (pos < 0 || pos > this.tamanio()) // posicion no valida
			return false;
		this.tamanio++;
		NodoEntero aux = new NodoEntero();
		aux.setDato(elem);
		if (pos == 0) { // inserta al principio
			aux.setSiguiente(inicio);
			this.inicio = aux;
		} else {
			NodoEntero n = this.inicio;
			NodoEntero ant = null;
			int posActual = 0;
			while (!(n == null) && (posActual < pos)) {
				ant = n;
				n = n.getSiguiente();
				posActual++;
			}
			aux.setSiguiente(n);
			ant.setSiguiente(aux);

			if (aux.getSiguiente() == null)
				this.fin = aux;
		}
		return true;
	}

	@Override
	public boolean agregarInicio(Integer elem) {
		NodoEntero aux = new NodoEntero();
		aux.setDato(elem);

		if (this.inicio == null) {
			this.inicio = aux;
			this.actual = aux;
			this.fin = aux;
		} else {
			aux.setSiguiente(this.inicio);
			this.inicio = aux;
		}
		this.tamanio++;
		return true;
	}

	@Override
	public boolean agregarFinal(Integer elem) {
		NodoEntero aux = new NodoEntero();
		aux.setDato(elem);
		if (this.inicio == null) {
			this.inicio = aux;
			this.actual = aux;
			this.fin = aux;
		} else {
			fin.setSiguiente(aux);
			fin = aux;
		}
		tamanio++;
		return true;
	}

	@Override
	public boolean eliminar(Integer elem) {
		NodoEntero n = this.inicio;
		NodoEntero ant = null;
		while ((n != null) && (!n.getDato().equals(elem))) {
			ant = n;
			n = n.getSiguiente();
		}
		if (n == null)
			return false;
		else {
			if (ant == null)
				this.inicio = this.inicio.getSiguiente();
			else
				ant.setSiguiente(n.getSiguiente());
			this.tamanio--;

			return true;
		}
	}

	@Override
	public boolean eliminarEn(int pos) {
		if (pos < 0 || pos > this.tamanio() - 1) // posicion no valida
			return false;
		this.tamanio--;
		if (pos == 0) {
			this.inicio = this.inicio.getSiguiente();
			return true;
		}
		NodoEntero n = this.inicio;
		NodoEntero ant = null;
		while (!(n == null) && (pos > 0)) {
			pos--;
			ant = n;
			n = n.getSiguiente();
		}
		ant.setSiguiente(n.getSiguiente());
		if (ant.getSiguiente() == null)
			this.fin = ant;
		return true;
	}

	@Override
	public boolean incluye(Integer elem) {
		NodoEntero n = this.inicio;
		while (!(n == null) && !(n.getDato().equals(elem)))
			n = n.getSiguiente();
		return !(n == null);
	}

	@Override
	public String toString() {
		String str = "";
		NodoEntero n = this.inicio;
		while (n != null) {
			str = str + n.getDato() + " -> ";
			n = n.getSiguiente();
		}
		if (str.length() > 1)
			str = str.substring(0, str.length() - 4);
		return str;
	}

	@Override
	public int tamanio() {
		return this.tamanio;
	}

	@Override
	public boolean esVacia() {
		return this.tamanio() == 0;
	}

	public ListaDeEnterosEnlazada ordenar() {
		ListaDeEnterosEnlazada r = new ListaDeEnterosEnlazada();
		int min = 30999999, n = 0, anterior = -30999999;
		this.comenzar();
		while ((this.tamanio() != r.tamanio()) && !this.fin()) {
			min = 30999999;
			while (!this.fin()) {
				n = this.proximo();
				if ((n < min) && (n > anterior)) {
					min = n;
				}
			}
			r.agregarFinal(min);
			anterior = min;
			this.comenzar();
		}
		return r;
	}

	public ListaDeEnterosEnlazada combinarOrdenado(ListaDeEnterosEnlazada listaParam) {
		ListaDeEnterosEnlazada r = new ListaDeEnterosEnlazada();
		this.comenzar();
		listaParam.comenzar();
		if (!this.esVacia() && !listaParam.esVacia()) {
			int t = this.proximo();
			int p = listaParam.proximo();
			while (!this.fin() && !listaParam.fin()) {
				if (t <= p) {//
					r.agregarFinal(t);
					t = this.proximo();
				} else {
					r.agregarFinal(p);
					p = listaParam.proximo();
				}
			}
			// una de las listas termino
			// ambas terminaron? caso listas de un nodo
			if (this.fin() && listaParam.fin()) {
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
				if (this.fin()) {
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
						while (!this.fin()) r.agregarFinal(this.proximo());
					}
					//si el dato que quedo es mayor
					else {
						while (!this.fin() && (t < p)) {
							r.agregarFinal(t);
							t = this.proximo();
						}
						//si la lista termino compruebo cual es mayor
						if (p < t) {
							r.agregarFinal(p);//
							r.agregarFinal(t);//
						} else {
							r.agregarFinal(t);//
							r.agregarFinal(p);//
						}
						while (!this.fin())
							r.agregarFinal(this.proximo());
					}
				}
			}
		}
		else {
			while (!this.fin())
				r.agregarFinal(this.proximo());
			while (!listaParam.fin())
				r.agregarFinal(listaParam.proximo());
		}
		return r;
	}
}
/*	public ListaDeEnterosEnlazada cominarOrdenado(ListaDeEnterosEnlazada listaParam) {
		ListaDeEnterosEnlazada r = new ListaDeEnterosEnlazada();
		this.comenzar();
		listaParam.comenzar();
		int t = 0, p = 0;
		if ((!this.fin()) && (!listaParam.fin())) {
			t = this.proximo();
			p = listaParam.proximo();
			while ((!this.fin()) && (!listaParam.fin())) {
				if (this.getDatoActual() < listaParam.getDatoActual()) {
					r.agregarFinal(t);
					t = this.proximo();
				} else {
					r.agregarFinal(p);
					p = listaParam.proximo();
				}
			}
			if (this.fin()) {

				r.agregarFinal(t);
			} else
				r.agregarFinal(p);
		}
		if (this.fin()) {
			if (!this.esVacia()) {
				r.agregarFinal(p);
			}
			while (!listaParam.fin()) {
				r.agregarFinal(listaParam.proximo());
			}
		}
		if (listaParam.fin()) {
			if (!listaParam.esVacia()) {
				r.agregarFinal(p);
			}
			while (!this.fin()) {
				r.agregarFinal(this.proximo());
			}
		}

		return r;

	}
	
} else {
	if (this.fin()) {//
		if (listaParam.fin()) {//
			if (p < t) {
				r.agregarFinal(p);//
				r.agregarFinal(t);//
			} else {
				r.agregarFinal(t);//
				r.agregarFinal(p);//
			}
		} //
		else {
			while (!listaParam.fin() && p < t) {
				r.agregarFinal(p);
				p = listaParam.proximo();
			}
			r.agregarFinal(t);
			if (listaParam.fin())
				r.agregarFinal(p);//
			else {
				r.agregarFinal(p);//
				while (!listaParam.fin())
					r.agregarFinal(listaParam.proximo());
			}
		}
	} else {
		while (!this.fin() && t < p) {
			r.agregarFinal(t);
			t = this.proximo();
		}
		r.agregarFinal(p);
		if (this.fin())
			r.agregarFinal(t);//
		else {
			r.agregarFinal(t);//
			while (!this.fin())
				r.agregarFinal(this.proximo());
		}
	}
}
} else {
while (!this.fin())
	r.agregarFinal(this.proximo());
while (!listaParam.fin())
	r.agregarFinal(listaParam.proximo());
}
}
/*
 * while(!this.fin()) { r.agregarFinal(this.proximo()); }
 * while(!listaParam.fin()) { r.agregarFinal(listaParam.proximo()); }
 * 
 * 
 * if(this.fin()) { if(num < num2) { r.agregarFinal(num);
 * while(!listaParam.fin()) { r.agregarFinal(listaParam.proximo()); } } else {
 * while(!listaParam.fin()) { if(num < num2) { r.agregarFinal(num); num }
 * r.agregarFinal(listaParam.proximo()); } } } if(listaParam.fin()) {
 * 
 * }
 * 
 * while(!this.fin()) { if(num < num2) { r.agregarFinal(num); num =
 * this.proximo(); } else { r.agregarFinal(num2); } } while(!listaParam.fin()) {
 * if(num2 < num) { r.agregarFinal(num2); num2 = listaParam.proximo(); } else {
 * r.agregarFinal(num); } }
 * 
 * 
 * 
 * 
 * 
 * 
 * while(!this.fin()&&!listaParam.fin()) { if(num < num2) { r.agregarFinal(num);
 * num = this.proximo(); } else { r.agregarFinal(num2); num2 =
 * listaParam.proximo(); } } //Hasta que una de las dos listas se acabe
 * while(!this.fin()) { if(num < num2) { r.agregarFinal(num); num =
 * this.proximo();
 * 
 * } else { r.agregarFinal(num2); num2 = 31999999; } } while(!listaParam.fin())
 * { if(num2 < num) { r.agregarFinal(num2); num2 = listaParam.proximo(); } else
 * { r.agregarFinal(num); num = 31999999; } } //Despues de terminar agregar los
 * ultimos valores if(num < num2) { r.agregarFinal(num); r.agregarFinal(num2);;
 * } else { r.agregarFinal(num2); r.agregarFinal(num);; }
 * 
 * 
 * public ListaDeEnterosEnlazada combinarOrdenado(ListaDeEnterosEnlazada
 * listaParam) { ListaDeEnterosEnlazada r = new ListaDeEnterosEnlazada();
 * this.comenzar(); listaParam.comenzar();
 * while((!this.fin())&&(!listaParam.fin())) { if(this.getDatoActual() <
 * listaParam.getDatoActual()) { r.agregarFinal(this.proximo()); } else {
 * r.agregarFinal(listaParam.proximo()); } } while(!this.fin()) {
 * r.agregarFinal(this.proximo()); } while(!listaParam.fin()) {
 * r.agregarFinal(listaParam.proximo()); }
 * 
 * return r; }
 * 
 * public ListaDeEnterosEnlazada combinarOrdenado(ListaDeEnterosEnlazada
 * listaParam) { ListaDeEnterosEnlazada r = new ListaDeEnterosEnlazada();
 * this.comenzar(); listaParam.comenzar(); //veo si una es vacia if
 * (this.esVacia()||listaParam.esVacia()) { if (this.esVacia()) {
 * while(!listaParam.fin()) { r.agregarFinal(listaParam.proximo()); } } else {
 * while(!this.fin()) { r.agregarFinal(this.proximo()); } } } //si no es vacia
 * else { int num = this.proximo(); int num2 = listaParam.proximo();
 * while(!this.fin()&&!listaParam.fin()) { if(num < num2) { r.agregarFinal(num);
 * num = this.proximo(); } else { r.agregarFinal(num2); num2 =
 * listaParam.proximo(); } } //Hasta que una de las dos listas se acabe boolean
 * sigo = true; if(this.fin()) { if(num < num2) { r.agregarFinal(num);
 * r.agregarFinal(num2); while(!listaParam.fin()) {
 * r.agregarFinal(listaParam.proximo()); } } else {
 * while(!listaParam.fin()&&sigo) { if(num < num2) { r.agregarFinal(num);
 * sigo=false; } else r.agregarFinal(listaParam.proximo()); } if (sigo) {
 * r.agregarFinal(num); } else { r.agregarFinal(num2); while(!listaParam.fin())
 * { r.agregarFinal(listaParam.proximo()); } } } } else { if(num2 < num) {
 * r.agregarFinal(num2); r.agregarFinal(num); while(!this.fin()) {
 * r.agregarFinal(this.proximo()); } } else { while(!this.fin()&&sigo) { if(num2
 * < num) { r.agregarFinal(num2); sigo=false; } else
 * r.agregarFinal(this.proximo()); } if (sigo) { r.agregarFinal(num2); } else {
 * r.agregarFinal(num); while(!this.fin()) { r.agregarFinal(this.proximo()); } }
 * } } } return r; }
 */