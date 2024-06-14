package prog3.grafos.test;

import org.junit.Before;

import prog3.grafos.*;
import prog3.grafos.utiles.*;
import prog3.listagenerica.*;

public class TestCiudades {
		
	public static void main(String[] args) {
		
		Grafo<String> arg = new GrafoImplListAdy<String>();
		
		cargarArgentina(arg);
		
		ListaGenerica<String> excepto = new ListaGenericaEnlazada<String>();
		excepto.agregarInicio("Muelle Principal");
		
		Mapa map = new Mapa(arg);
		
		System.out.println("		Mapa:");
		
		System.out.println(map.devolverCamino("Buenos Aires", "Antartida"));
		
		System.out.println(map.devolverCaminoExceptuando("Buenos Aires", "Antartida", excepto));
		
		System.out.println(map.caminoMasCorto("Buenos Aires", "Antartida"));
		
		System.out.println(map.caminoSinCargarCombustible("Buenos Aires", "Antartida", 100));
		
		System.out.println(map.caminoConMenorCargaDeCombustible("Buenos Aires", "Antartida", 14));
		
		Algoritmos<String> alg = new Algoritmos<String>();
		
		System.out.println("		Algoritmos:");
		
		System.out.println(alg.subgrafoCuadrado(arg));
		
		System.out.println(alg.getGrado(arg));
		
		System.out.println(alg.tieneCiclo(arg));
		
		Delta del = new Delta();
		
		System.out.println("		Delta");
		
		System.out.println(del.maxIslasDistintas(arg));
		
		System.out.println(del.caminoMasCorto(arg, "Buenos Aires", "Antartida"));
		
		Grafo<String> graf = new GrafoImplListAdy<String>();
		
		cargarGrafoNoDirigido(graf);
		
		System.out.println("		GRAFO NO DIRIGIDO:");
		
		GuiaDeTurismo guia = new GuiaDeTurismo();
		
		System.out.println("		GuiaDeTurismo:");
		
		System.out.println(guia.caminoConMenorNrodeViajes(graf, "1", "7"));
		
		System.out.println("		Algoritmos:");
		
		System.out.println(alg.subgrafoCuadrado(graf));
		
		System.out.println(alg.getGrado(graf)/2);
		
		System.out.println(alg.tieneCiclo(graf));
		
		GradosDeSeparacion sep = new GradosDeSeparacion();
		
		System.out.println("		GradosDeSeparacion:");
		
		System.out.println(sep.maximoGradoDeSeparacion(graf));
		
		System.out.println(sep.maximoGradoDeSeparacion(arg));
		
	}
	
	public static void cargarGrafoNoDirigido(Grafo<String> grafo) {
		VerticeImplListAdy<String> A = new VerticeImplListAdy<String>("1");
		VerticeImplListAdy<String> B = new VerticeImplListAdy<String>("2");
		VerticeImplListAdy<String> C = new VerticeImplListAdy<String>("3");
		VerticeImplListAdy<String> D = new VerticeImplListAdy<String>("4");
		VerticeImplListAdy<String> E = new VerticeImplListAdy<String>("5");
		VerticeImplListAdy<String> F = new VerticeImplListAdy<String>("6");
		VerticeImplListAdy<String> G = new VerticeImplListAdy<String>("7");
		
		grafo.agregarVertice(A);
		grafo.agregarVertice(B);
		grafo.agregarVertice(C);
		grafo.agregarVertice(D);
		grafo.agregarVertice(E);
		grafo.agregarVertice(F);
		grafo.agregarVertice(G);
		
		grafo.conectar(A, B, 30);
		grafo.conectar(B, A, 30);
		grafo.conectar(A, C, 15);
		grafo.conectar(C, A, 15);
		grafo.conectar(A, D, 10);
		grafo.conectar(D, A, 10);
		
		grafo.conectar(B, D, 25);
		grafo.conectar(D, B, 25);
		grafo.conectar(B, E, 60);
		grafo.conectar(E, B, 60);
		
		grafo.conectar(C, D, 40);
		grafo.conectar(D, C, 40);
		grafo.conectar(C, F, 20);
		grafo.conectar(F, C, 20);
		
		grafo.conectar(D, G, 35);
		grafo.conectar(G, D, 35);
		
		grafo.conectar(E, G, 20);
		grafo.conectar(G, E, 20);
		
		grafo.conectar(F, G, 30);
		grafo.conectar(G, F, 30);
	}
	
	public static void cargarArgentina(Grafo<String> arg) {
		
		VerticeImplListAdy<String> BuenosAires = new VerticeImplListAdy<String>("Buenos Aires");
		VerticeImplListAdy<String> SantaFe = new VerticeImplListAdy<String>("Santa Fe");
		VerticeImplListAdy<String> Cordoba = new VerticeImplListAdy<String>("Cordoba");
		VerticeImplListAdy<String> EntreRios = new VerticeImplListAdy<String>("Entre Rios");
		VerticeImplListAdy<String> Corrientes = new VerticeImplListAdy<String>("Corrientes");
		VerticeImplListAdy<String> Misiones = new VerticeImplListAdy<String>("Misiones");
		VerticeImplListAdy<String> Chaco = new VerticeImplListAdy<String>("Chaco");
		VerticeImplListAdy<String> Formosa = new VerticeImplListAdy<String>("Formosa");
		VerticeImplListAdy<String> Salta = new VerticeImplListAdy<String>("Salta");
		VerticeImplListAdy<String> Jujuy = new VerticeImplListAdy<String>("Jujuy");
		VerticeImplListAdy<String> SantiagoDelEstero = new VerticeImplListAdy<String>("Santiago Del Estero");
		VerticeImplListAdy<String> Tucuman = new VerticeImplListAdy<String>("Tucuman");
		VerticeImplListAdy<String> Catamarca = new VerticeImplListAdy<String>("Catamarca");
		VerticeImplListAdy<String> LaRioja = new VerticeImplListAdy<String>("La Rioja");
		VerticeImplListAdy<String> SanJuan = new VerticeImplListAdy<String>("San Juan");
		VerticeImplListAdy<String> SanLuis = new VerticeImplListAdy<String>("San Luis");
		VerticeImplListAdy<String> Mendoza = new VerticeImplListAdy<String>("Mendoza");
		VerticeImplListAdy<String> LaPampa = new VerticeImplListAdy<String>("La Pampa");
		VerticeImplListAdy<String> Neuquen = new VerticeImplListAdy<String>("Neuquen");
		VerticeImplListAdy<String> RioNegro = new VerticeImplListAdy<String>("Rio Negro");
		VerticeImplListAdy<String> Chubut = new VerticeImplListAdy<String>("Chubut");
		VerticeImplListAdy<String> SantaCruz = new VerticeImplListAdy<String>("Santa Cruz");
		VerticeImplListAdy<String> TierraDelFuego = new VerticeImplListAdy<String>("Tierra Del Fuego");
		VerticeImplListAdy<String> Antartida = new VerticeImplListAdy<String>("Antartida");
		
		arg.agregarVertice(BuenosAires);
		arg.agregarVertice(SantaFe);
		arg.agregarVertice(Cordoba);
		arg.agregarVertice(EntreRios);
		arg.agregarVertice(Corrientes);
		arg.agregarVertice(Misiones);
		arg.agregarVertice(Chaco);
		arg.agregarVertice(Formosa);
		arg.agregarVertice(Salta);
		arg.agregarVertice(Jujuy);
		arg.agregarVertice(SantiagoDelEstero);
		arg.agregarVertice(Tucuman);
		arg.agregarVertice(Catamarca);
		arg.agregarVertice(LaRioja);
		arg.agregarVertice(SanJuan);
		arg.agregarVertice(SanLuis);
		arg.agregarVertice(Mendoza);
		arg.agregarVertice(LaPampa);
		arg.agregarVertice(Neuquen);
		arg.agregarVertice(RioNegro);
		arg.agregarVertice(Chubut);
		arg.agregarVertice(SantaCruz);
		arg.agregarVertice(TierraDelFuego);
		arg.agregarVertice(Antartida);
		
		arg.conectar(BuenosAires, EntreRios, 5);
		arg.conectar(BuenosAires, SantaFe, 7);
		arg.conectar(BuenosAires, Cordoba, 10);
		arg.conectar(BuenosAires, RioNegro, 2);
		
		arg.conectar(EntreRios, Corrientes, 8);
		
		arg.conectar(SantaFe, EntreRios, 1);
		arg.conectar(SantaFe, Corrientes, 12);
		arg.conectar(SantaFe, SantiagoDelEstero, 11);
		
		arg.conectar(Corrientes, Misiones, 6);
		arg.conectar(Corrientes, Chaco, 6);
		
		arg.conectar(Chaco, Formosa, 5);
		arg.conectar(Chaco, Salta, 10);
		
		arg.conectar(Salta, Jujuy, 2);
		arg.conectar(Salta, Tucuman,4);
		arg.conectar(Salta, Catamarca,7);
		
		arg.conectar(Jujuy, Salta, 2);
		
		arg.conectar(SantiagoDelEstero, Tucuman,4);
		arg.conectar(SantiagoDelEstero, Cordoba,10);
		
		arg.conectar(Catamarca, Tucuman,5);
		arg.conectar(Catamarca, LaRioja,6);
		
		arg.conectar(LaRioja, Cordoba,7);
		arg.conectar(LaRioja, SanLuis,8);
		
		arg.conectar(SanJuan, LaRioja,6);
		
		arg.conectar(SanLuis, SanJuan,5);
		
		arg.conectar(Cordoba, Catamarca,8);
		arg.conectar(Cordoba, LaPampa,12);
		
		arg.conectar(Mendoza, SanJuan,4);
		arg.conectar(Mendoza, Neuquen,10);
		
		arg.conectar(LaPampa, Mendoza,8);
		arg.conectar(LaPampa, BuenosAires,15);
		
		arg.conectar(Neuquen, RioNegro,10);
		
		arg.conectar(RioNegro, Chubut,7);
		
		arg.conectar(Chubut, RioNegro,6);
		arg.conectar(Chubut, SantaCruz,9);
		
		arg.conectar(SantaCruz, TierraDelFuego,7);
		
		arg.conectar(TierraDelFuego, Antartida,14);
		
		arg.conectar(Antartida, TierraDelFuego,15);
		arg.conectar(Antartida, Chubut,30);
		
		VerticeImplListAdy<String> MuellePrincipal = new VerticeImplListAdy<String>("Muelle Principal");
		
		arg.agregarVertice(MuellePrincipal);
		
		arg.conectar(MuellePrincipal, BuenosAires, 10);
		//arg.conectar(MuellePrincipal, Neuquen);
		arg.conectar(MuellePrincipal, Antartida, 1);
		arg.conectar(MuellePrincipal, Misiones, 22);
		arg.conectar(Tucuman, MuellePrincipal, 100);
		
	}
}
