package clases;

public class Sede {

	private String nombre;
	private int capacidad;
	private Pais pais;

	public Sede() {

	}

	public Sede(String nombre, int capacidad, Pais pais) {
		this.nombre = nombre;
		this.capacidad = capacidad;
		this.pais = pais;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getCapacidad() {
		return capacidad;
	}

	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

	@Override
	public String toString() {
		return "Sede:\nNombre = " + nombre + "\nCapacidad = " + capacidad + "\nPais = " + pais;
	}

}
