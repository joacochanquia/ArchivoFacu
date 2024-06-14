
public class Mobile {
	private String marca;
	private String sistemaOperativo;
	private String modelo;
	private double costo;
	
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
	@Override
	public String toString() {
		return "marca=" + marca + ", sistemaOperativo=" + sistemaOperativo + ", modelo=" + modelo + ", costo="
				+ costo;
	}
	@Override
	public boolean equals(Object o) {
		boolean result=false;
		if ((o!=null) && (o instanceof Mobile)){
			Mobile m = (Mobile) o;
			if ((m.getMarca()==this.getMarca())&&(m.getSistemaOperativo()==this.getSistemaOperativo())&&(m.getModelo()==this.getModelo())&&(m.getCosto()==this.getCosto())) 
				result=true;
		}
		return result;
	}
	
}
