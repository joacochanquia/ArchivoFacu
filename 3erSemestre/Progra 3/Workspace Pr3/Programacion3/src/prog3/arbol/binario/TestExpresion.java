package prog3.arbol.binario;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;



public class TestExpresion {
	
	Expresion e = new Expresion();
	
	ArbolBinario<Character> arbolExpresion;
	String postfija = "abd*c+*efg*++";
	String prefija = "+*a+*bdc+e*fg";
	String infija = "((a*((b*d)+c))+(e+(f*g)))";
	
	ArbolBinario<Character> arbol;
	
	@Before
	public void setUp() throws Exception {
		
		/*
		 *              +
		 *          /       \   
		 *         *         +   
		 *       /   \     /   \
		 *      a     +   e     *
		 *           / \       / \
		 *          *   c     f   g
		 *         / \
		 * 	      b   d
		 * */
		
		arbolExpresion=new ArbolBinario<Character>('+');		
		ArbolBinario<Character> hijoIzquierdo=new ArbolBinario<Character>('*');
		hijoIzquierdo.agregarHijoIzquierdo(new ArbolBinario<Character>('a'));
		hijoIzquierdo.agregarHijoDerecho(new ArbolBinario<Character>('+'));	
		hijoIzquierdo.getHijoDerecho().agregarHijoIzquierdo(new ArbolBinario<Character>('*'));
		hijoIzquierdo.getHijoDerecho().getHijoIzquierdo().agregarHijoIzquierdo(new ArbolBinario<Character>('b'));
		hijoIzquierdo.getHijoDerecho().getHijoIzquierdo().agregarHijoDerecho(new ArbolBinario<Character>('d'));
		hijoIzquierdo.getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Character>('c'));
		ArbolBinario<Character> hijoDerecho=new ArbolBinario<Character>('+');
		hijoDerecho.agregarHijoIzquierdo(new ArbolBinario<Character>('e'));
		hijoDerecho.agregarHijoDerecho(new ArbolBinario<Character>('*'));
		hijoDerecho.getHijoDerecho().agregarHijoIzquierdo(new ArbolBinario<Character>('f'));
		hijoDerecho.getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Character>('g'));
		arbolExpresion.agregarHijoIzquierdo(hijoIzquierdo);
		arbolExpresion.agregarHijoDerecho(hijoDerecho);
		
		arbolExpresion.recorridoPorNiveles();
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	
	@Test
	public void testConvertirPostFija(){
		arbol = e.convertirPostfija(postfija);
		assertEquals(arbolExpresion.getDato(), arbol.getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getDato(), arbol.getHijoIzquierdo().getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getHijoIzquierdo().getDato(), arbol.getHijoIzquierdo().getHijoIzquierdo().getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getHijoDerecho().getDato(), arbol.getHijoIzquierdo().getHijoDerecho().getDato());
		assertEquals(arbolExpresion.getHijoDerecho().getDato(), arbol.getHijoDerecho().getDato());
	}
	
	@Test
	public void testConvertirPreFija(){
		arbol = e.convertirPrefija(prefija);
		assertEquals(arbolExpresion.getDato(), arbol.getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getDato(), arbol.getHijoIzquierdo().getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getHijoIzquierdo().getDato(), arbol.getHijoIzquierdo().getHijoIzquierdo().getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getHijoDerecho().getDato(), arbol.getHijoIzquierdo().getHijoDerecho().getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getHijoDerecho().getHijoIzquierdo().getDato(), arbol.getHijoIzquierdo().getHijoDerecho().getHijoIzquierdo().getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getHijoDerecho().getHijoIzquierdo().getHijoIzquierdo().getDato(), arbol.getHijoIzquierdo().getHijoDerecho().getHijoIzquierdo().getHijoIzquierdo().getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getHijoDerecho().getHijoIzquierdo().getHijoDerecho().getDato(), arbol.getHijoIzquierdo().getHijoDerecho().getHijoIzquierdo().getHijoDerecho().getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getHijoDerecho().getHijoDerecho().getDato(), arbol.getHijoIzquierdo().getHijoDerecho().getHijoDerecho().getDato());
		assertEquals(arbolExpresion.getHijoDerecho().getDato(), arbol.getHijoDerecho().getDato());
	}
	
	@Test
	public void testConvertirInFija(){
		arbol = e.convertirInfija(infija);
		assertEquals(arbolExpresion.getDato(), arbol.getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getDato(), arbol.getHijoIzquierdo().getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getHijoIzquierdo().getDato(), arbol.getHijoIzquierdo().getHijoIzquierdo().getDato());
		assertEquals(arbolExpresion.getHijoIzquierdo().getHijoDerecho().getDato(), arbol.getHijoIzquierdo().getHijoDerecho().getDato());
		assertEquals(arbolExpresion.getHijoDerecho().getDato(), arbol.getHijoDerecho().getDato());
	}
	
	@Test
	public void testPostFija(){
		assertEquals(postfija, e.Postfija(arbolExpresion));
	}
	
	@Test
	public void testPreFija(){
		assertEquals(prefija, e.Prefija(arbolExpresion));
	}
	
	@Test
	public void testInFija(){
		assertEquals(infija, e.Infija(arbolExpresion));
	}
	
}
