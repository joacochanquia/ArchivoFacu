package prog3.ejercicios.TRIE;

import prog3.arbolgeneral.ArbolGeneral;
import prog3.listagenerica.*;

public class TRIE {

	private ArbolGeneral<Character> diccionario;

	public TRIE() {
		this.diccionario = new ArbolGeneral<Character>(null); // chequear tema null
	}

	public TRIE(ArbolGeneral<Character> a) {
		this();
		this.diccionario = a;
	}

	public void agregarPalabra(String palabra) {
		this.agregarPalabra(this.diccionario, palabra, 0);
	}

	private void agregarPalabra(ArbolGeneral<Character> arbol, String palabra, int pos) {
		if (palabra.length() > pos) {
			ListaGenerica<ArbolGeneral<Character>> hijos = arbol.getHijos();
			hijos.comenzar();
			boolean seguir = true;
			boolean encontre = false;
			while (!hijos.fin() && seguir && !encontre) {
				ArbolGeneral<Character> hijoAct = hijos.proximo();
				seguir = (hijoAct.getDato().compareTo(palabra.charAt(pos + 1))) <= 0;
				if ((hijoAct.getDato().compareTo(palabra.charAt(pos + 1))) == 0) {
					this.agregarPalabra(hijoAct, palabra, pos + 1);
					encontre = true;
				}
			}
			if (!encontre) {
				// agregar palabra
				ArbolGeneral<Character> arbol2 = new ArbolGeneral<Character>(palabra.charAt(pos));
				//arbol.agregarHijoOrdenado(arbol2);
				arbol.agregarHijo(arbol2);
				ArbolGeneral<Character> arbolAux;
				pos++;
				while (pos < palabra.length()) {
					arbolAux = new ArbolGeneral<Character>(palabra.charAt(pos));
					arbol2.agregarHijo(arbolAux);
					pos++;
					arbol2 = arbolAux;
				}
				// agregarPalabra(arbol2,palabra, pos+1);
			}
		}
	}

	public ListaGenerica<String> palabrasQueEmpiezanCon(String prefijo) {
		ListaGenerica<String> l = new ListaGenericaEnlazada<String>();
		ListaGenerica<ArbolGeneral<Character>> hijos = this.diccionario.getHijos();
		hijos.comenzar();
		boolean seguir = true;
		while (!hijos.fin() && seguir) {
			ArbolGeneral<Character> act = hijos.proximo();
			seguir = act.getDato().compareTo(prefijo.charAt(0)) <= 0;
			if (act.getDato().compareTo(prefijo.charAt(0)) == 0)
				palabrasQueEmpiezanCon(prefijo, act, l, 0, "");
		}
		return l;
	}

	private void palabrasQueEmpiezanCon(String prefijo, ArbolGeneral<Character> arbol, ListaGenerica<String> palabras,
			int pos, String palabraActual) {
		if (arbol.esHoja()) {
			if (pos >= prefijo.length() - 1)
				palabras.agregarFinal(palabraActual + arbol.getDato());
		} else {
			if (prefijo.length()-1 > pos) {
				ListaGenerica<ArbolGeneral<Character>> hijos = arbol.getHijos();
				hijos.comenzar();
				boolean seguir = true;
				while (!hijos.fin() && seguir) {
					ArbolGeneral<Character> act = hijos.proximo();
					seguir = act.getDato().compareTo(prefijo.charAt(pos + 1)) <= 0;
					if (act.getDato().compareTo(prefijo.charAt(pos+1)) == 0)
						palabrasQueEmpiezanCon(prefijo, act, palabras, pos + 1, palabraActual + arbol.getDato());
				}
			} else {
				ListaGenerica<ArbolGeneral<Character>> hijos = arbol.getHijos();
				hijos.comenzar();
				while (!hijos.fin())
					palabrasQueEmpiezanCon(prefijo, hijos.proximo(), palabras, pos + 1,
				palabraActual + arbol.getDato());
			}
		}
	}
}