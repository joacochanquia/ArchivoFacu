
public class Rectangulo extends Figura {
	
	private double ancho;
	
	private double largo;
	
	public Rectangulo() {
		
	}

	public Rectangulo(double ancho, double largo) {
		this.ancho = ancho;
		this.largo = largo;
	}
	
	public Rectangulo(double ancho, double largo, String color, boolean relleno) {
		super(color, relleno);
		this.ancho = ancho;
		this.largo = largo;
	}

	public double getAncho() {
		return ancho;
	}

	public void setAncho(double ancho) {
		this.ancho = ancho;
	}

	public double getLargo() {
		return largo;
	}

	public void setLargo(double largo) {
		this.largo = largo;
	}

	@Override
	public double getArea() {
		return (largo*ancho);
	}

	@Override
	public double getPerimetro() {
		return ((2*largo)+(2*ancho));
	}

	@Override
	public String toString() {
		return "Rectangulo [" + "color=" + super.getColor() + ", relleno=" + super.isRelleno() + ", ancho=" + ancho + ", largo=" + largo + "]";
	}

	
}
