

public class Tablet {
	private String marca;
	private String sistemaOperativo;
	private String modelo;
	private double costo;
	private float pulgadas;
	
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getSistemaOperativo() {
		return sistemaOperativo;
	}
	public void setSistemaOperativo(String sistemaOperativo) {
		this.sistemaOperativo = sistemaOperativo;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public double getCosto() {
		return costo;
	}
	public void setCosto(double costo) {
		this.costo = costo;
	}
	public float getPulgadas() {
		return pulgadas;
	}
	public void setPulgadas(float pulgadas) {
		this.pulgadas = pulgadas;
	}
	public String devolverDatos() {
		return "Tablet [marca=" + marca + ", sistemaOperativo=" + sistemaOperativo + ", modelo=" + modelo + ", costo="
				+ costo + ", pulgadas=" + pulgadas + "]";
	}
	
	
}
