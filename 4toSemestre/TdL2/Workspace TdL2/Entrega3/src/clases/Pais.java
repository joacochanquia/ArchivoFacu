package clases;

public class Pais {

	private String nombre;
	private String idioma;
	private Integer id;

	public Pais() {

	}

	public Pais(String nombre, String idioma, Integer id) {
		this.nombre = nombre;
		this.idioma = idioma;
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getIdioma() {
		return idioma;
	}

	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Override
	public boolean equals(Object obj) {
		return this.nombre.equals(((Pais) obj).getNombre());
	}

	@Override
	public String toString() {
		return "Pais:\nNombre = " + nombre + "\nIdioma = " + idioma + "\nId = " + id;
	}

}
