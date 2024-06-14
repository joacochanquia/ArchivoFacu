package prog3.ejercicios.TRIE;

import prog3.arbolgeneral.ArbolGeneral;
import prog3.listagenerica.ListaGenerica;
import prog3.listagenerica.ListaGenericaEnlazada;

public class TestTRIE {

	public static void main(String[] args) {
		ListaGenerica<ArbolGeneral<Character>> l1 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l2 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l3 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l4 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l5 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l6 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l7 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l8 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l9 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l10 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l11 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l12 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l13 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		ListaGenerica<ArbolGeneral<Character>> l14 = new ListaGenericaEnlazada<ArbolGeneral<Character>>();
		
		l14.agregarFinal(new ArbolGeneral<Character>('s'));
		l13.agregarFinal(new ArbolGeneral<Character>('a'));
		l13.agregarFinal(new ArbolGeneral<Character>('o'));
		l12.agregarFinal(new ArbolGeneral<Character>('o'));
		l11.agregarFinal(new ArbolGeneral<Character>('o'));
		l10.agregarFinal(new ArbolGeneral<Character>('o'));
		l9.agregarFinal(new ArbolGeneral<Character>('o'));
		l8.agregarFinal(new ArbolGeneral<Character>('r'));
		l7.agregarFinal(new ArbolGeneral<Character>('r'));
		l6.agregarFinal(new ArbolGeneral<Character>('r'));
		l6.agregarFinal(new ArbolGeneral<Character>('s'));
		l5.agregarFinal(new ArbolGeneral<Character>('y'));
		l4.agregarFinal(new ArbolGeneral<Character>('d'));
		l4.agregarFinal(new ArbolGeneral<Character>('j'));
		l3.agregarFinal(new ArbolGeneral<Character>('e'));
		l3.agregarFinal(new ArbolGeneral<Character>('i'));
		l2.agregarFinal(new ArbolGeneral<Character>('e'));
		l2.agregarFinal(new ArbolGeneral<Character>('o'));
		l2.agregarFinal(new ArbolGeneral<Character>('u'));
		l1.agregarFinal(new ArbolGeneral<Character>('d'));
		l1.agregarFinal(new ArbolGeneral<Character>('t'));
		
		ArbolGeneral<Character> a = new ArbolGeneral<Character>(null,l1);
		
		a.getHijos().elemento(0).setHijos(l2);
		a.getHijos().elemento(1).setHijos(l3);
		
		a.getHijos().elemento(0).getHijos().elemento(0).setHijos(l4);
		a.getHijos().elemento(0).getHijos().elemento(1).setHijos(l5);
		a.getHijos().elemento(0).getHijos().elemento(2).setHijos(l6);
		
		a.getHijos().elemento(1).getHijos().elemento(0).setHijos(l7);
		a.getHijos().elemento(1).getHijos().elemento(1).setHijos(l8);
		
		a.getHijos().elemento(0).getHijos().elemento(0).getHijos().elemento(0).setHijos(l9);
		a.getHijos().elemento(0).getHijos().elemento(0).getHijos().elemento(1).setHijos(l10);
		a.getHijos().elemento(0).getHijos().elemento(2).getHijos().elemento(0).setHijos(l11);
		
		a.getHijos().elemento(1).getHijos().elemento(0).getHijos().elemento(0).setHijos(l12);
		a.getHijos().elemento(1).getHijos().elemento(1).getHijos().elemento(0).setHijos(l13);
		
		a.getHijos().elemento(1).getHijos().elemento(1).getHijos().elemento(0).getHijos().elemento(0).setHijos(l14);
		
		TRIE t = new TRIE(a);
		
		
		System.out.println(t.palabrasQueEmpiezanCon("de"));  
	}

}
