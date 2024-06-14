package clases;
/**
 * 
 * @author Joaco
 * @author Gabi
 * 
 * @version 1.0.0
 *
 */
public class Persona {
	
	private String nombre;
	private String apellido;
	private int edad;
	private String rol;
	/**
	 * 
	 * @return devuelve el nombre de la persona
	 */
	public String getNombre() {
		return nombre;
	}
	/**
	 * 
	 * @param nombre , recibe el nombre de la persona
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	/**
	 * 
	 * @return devuelve el apellido de la persona
	 */
	public String getApellido() {
		return apellido;
	}
	/**
	 * 
	 * @param apellido , recibe el apellido de la persona
	 */
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	/**
	 * 
	 * @return devuelve la edad de la persona
	 */
	public int getEdad() {
		return edad;
	}
	/**
	 * 
	 * @param edad , recibe la edad de la persona
	 */
	public void setEdad(int edad) {
		this.edad = edad;
	}
	/**
	 * 
	 * @return devuelve el rol de la persona
	 */
	public String getRol() {
		return rol;
	}
	/**
	 * 
	 * @param rol , recibe el rol de la persona
	 */
	public void setRol(String rol) {
		this.rol = rol;
	}
	
}