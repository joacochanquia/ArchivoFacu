package prog3.grafos.utiles;

public class Peso {
	private int peso;
	
	public Peso(){
		
	}
	
	/**
	 * @return the peso
	 */
	public int getPeso() {
		return peso;
	}

	/**
	 * @param peso the peso to set
	 */
	public void setPeso(int peso) {
		this.peso = peso;
	}

	public void minimo() {
		peso = Integer.MAX_VALUE;
	}
	
	public void maximo() {
		peso = Integer.MIN_VALUE;
	}
}
