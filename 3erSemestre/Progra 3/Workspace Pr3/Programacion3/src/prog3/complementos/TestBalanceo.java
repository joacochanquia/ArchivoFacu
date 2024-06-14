package prog3.complementos;

import java.util.Scanner;
import prog3.util.*;


public class TestBalanceo {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		String n = in.next();
		while (!n.equals("0")) {
			if (esBalanceado(n)) {
				System.out.println("Es balanceado");
			}
			else {
				System.out.println("No es balanceado");
			}
			n = in.next();
		}
		in.close();
	}
	
	public static boolean esBalanceado(String s) {
		int  imax = s.length();
		if((imax<2)) { //||((imax%2)!=0)
			return false;
		}
		int i;
		Pila<Character> p = new Pila<Character>();
		boolean resultado = true;
		for(i=0; (i<imax)&&resultado; i++) {
			char d = s.charAt(i);
			if ((d=='(')||(d=='{')||(d=='[')) {
				p.apilar(d);
			}
			else {
				switch(d) {
				case ')':
					if (!(p.esVacia()) && (p.tope()=='('))
						p.desapilar();
					else 
						resultado = false;
					break;
				case ']':
					if (!(p.esVacia()) && (p.tope()=='['))
						p.desapilar();
					else 
						resultado = false;
					break;
				case '}':
					if (!(p.esVacia()) && (p.tope()=='{'))
						p.desapilar();
					else 
						resultado = false;
					break;
				}
			}
		}
	if (!p.esVacia()) resultado = false;
	return resultado;
	}
}
	/*public static boolean esBalanceado(String s) {
		int  imax = s.length();
		if((imax<2)||((imax%2)!=0)) {
			return false;
		}
		int i, contPar=0, contCor=0, contLLav=0;
		boolean resultado=true;
		for(i=0; (i<imax)&&resultado; i++) {
			char d = s.charAt(i);
			switch(d) {
				case '(':
					contPar++;
					break;
				case '[':
					contCor++;
					break;
				case '{':
					contLLav++;
					break;
				case ')':
					if(contPar<=0) {
						resultado=false;
					}
					else contPar--;
					break;
				case ']':
					if(contCor<=0) {
						resultado=false;
					}
					else contCor--;
					break;
				case '}':
					if(contLLav<=0) {
						resultado=false;
					}
					else contLLav--;
					break;
				default: break;
			}
		}
		if(resultado) {
			if ((contCor!=0)||(contLLav!=0)||(contPar!=0)) {
				resultado = false;
			}
		}
		return resultado;
	}
}*/

/*	int i, cont = 0;
Pila<Character> p = new Pila<Character>();
Pila<Character> aux = new Pila<Character>();
boolean resultado = true, sigo;
for(i=0; (i<imax)&&resultado; i++) {
	char d = s.charAt(i);
	if ((d=='(')||(d=='{')||(d=='[')) {
		p.apilar(d);
		cont++;
	}
	else {
		switch(d) {
		case ')':
			sigo = true;
			while ((!p.esVacia())&&sigo) {
				aux.apilar(p.desapilar());
				
			}
			if(resultado) {
				while ((!p.esVacia())&&sigo) {
					p.apilar(aux.desapilar());
				}
			}
			break;
		case ']':
			
			break;
		case '}':
			
			break;
		}
	}
}*/