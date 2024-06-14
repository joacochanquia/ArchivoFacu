package clases;
/**
 * 
 * @author Gabi
 * @author Joaco
 * 
 * @version 1.0.0
 *
 */
public class Pais {

	private String nombre;
	private String confederacion;
	private Persona dt;
	private Jugador[] equipo;
	/**
	 * 
	 * @return devuelve el nombre del pais
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * 
	 * @param nombre , recibe el nombre del pais 
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	/**
	 * 
	 * @return devuelve la confederacion a la que pertenece el pais
	 */
	public String getConfederacion() {
		return confederacion;
	}
	/**
	 * 
	 * @param confederacion , recibe la confederacion a la que pertenece el pais
	 */
	public void setConfederacion(String confederacion) {
		this.confederacion = confederacion;
	}
	/**
	 * 
	 * @return devuelve el director tecnico
	 */
	public Persona getDt() {
		return dt;
	}
	/**
	 * 
	 * @param dt , recibe el director tecnico
	 */
	public void setDt(Persona dt) {
		this.dt = dt;
	}
	/**
	 * 
	 * @return devuelve la seleccion representante del pais
	 */
	public Jugador[] getEquipo() {
		return equipo;
	}
	/**
	 * 
	 * @param equipo , recibe la seleccion representante del pais
	 */
	public void setEquipo(Jugador[] equipo) {
		this.equipo = equipo;
	}
	
}
