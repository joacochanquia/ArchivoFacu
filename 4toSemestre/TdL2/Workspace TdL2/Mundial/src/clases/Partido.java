package clases;
/**
 * 
 * @author Gabi
 * @author Joaco
 * 
 * @version 1.0.0
 *
 */
public class Partido {

	private boolean jugado;
	private Pais[] paises;
	private int[] goles;
	private Arbitro[] arbitros;
	private Estadio estadio;
	private Fecha fecha;
	/**
	 * 
	 * @return devuelve si el partido ya fue jugado
	 */
	public boolean isJugado() {
		return jugado;
	}
	/**
	 * 
	 * @param jugado , recibe si el partido ya fue jugado
	 */
	public void setJugado(boolean jugado) {
		this.jugado = jugado;
	}
	/**
	 * 
	 * @return devuelve los paises que juegan el partido
	 */
	public Pais[] getPaises() {
		return paises;
	}
	/**
	 * 
	 * @param paises , recibe los paises que juegan el partido
	 */
	public void setPaises(Pais[] paises) {
		this.paises = paises;
	}
	/**
	 * 
	 * @return devuelve la cantidad de goles de cada equipo
	 */
	public int[] getGoles() {
		return goles;
	}
	/**
	 * 
	 * @param goles , recibe la cantidad de goles de cada equipo
	 */
	public void setGoles(int[] goles) {
		this.goles = goles;
	}
	/**
	 * 
	 * @return devuelve al equipo de arbitros del partido
	 */
	public Arbitro[] getArbitros() {
		return arbitros;
	}
	/**
	 * 
	 * @param arbitros , recibe al equipo de arbitros del partido
	 */
	public void setArbitros(Arbitro[] arbitros) {
		this.arbitros = arbitros;
	}
	/**
	 * 
	 * @return devuelve el estadio donde se jugara el partido
	 */
	public Estadio getEstadio() {
		return estadio;
	}
	/**
	 * 
	 * @param estadio , recibe el estadio donde se jugara el partido
	 */
	public void setEstadio(Estadio estadio) {
		this.estadio = estadio;
	}
	/**
	 * 
	 * @return devuelve la fecha del partido
	 */
	public Fecha getFecha() {
		return fecha;
	}
	/**
	 * 
	 * @param fecha , recibe la fecha del partido
	 */
	public void setFecha(Fecha fecha) {
		this.fecha = fecha;
	}
	
}
