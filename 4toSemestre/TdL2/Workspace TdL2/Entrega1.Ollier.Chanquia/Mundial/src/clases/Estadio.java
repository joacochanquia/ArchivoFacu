package clases;
/**
 * 
 * @author Joaco
 * @author Gabi
 * 
 * @version 1.0.0
 *
 */
public class Estadio {
	private String nombre;
	private String ciudad;
	private int capacidad;
	/**
	 * 
	 * @return devuelve el nombre del estadio
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * 
	 * @param nombre , recibe el nombre del estadio
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	/**
	 * 
	 * @return devuelve el nombre de la ciudad donde esta el estadio
	 */
	public String getCiudad() {
		return ciudad;
	}
	/**
	 * 
	 * @param ciudad , recibe el nombre de la ciudad donde esta el estadio
	 */
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	/**
	 * 
	 * @return devuelve la capacidad del estadio
	 */
	public int getCapacidad() {
		return capacidad;
	}
	/**
	 * 
	 * @param capacidad , recibe la capacidad del estadio
	 */
	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}	
	
}
