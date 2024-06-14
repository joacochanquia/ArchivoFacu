package prog3.arbol.binario.util;

import static org.junit.Assert.assertEquals;

import prog3.arbol.binario.ArbolBinario;
import prog3.listagenerica.ListaGenerica;
import prog3.listagenerica.ListaGenericaEnlazada;

public class TestUtiles {

	public static void main(String[] args) {
		
		  ArbolBinario<String> AdivinanzaA;
		  
		  AdivinanzaA = new ArbolBinario<String>("¿Tiene 4 patas?");
		  ArbolBinario<String> AdivinanzaIzq = new ArbolBinario<String>("¿Se mueve?");
		  AdivinanzaIzq.agregarHijoDerecho(new ArbolBinario<String>("ES UNA MESA"));
		  ArbolBinario<String> AdivinanzaIzqIzq = new ArbolBinario<String>("¿Ladra?");
		  AdivinanzaIzqIzq.agregarHijoIzquierdo(new
		  ArbolBinario<String>("ES UN PERRO"));
		  AdivinanzaIzq.agregarHijoIzquierdo(AdivinanzaIzqIzq); ArbolBinario<String>
		  AdivinanzaDer = new ArbolBinario<String>("¿Tiene alguna pata?");
		  AdivinanzaA.agregarHijoIzquierdo(AdivinanzaIzq);
		  AdivinanzaA.agregarHijoDerecho(AdivinanzaDer);
		  
		  ListaGenericaEnlazada<String> listaAdivinanzaEsperada = new
		  ListaGenericaEnlazada<String>();
		  listaAdivinanzaEsperada.agregarFinal("¿Tiene 4 patas?");
		  listaAdivinanzaEsperada.agregarFinal("SI");
		  listaAdivinanzaEsperada.agregarFinal("¿Se mueve?");
		  listaAdivinanzaEsperada.agregarFinal("SI");
		  listaAdivinanzaEsperada.agregarFinal("¿Ladra?");
		  listaAdivinanzaEsperada.agregarFinal("SI");
		  listaAdivinanzaEsperada.agregarFinal("ES UN PERRO");
		  
		  ListaGenerica<String> listaAdivinanzaDeArbolBinario =
		  Adivinanza.secuenciaConMasPreguntas(AdivinanzaA);
		  assertEquals(listaAdivinanzaEsperada.elemento(0),
		  listaAdivinanzaDeArbolBinario.elemento(0));
		  assertEquals(listaAdivinanzaEsperada.elemento(1),
		  listaAdivinanzaDeArbolBinario.elemento(1));
		  assertEquals(listaAdivinanzaEsperada.elemento(2),
		  listaAdivinanzaDeArbolBinario.elemento(2));
		  assertEquals(listaAdivinanzaEsperada.elemento(3),
		  listaAdivinanzaDeArbolBinario.elemento(3));
		  assertEquals(listaAdivinanzaEsperada.elemento(4),
		  listaAdivinanzaDeArbolBinario.elemento(4));
		  assertEquals(listaAdivinanzaEsperada.elemento(5),
		  listaAdivinanzaDeArbolBinario.elemento(5));
		  assertEquals(listaAdivinanzaEsperada.elemento(6),
		  listaAdivinanzaDeArbolBinario.elemento(6)); System.out.println("llll");
		 

		// ----- arbolBinarioA -----

		/*ArbolBinario<Integer> arbolBinarioA;
		arbolBinarioA = new ArbolBinario<Integer>(1);
		ArbolBinario<Integer> hijoIzquierdo = new ArbolBinario<Integer>(2);
		hijoIzquierdo.agregarHijoIzquierdo(new ArbolBinario<Integer>(3));
		hijoIzquierdo.agregarHijoDerecho(new ArbolBinario<Integer>(4));
		ArbolBinario<Integer> hijoDerecho = new ArbolBinario<Integer>(5);
		hijoDerecho.agregarHijoIzquierdo(new ArbolBinario<Integer>(6));
		hijoDerecho.agregarHijoDerecho(new ArbolBinario<Integer>(7));
		arbolBinarioA.agregarHijoIzquierdo(hijoIzquierdo);
		arbolBinarioA.agregarHijoDerecho(hijoDerecho);*/
		
		// ----- arbolBinarioP -----

		ArbolBinario<Integer> arbolBinarioP;
		arbolBinarioP = new ArbolBinario<Integer>(7);
		ArbolBinario<Integer> hijoIzquierdo = new ArbolBinario<Integer>(1);
		hijoIzquierdo.agregarHijoIzquierdo(new ArbolBinario<Integer>(4));
		ArbolBinario<Integer> hijoDerecho = new ArbolBinario<Integer>(3);
		hijoDerecho.agregarHijoIzquierdo(new ArbolBinario<Integer>(2));
		hijoDerecho.agregarHijoDerecho(new ArbolBinario<Integer>(1));
		arbolBinarioP.agregarHijoIzquierdo(hijoIzquierdo);
		arbolBinarioP.agregarHijoDerecho(hijoDerecho);
		
		ListaGenericaEnlazada<Integer> listaPesadaArbolBinario = Utiles.trayectoriaPesada(arbolBinarioP);
		ListaGenericaEnlazada<Integer> listaPesadaEsperada = new ListaGenericaEnlazada<Integer>();
		listaPesadaEsperada.agregarFinal(9);
		listaPesadaEsperada.agregarFinal(7);
		listaPesadaEsperada.agregarFinal(5);
		
		assertEquals(listaPesadaEsperada.elemento(0), listaPesadaArbolBinario.elemento(0));
		assertEquals(listaPesadaEsperada.elemento(1), listaPesadaArbolBinario.elemento(1));
		assertEquals(listaPesadaEsperada.elemento(2), listaPesadaArbolBinario.elemento(2));
			
	//	arbolBinarioA.printInorden();
		
	}

}
