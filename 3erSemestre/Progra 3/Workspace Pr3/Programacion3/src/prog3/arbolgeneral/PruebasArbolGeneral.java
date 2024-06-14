package prog3.arbolgeneral;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import prog3.listagenerica.ListaGenericaEnlazada;

public class PruebasArbolGeneral {
	
	private ArbolGeneral<Integer> ag;
	
	@Before
	public void setUp() throws Exception {
		
		/*
		 *              1
		 *          /   \   \
		 *         2     3   11
		 *       /  \   /  \
		 *      4    5 6    7
		 *     /             \  \   \   \   \
		 *    10              8  12  13  14  700
		 *    /
		 * 	 15
		 * */
		this.ag = new ArbolGeneral<Integer>(1);
		ListaGenericaEnlazada<ArbolGeneral<Integer>> hijos_raiz = new ListaGenericaEnlazada<ArbolGeneral<Integer>>();
		ArbolGeneral<Integer> dos = new ArbolGeneral<Integer>(2);
		ArbolGeneral<Integer> tres = new ArbolGeneral<Integer>(3);
		ArbolGeneral<Integer> once = new ArbolGeneral<Integer>(11);
		hijos_raiz.agregarFinal(dos);
		hijos_raiz.agregarFinal(tres);
		hijos_raiz.agregarFinal(once);
		this.ag.setHijos(hijos_raiz);
		
		ListaGenericaEnlazada<ArbolGeneral<Integer>> hijos_dos = new ListaGenericaEnlazada<ArbolGeneral<Integer>>();
		ArbolGeneral<Integer> cuatro = new ArbolGeneral<Integer>(4);
		ArbolGeneral<Integer> cinco = new ArbolGeneral<Integer>(5);
		hijos_dos.agregarFinal(cuatro);
		hijos_dos.agregarFinal(cinco);
		dos.setHijos(hijos_dos);
		
		ListaGenericaEnlazada<ArbolGeneral<Integer>> hijos_tres = new ListaGenericaEnlazada<ArbolGeneral<Integer>>();
		ArbolGeneral<Integer> seis = new ArbolGeneral<Integer>(6);
		ArbolGeneral<Integer> siete = new ArbolGeneral<Integer>(7);
		hijos_tres.agregarFinal(seis);
		hijos_tres.agregarFinal(siete);
		tres.setHijos(hijos_tres);
		
		ListaGenericaEnlazada<ArbolGeneral<Integer>> hijos_cuatro = new ListaGenericaEnlazada<ArbolGeneral<Integer>>();
		ArbolGeneral<Integer> diez = new ArbolGeneral<Integer>(10);
		hijos_cuatro.agregarFinal(diez);
		cuatro.setHijos(hijos_cuatro);
		
		ListaGenericaEnlazada<ArbolGeneral<Integer>> hijos_siete = new ListaGenericaEnlazada<ArbolGeneral<Integer>>();
		ArbolGeneral<Integer> ocho = new ArbolGeneral<Integer>(8);
		ArbolGeneral<Integer> doce = new ArbolGeneral<Integer>(12);
		ArbolGeneral<Integer> trece = new ArbolGeneral<Integer>(13);
		ArbolGeneral<Integer> catorce = new ArbolGeneral<Integer>(14);
		ArbolGeneral<Integer> setecientos = new ArbolGeneral<Integer>(700);
		hijos_siete.agregarFinal(ocho);
		hijos_siete.agregarFinal(doce);
		hijos_siete.agregarFinal(trece);
		hijos_siete.agregarFinal(catorce);
		hijos_siete.agregarFinal(setecientos);
		siete.setHijos(hijos_siete);
		
		ListaGenericaEnlazada<ArbolGeneral<Integer>> hijos_diez = new ListaGenericaEnlazada<ArbolGeneral<Integer>>();
		ArbolGeneral<Integer> quince = new ArbolGeneral<Integer>(15);
		hijos_diez.agregarFinal(quince);
		diez.setHijos(hijos_diez);
		
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	
	@Test
	public void testAltura() {
		assertEquals(new Integer(4), this.ag.altura());
	}
	
	@Test
	public void testInclude() {
		assertTrue(this.ag.include(4));
		assertTrue(this.ag.include(13));
		assertFalse(this.ag.include(9));
		assertTrue(this.ag.include(1));
	}
	
	@Test
	public void testNivel() {
		assertEquals(new Integer(2), this.ag.nivel(4));
		assertEquals(new Integer(3), this.ag.nivel(13));
		assertEquals(new Integer(-1), this.ag.nivel(9));
		assertEquals(new Integer(0), this.ag.nivel(1));
	}
	
	@Test
	public void testAncho() {
		assertEquals(new Integer(6), this.ag.ancho());
	}
}
