package clases;

public class Futbolista {

	private String nombre;
	private String apellido;
	private Integer docId;
	private Integer telefono;
	private String email;
	private Pais pais;

	public Futbolista() {

	}

	public Futbolista(String nombre, String apellido, Integer docId, Integer telefono, String email, Pais pais) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.docId = docId;
		this.telefono = telefono;
		this.email = email;
		this.pais = pais;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public Integer getDocId() {
		return docId;
	}

	public void setDocId(Integer docId) {
		this.docId = docId;
	}

	public Integer getTelefono() {
		return telefono;
	}

	public void setTelefono(Integer telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

	@Override
	public String toString() {
		return "Futbolista:\nNombre = " + nombre + "\nApellido = " + apellido + "\nDocIdentidad = " + docId + "\nTelefono = " + telefono
				+ "\nEmail = " + email + "\n" + pais;
	}

}
