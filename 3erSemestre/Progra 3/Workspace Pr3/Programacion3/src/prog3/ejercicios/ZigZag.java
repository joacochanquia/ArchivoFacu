package prog3.ejercicios;

import prog3.arbol.binario.ArbolBinario;
import prog3.listagenerica.ListaGenerica;
import prog3.listagenerica.ListaGenericaEnlazada;

public class ZigZag {

	public ListaGenerica<Character> decifrarCodigo(ArbolBinario<Character> a, ListaGenerica<String> listaDeSecuencias) {
		listaDeSecuencias.comenzar();
		ListaGenericaEnlazada<Character> mensaje = new ListaGenericaEnlazada<Character>();
		while (!listaDeSecuencias.fin()) {
			mensaje.agregarFinal(decifrarCodigoRec(a, listaDeSecuencias.proximo(), 0));
		}
		return mensaje;
	}

	private Character decifrarCodigoRec(ArbolBinario<Character> a, String codigo, int pos) {
		if (a.esHoja()) {
			return a.getDato();
		} else {
			if (codigo.charAt(pos) == '0') {
				return decifrarCodigoRec(a.getHijoIzquierdo(), codigo, pos + 1);
			} else {
				return decifrarCodigoRec(a.getHijoDerecho(), codigo, pos + 1);
			}
		}

	}

	public void imprimirLetrasOrdenadasSegunLaEstructura(ArbolBinario<Character> a) {
		if (a.tieneHijoIzquierdo()) {
			imprimirLetrasOrdenadasSegunLaEstructura(a.getHijoIzquierdo());
		}
		if (a.esHoja()) {
			System.out.println(a.getDato());
		}
		if (a.tieneHijoDerecho()) {
			imprimirLetrasOrdenadasSegunLaEstructura(a.getHijoDerecho());
		}
	}

}
