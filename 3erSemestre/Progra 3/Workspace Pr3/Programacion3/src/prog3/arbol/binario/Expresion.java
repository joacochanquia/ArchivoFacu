package prog3.arbol.binario;

import prog3.util.Pila;

public class Expresion {

	public ArbolBinario<Character> convertirPostfija(String exp) {
		Character c = null;
		ArbolBinario<Character> result;
		Pila<ArbolBinario<Character>> p = new Pila<ArbolBinario<Character>>();
		for (int i = 0; i < exp.length(); i++) {
			c = exp.charAt(i);
			result = new ArbolBinario<Character>(c);
			if ((c == '+') || (c == '-') || (c == '/') || (c == '*')) {
				// Es operador
				result.agregarHijoDerecho(p.desapilar());
				result.agregarHijoIzquierdo(p.desapilar());
			}
			p.apilar(result);
		}
		return (p.desapilar());
	}

	public String Postfija(ArbolBinario<Character> arbol) {
		String salida = new String();
		if (arbol.tieneHijoIzquierdo()) {
			salida = salida + this.Postfija(arbol.getHijoIzquierdo());
		}
		if (arbol.tieneHijoDerecho()) {
			salida = salida + this.Postfija(arbol.getHijoDerecho());
		}
		salida = salida + arbol.getDato();
		return salida;
	}

	public ArbolBinario<Character> convertirPrefija(String exp){
		StringBuffer expB = new StringBuffer(exp);
		return this.convertirPrefija(expB);
	}
	
	private ArbolBinario<Character> convertirPrefija(StringBuffer exp) {
		Character c = exp.charAt(0);
		ArbolBinario<Character> result = new ArbolBinario<Character>(c);
		if ((c == '+') || (c == '-') || (c == '/') || c == '*') {
			// es operador
			result.agregarHijoIzquierdo(this.convertirPrefija(exp.delete(0,1)));
			result.agregarHijoDerecho(this.convertirPrefija(exp.delete(0,1)));
		}
		// es operando
		return result;
	}

	public String Prefija(ArbolBinario<Character> arbol) {
		String salida = new String();
		salida = salida + arbol.getDato();
		if (arbol.tieneHijoIzquierdo()) {
			salida = salida + this.Prefija(arbol.getHijoIzquierdo());
		}
		if (arbol.tieneHijoDerecho()) {
			salida = salida + this.Prefija(arbol.getHijoDerecho());
		}
		return salida;
	}

	public ArbolBinario<Character> convertirInfija(String exp) {
		Character c = exp.charAt(0);
		String salida = new String();
		Pila<Character> p = new Pila<Character>();
		for (int i = 0; i < exp.length(); i++) {
			c = exp.charAt(i);
			if ((c == '+') || (c == '-') || (c == '/') || (c == '*') || (c == '(') || (c == ')')) {
				switch (c) {
				case '+', '-':
					// menor o igual prioridad que el tope
					if (p.tope() == '+' || p.tope() == '-') {
						salida = salida + p.desapilar();
						continue;
					}
					// mayor prioridad que el tope
					if (p.esVacia() || p.tope() == '(') {
						p.apilar(c);
					}
					break;
				case '*', '/':
					//menor o igual prioridad que el tope
					if (p.tope() == '*' || p.tope() == '/') {
						salida = salida + p.desapilar();
						continue;
					}
					//mayor prioridad que el tope
					if (p.esVacia() || p.tope() == '(' || p.tope() == '+' || p.tope() == '-') {
						p.apilar(c);
					}
					break;
				case '(':
					p.apilar(c);
					break;
				case ')':
					while (p.tope() != '(') {
						salida = salida + p.desapilar();
					}
					p.desapilar();
					break;
				}
			}
			else {
				// Es operando
				salida = salida + c;
			}
		}
		return this.convertirPostfija(salida);
	}

	public String Infija(ArbolBinario<Character> arbol) {
		String salida = new String();
		if (!arbol.esHoja()) {
			salida = salida + '(';	
		}
		if (arbol.tieneHijoIzquierdo()) {
			salida = salida + this.Infija(arbol.getHijoIzquierdo());
		}
		salida = salida + arbol.getDato();
		if (arbol.tieneHijoDerecho()) {
			salida = salida + this.Infija(arbol.getHijoDerecho());
		}
		if (!arbol.esHoja()) {
			salida = salida + ')';	
		}
		return salida;
	}

	public Integer evaluar(ArbolBinario<Character> arbol) {
		Character c = arbol.getDato();
		if ((c == '+') || (c == '-') || (c == '/') || c == '*') {
			// es operador
			int operador_1 = evaluar(arbol.getHijoIzquierdo());
			int operador_2 = evaluar(arbol.getHijoDerecho());
			switch (c) {
			case '+':
				return operador_1 + operador_2;
			case '-':
				return operador_1 - operador_2;
			case '*':
				return operador_1 * operador_2;
			case '/':
				return operador_1 / operador_2;
			}
		}
		// es operando
		return Integer.parseInt(c.toString());
	}

}
