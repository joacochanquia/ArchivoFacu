package prog3.util;
import prog3.listagenerica.*;

public class Pila<T> {
	
	private ListaGenericaEnlazada<T> datos = new ListaGenericaEnlazada<T>();
	
	public Pila() {

	}
	
	public void apilar(T elem) {
		datos.agregarInicio(elem);
	}

	public T desapilar() {
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
