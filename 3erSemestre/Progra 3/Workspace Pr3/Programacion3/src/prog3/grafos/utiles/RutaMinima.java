package prog3.grafos.utiles;

import prog3.listagenerica.ListaGenerica;

public class RutaMinima {
	private ListaGenerica<String> camino;
	private boolean unico;
	/**
	 * @return the camino
	 */
	public ListaGenerica<String> getCamino() {
		return camino;
	}
	/**
	 * @param camino the camino to set
	 */
	public void setCamino(ListaGenerica<String> camino) {
		this.camino = camino;
	}
	/**
	 * @return the unico
	 */
	public boolean isUnico() {
		return unico;
	}
	/**
	 * @param unico the unico to set
	 */
	public void setUnico(boolean unico) {
		this.unico = unico;
	}
	@Override
	public String toString() {
		return "RutaMinima [camino=" + camino + ", unico=" + unico + "]";
	}
	
}
