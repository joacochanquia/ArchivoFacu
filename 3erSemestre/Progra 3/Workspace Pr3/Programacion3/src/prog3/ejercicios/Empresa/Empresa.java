package prog3.ejercicios.Empresa;

import prog3.arbolgeneral.*;
import prog3.listagenerica.*;
import prog3.util.Cola;

public class Empresa {

	private ArbolGeneral<Empleado> empleados;
	
	public Empresa() {

	}

	public Empresa(ArbolGeneral<Empleado> empleados) {
		super();
		this.empleados = empleados;
	}
	
	public ArbolGeneral<Empleado> getEmpleados() {
		return empleados;
	}
	
	public Integer empleadosPorCategoria(int categoria) {
		if (categoria == 1) {
			return 1;
		}
		ArbolGeneral<Empleado> arbol = null;
		Cola<ArbolGeneral<Empleado>> cola = new Cola<ArbolGeneral<Empleado>>();
		cola.encolar(this.empleados);
		cola.encolar(null);
		int cant_nodos = 0, nivel = 2;
		while (!cola.esVacia()) {
			arbol = cola.desencolar();
			if (arbol != null) {
				if (arbol.tieneHijos()) {
					ListaGenerica<ArbolGeneral<Empleado>> hijos = arbol.getHijos();
					hijos.comenzar();
					while (!hijos.fin()) {
						cola.encolar(hijos.proximo());
						cant_nodos++;
					}
				}
			} 
			else if (!cola.esVacia()) {
				if (categoria!=nivel) {
					nivel++;
					cant_nodos = 0;
					cola.encolar(null);
				}else {
					return cant_nodos;
				}
			}
		}
		return cant_nodos;
	}

	public Integer categoriaConMasEmpleados() {
		ArbolGeneral<Empleado> arbol = null;
		Cola<ArbolGeneral<Empleado>> cola = new Cola<ArbolGeneral<Empleado>>();
		cola.encolar(this.empleados);
		cola.encolar(null);
		int cant_nodos = 0, max = 1, maxNivel = 1, nivel = 2;
		while (!cola.esVacia()) {
			arbol = cola.desencolar();
			if (arbol != null) {
				if (arbol.tieneHijos()) {
					ListaGenerica<ArbolGeneral<Empleado>> hijos = arbol.getHijos();
					hijos.comenzar();
					while (!hijos.fin()) {
						cola.encolar(hijos.proximo());
						cant_nodos++;
					}
				}
			} else if (!cola.esVacia()) {
				if (cant_nodos > max) {
					max = cant_nodos;
					maxNivel = nivel;
				}
				nivel++;
				cant_nodos = 0;
				cola.encolar(null);
			}
		}
		return maxNivel;
	}

	public Integer cantidadTotalDeEmpleados() {
		ArbolGeneral<Empleado> arbol = null;
		Cola<ArbolGeneral<Empleado>> cola = new Cola<ArbolGeneral<Empleado>>();
		cola.encolar(this.empleados);
		cola.encolar(null);
		int cant_nodos = 1;
		while (!cola.esVacia()) {
			arbol = cola.desencolar();
			if (arbol != null) {
				if (arbol.tieneHijos()) {
					ListaGenerica<ArbolGeneral<Empleado>> hijos = arbol.getHijos();
					hijos.comenzar();
					while (!hijos.fin()) {
						cola.encolar(hijos.proximo());
						cant_nodos++;
					}
				}
			} 
			else if (!cola.esVacia()) {
				cola.encolar(null);
			}
		}
		return cant_nodos;
	}

	public void reemplazarPresidente() {
		reemplazo(this.empleados);
	}

	private boolean reemplazo(ArbolGeneral<Empleado> e) {
		if (e.tieneHijos()) {
			ListaGenerica<ArbolGeneral<Empleado>> hijos = e.getHijos();
			hijos.comenzar();
			ArbolGeneral<Empleado> sucesor = null;
			ArbolGeneral<Empleado> actual = null;
			Empleado ascenso;
			int max = Integer.MIN_VALUE;
			while (!hijos.fin()) {
				actual = hijos.proximo();
				if (actual.getDato().getAntiguedad() > max) {
					sucesor = actual;
				}
			}
			ascenso = sucesor.getDato();
			ascenso.setCategoria(e.getDato().getCategoria());
			// sucesor.getDato().setCategoria(e.getDato().getCategoria());
			e.setDato(ascenso);
			if (reemplazo(sucesor)) {
				e.eliminarHijo(sucesor);
			}
			return false;
		} else {
			return true;
		}
	}

}
