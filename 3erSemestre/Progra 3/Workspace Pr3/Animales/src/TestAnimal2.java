
public class TestAnimal2 {
	public static void main(String[] args) {
		Animal donGato = new Gato();
		donGato.saludo();
		Animal benji = new Perro();
		benji.saludo();
		Animal lassie = new PerroGrande();
		lassie.saludo();
	}
}