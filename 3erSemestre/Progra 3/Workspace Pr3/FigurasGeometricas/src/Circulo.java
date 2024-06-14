
public class Circulo extends Figura {
	private double radio;
	
	public Circulo() {
		
	}
	
	public Circulo(double radio) {
		this.radio = radio;
	}
	
	public Circulo(double radio, String color, boolean relleno) {
		super(color, relleno);
		this.radio = radio;
	}

	public double getRadio() {
		return radio;
	}

	public void setRadio(double radio) {
		this.radio = radio;
	}

	@Override
	public double getArea() {
		return (3.14*radio*radio);
	}

	@Override
	public double getPerimetro() {
		return (2*3.14*radio);
	}

	@Override
	public String toString() {
		return "Circulo [" + "color=" + super.getColor() + ", relleno=" + super.isRelleno() + ", radio=" + radio + "]";
	}

	
}
