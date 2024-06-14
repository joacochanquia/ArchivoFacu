package clases;
/**
 * 
 * @author Gabi
 * @author Joaco
 * 
 * @version 1.0.0
 *
 */
public class Jugador extends Persona {

	private String posicion;
	private int numero;
	/**
	 * 
	 * @return devuelve la posicion del jugador
	 */
	public String getPosicion() {
		return posicion;
	}
	/**
	 * 
	 * @param posicion , recibe la posicion del jugador
	 */
	public void setPosicion(String posicion) {
		this.posicion = posicion;
	}
	/**
	 * 
	 * @return devuelve el numero del jugador
	 */
	public int getNumero() {
		return numero;
	}
	/**
	 * 
	 * @param numero , recibe el numero del jugador
	 */
	public void setNumero(int numero) {
		this.numero = numero;
	}
	
}
