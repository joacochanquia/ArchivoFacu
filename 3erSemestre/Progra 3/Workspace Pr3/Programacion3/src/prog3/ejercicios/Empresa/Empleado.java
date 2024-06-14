package prog3.ejercicios.Empresa;

public class Empleado implements Comparable<Empleado> {
	
	private String nombre;
	private int antiguedad;
	private int categoria;
	
	public Empleado() {
		
	}

	public Empleado(String nombre, int antiguedad, int categoria) {
		this.nombre = nombre;
		this.antiguedad = antiguedad;
		this.categoria = categoria;
	}
	

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getAntiguedad() {
		return antiguedad;
	}
	public void setAntiguedad(int antiguedad) {
		this.antiguedad = antiguedad;
	}
	public int getCategoria() {
		return categoria;
	}
	public void setCategoria(int categoria) {
		this.categoria = categoria;
	}

	@Override
	public int compareTo(Empleado o) {
		// TODO Auto-generated method stub
		return this.antiguedad - o.antiguedad;
	}
	
	
}
