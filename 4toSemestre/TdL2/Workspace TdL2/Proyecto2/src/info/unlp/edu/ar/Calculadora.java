package info.unlp.edu.ar;
import java.awt.*;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

public class Calculadora extends JFrame {

	private static final long serialVersionUID = 554737353400550533L;
	
	private JMenuBar menu;
	private JMenu edicion;
	private JMenuItem reiniciar;
	private JMenuItem apagar;
	private JMenu ver;
	private JMenuItem creditos;
	private JMenu ayuda;
	private JMenuItem manual;
	
	private JPanel pantalla;
	
	private JTextField texto;
	
	private JPanel arr;
	private JButton M;
	private JButton Retroceso;
	private JButton CE;
	private JButton C;
	
	private JPanel vacio;
	
	private JPanel izq;
	private JButton MC;
	private JButton MR;
	private JButton MS;
	private JButton Mmas;
	
	private JPanel numeros;
	private JButton SIETE;
	private JButton OCHO;
	private JButton NUEVE;
	private JButton div;
	private JButton sqrt;
	private JButton CUATRO;
	private JButton CINCO;
	private JButton SEIS;
	private JButton por;
	private JButton porcen;
	private JButton UNO;
	private JButton DOS;
	private JButton TRES;
	private JButton menos;
	private JButton fracc;
	private JButton CERO;
	private JButton masmenos;
	private JButton coma;
	private JButton mas;
	private JButton igual;
	
	private void verCalculadora() {
		this.setLayout(new BorderLayout());
		
		menu = new JMenuBar();
		edicion = new JMenu("Edicion");
		reiniciar = new JMenuItem("Reiniciar");
		apagar = new JMenuItem("Apagar");
		edicion.add(reiniciar);
		edicion.add(apagar);
		menu.add(edicion);
		
		ver = new JMenu("Ver");
		creditos = new JMenuItem("Creditos");
		ver.add(creditos);
		menu.add(ver);
		
		ayuda = new JMenu("Ayuda");
		manual = new JMenuItem("Manual");
		ayuda.add(manual);
		menu.add(ayuda);
		
		this.add(menu, BorderLayout.NORTH);
		
		pantalla = new JPanel();
		pantalla.setLayout(new BorderLayout());
		
		texto = new JTextField(15);
		texto.setEditable(false);  // ----------------------------------------------
		
		pantalla.add(texto, BorderLayout.NORTH);
		
		arr =  new JPanel();
		arr.setLayout(new GridLayout());
		

		GridLayout grilla = new GridLayout();
		grilla.setColumns(1);
		grilla.setRows(4);
		grilla.setHgap(5);
		grilla.setVgap(5);
		
		izq = new JPanel();
		izq.setLayout(grilla);
		MC = new JButton("MC");
		MR = new JButton("MR");
		MS = new JButton("MS");
		Mmas = new JButton("M+");
		izq.add(MC);
		izq.add(MR);
		izq.add(MS);
		izq.add(Mmas);
		pantalla.add(izq, BorderLayout.WEST);
		
		numeros = new JPanel();
		grilla.setColumns(5);
		numeros.setLayout(grilla);
		SIETE = new JButton("7");
		OCHO = new JButton("8");
		NUEVE = new JButton("9");
		div = new JButton("/");
		sqrt = new JButton("sqrt");
		numeros.add(SIETE);
		numeros.add(OCHO);
		numeros.add(NUEVE);
		numeros.add(div);
		numeros.add(sqrt);
		CUATRO = new JButton("4");
		CINCO = new JButton("5");
		SEIS = new JButton("6");
		por = new JButton("*");
		porcen = new JButton("%");
		numeros.add(CUATRO);
		numeros.add(CINCO);
		numeros.add(SEIS);
		numeros.add(por);
		numeros.add(porcen);
		UNO = new JButton("1");
		DOS = new JButton("2");
		TRES = new JButton("3");
		menos  = new JButton("-");
		fracc = new JButton("1/x");
		numeros.add(UNO);
		numeros.add(DOS);
		numeros.add(TRES);
		numeros.add(menos);
		numeros.add(fracc);
		CERO = new JButton("0");
		masmenos = new JButton("+/-");
		coma = new JButton(",");
		mas = new JButton("+");
		igual = new JButton("=");
		numeros.add(CERO);
		numeros.add(masmenos);
		numeros.add(coma);
		numeros.add(mas);
		numeros.add(igual);
		pantalla.add(numeros,BorderLayout.CENTER);
		numeros.setBorder(new EmptyBorder(10,10,10,10));
		
		
		
		this.add(pantalla, BorderLayout.CENTER);
		setTitle("Calculadora");
		setSize(450,350);
		setResizable(false);
		setVisible(true);
	}
	
	public static void main(String[] args) {
		Calculadora calculadora = new Calculadora();
		calculadora.verCalculadora();
		calculadora.setVisible(true);
	}
}
