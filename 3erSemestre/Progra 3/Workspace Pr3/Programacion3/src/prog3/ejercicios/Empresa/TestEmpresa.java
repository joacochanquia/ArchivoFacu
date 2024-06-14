package prog3.ejercicios.Empresa;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import prog3.arbolgeneral.ArbolGeneral;
import prog3.listagenerica.ListaGenericaEnlazada;

public class TestEmpresa {
	
	private Empresa emp;
	private ArbolGeneral<Empleado> ag;
	
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
		 *
		 * */
		this.ag = new ArbolGeneral<Empleado>(new Empleado("Uno", 1, 1));
		ListaGenericaEnlazada<ArbolGeneral<Empleado>> hijos_raiz = new ListaGenericaEnlazada<ArbolGeneral<Empleado>>();
		ArbolGeneral<Empleado> dos = new ArbolGeneral<Empleado>(new Empleado("Dos", 2, 2));
		ArbolGeneral<Empleado> tres = new ArbolGeneral<Empleado>(new Empleado("Tres", 3, 2));
		ArbolGeneral<Empleado> once = new ArbolGeneral<Empleado>(new Empleado("Once", 11, 3));
		hijos_raiz.agregarFinal(dos);
		hijos_raiz.agregarFinal(tres);
		hijos_raiz.agregarFinal(once);
		this.ag.setHijos(hijos_raiz);
		
		ListaGenericaEnlazada<ArbolGeneral<Empleado>> hijos_dos = new ListaGenericaEnlazada<ArbolGeneral<Empleado>>();
		ArbolGeneral<Empleado> cuatro = new ArbolGeneral<Empleado>(new Empleado("Cuatro", 4, 3));
		ArbolGeneral<Empleado> cinco = new ArbolGeneral<Empleado>(new Empleado("Cinco", 5, 3));
		hijos_dos.agregarFinal(cuatro);
		hijos_dos.agregarFinal(cinco);
		dos.setHijos(hijos_dos);
		
		ListaGenericaEnlazada<ArbolGeneral<Empleado>> hijos_tres = new ListaGenericaEnlazada<ArbolGeneral<Empleado>>();
		ArbolGeneral<Empleado> seis = new ArbolGeneral<Empleado>(new Empleado("Seis", 6, 3));
		ArbolGeneral<Empleado> siete = new ArbolGeneral<Empleado>(new Empleado("Siete", 7, 3));
		hijos_tres.agregarFinal(seis);
		hijos_tres.agregarFinal(siete);
		tres.setHijos(hijos_tres);
		
		ListaGenericaEnlazada<ArbolGeneral<Empleado>> hijos_cuatro = new ListaGenericaEnlazada<ArbolGeneral<Empleado>>();
		ArbolGeneral<Empleado> diez = new ArbolGeneral<Empleado>(new Empleado("Diez", 10, 4));
		hijos_cuatro.agregarFinal(diez);
		cuatro.setHijos(hijos_cuatro);
		
		ListaGenericaEnlazada<ArbolGeneral<Empleado>> hijos_siete = new ListaGenericaEnlazada<ArbolGeneral<Empleado>>();
		ArbolGeneral<Empleado> ocho = new ArbolGeneral<Empleado>(new Empleado("Ocho", 8, 4));
		ArbolGeneral<Empleado> doce = new ArbolGeneral<Empleado>(new Empleado("Doce", 12, 4));
		ArbolGeneral<Empleado> trece = new ArbolGeneral<Empleado>(new Empleado("Trece", 13, 4));
		ArbolGeneral<Empleado> catorce = new ArbolGeneral<Empleado>(new Empleado("Catorce", 14, 4));
		ArbolGeneral<Empleado> setecientos = new ArbolGeneral<Empleado>(new Empleado("Setecietos", 700, 4));
		hijos_siete.agregarFinal(ocho);
		hijos_siete.agregarFinal(doce);
		hijos_siete.agregarFinal(trece);
		hijos_siete.agregarFinal(catorce);
		hijos_siete.agregarFinal(setecientos);
		siete.setHijos(hijos_siete);
		
		
		this.emp = new Empresa(ag);
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	@Test
	public void testEmpleadosPorCategoria() {
		assertEquals(new Integer(1), this.emp.empleadosPorCategoria(1));
		assertEquals(new Integer(3), this.emp.empleadosPorCategoria(2));
		assertEquals(new Integer(4), this.emp.empleadosPorCategoria(3));
		assertEquals(new Integer(6), this.emp.empleadosPorCategoria(4));
		assertEquals(new Integer(0), this.emp.empleadosPorCategoria(5));
	}
	
	@Test
	public void testCategoriaConMasEmpleados() {
		assertEquals(new Integer(4), this.emp.categoriaConMasEmpleados());
	}
	
	@Test
	public void testCantidadTotalDeEmpleados() {
		assertEquals(new Integer(14), this.emp.cantidadTotalDeEmpleados());
	}
	
	@Test
	public void testReemplazarPresidente() {
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		assertEquals(new Integer(1), this.emp.empleadosPorCategoria(1));
		assertNotEquals(new Integer(3), this.emp.empleadosPorCategoria(2));
		assertEquals(new Integer(4), this.emp.empleadosPorCategoria(3));
		assertEquals(new Integer(6), this.emp.empleadosPorCategoria(4));
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		assertEquals(new Integer(1), this.emp.empleadosPorCategoria(1));
		assertEquals(new Integer(2), this.emp.empleadosPorCategoria(2));
		assertEquals(new Integer(4), this.emp.empleadosPorCategoria(3));
		assertNotEquals(new Integer(6), this.emp.empleadosPorCategoria(4));
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
		
		this.emp.reemplazarPresidente();
		System.out.println("El presidente es " + this.emp.getEmpleados().getDato().getNombre() + "!");
		System.out.println("Quedan " + this.emp.cantidadTotalDeEmpleados() + " empleados.");
		System.out.println();
	}
	
}
