package prog3.arbol.binario.util;

import prog3.arbol.binario.*;
import prog3.listagenerica.*;

public class Adivinanza {
	public static ListaGenericaEnlazada<String> secuenciaConMasPreguntas(ArbolBinario<String> abinario) {
		if (abinario != null) {
			if (abinario.esHoja()) {
				ListaGenericaEnlazada<String> res = new ListaGenericaEnlazada<String>();
				res.agregarFinal(abinario.getDato());
				return res;
			} else {
				ListaGenericaEnlazada<String> izq = secuenciaConMasPreguntas(abinario.getHijoIzquierdo());
				ListaGenericaEnlazada<String> der = secuenciaConMasPreguntas(abinario.getHijoDerecho());
				if ((abinario.tieneHijoIzquierdo()) && (abinario.tieneHijoDerecho())) {
					if (izq.tamanio() > der.tamanio()) {
						izq.agregarInicio("SI");
						izq.agregarInicio(abinario.getDato());
						return izq;
					} else {
						izq.agregarInicio("NO");
						der.agregarInicio(abinario.getDato());
						return der;
					}
				}
				else {
					if(abinario.tieneHijoIzquierdo()) {
						return izq;
					}
					else {
						return der;
					}
				}
			}
		}
		return null;

	}
}
