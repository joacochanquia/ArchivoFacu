
public class TestDeFigurasGeometricas {

	public static void main(String[] args) {
		Figura[] f = new Figura[3];
		f[0] = new Circulo(2, "Azul", false);
		f[1] = new Rectangulo(2, 3, "Rojo", true);
		f[2] = new Cuadrado(4, "Amarillo", true);
		for(Figura i: f) {
			System.out.println(i);
		}
	}

}
