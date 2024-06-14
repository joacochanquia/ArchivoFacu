package prog3.util;
import prog3.listagenerica.*;

public class Cola<T> {
	
	private ListaGenericaEnlazada<T> datos = new ListaGenericaEnlazada<T>();
	
	public Cola() {

	}
	
	public void encolar(T elem) {
		datos.agregarFinal(elem);
	}

	public T desencolar() {
		T elem = datos.elemento(0);
		datos.eliminarEn(0);
		return elem;
	}

	public T tope() {
		return datos.elemento(0);
	}

	public boolean esVacia() {
		return datos.esVacia();
	}
	
}
