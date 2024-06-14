
public class TestAnimal3 {
	public static void main(String[] args) {
		Gato gato1 = new Gato();
		gato1.saludo();
		Perro perro1 = new Perro();
		perro1.saludo();
		PerroGrande perroGrande1 = new PerroGrande();
		perroGrande1.saludo();
		Animal animal1 = new Gato();
		animal1.saludo();
		Animal animal2 = new Perro();
		animal2.saludo();
		Animal animal3 = new PerroGrande();
		animal3.saludo();
		Perro perro2 = (Perro)animal2;
		PerroGrande perroGrande2 = (PerroGrande)animal3;
		Perro perro3 = (Perro)animal3;
		if (animal2 instanceof Gato) {
			Gato gato2 = (Gato)animal2;
		}
		
		perro2.saludo(perro3);
		perro3.saludo(perro2);
		perro2.saludo(perroGrande2);
		perroGrande2.saludo(perro2);
		perroGrande2.saludo(perroGrande1);
	}
}
