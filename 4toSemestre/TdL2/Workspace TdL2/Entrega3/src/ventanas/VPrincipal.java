package ventanas;

import java.awt.*;
import java.awt.event.*;
import java.io.*;

import javax.swing.*;
import javax.swing.border.*;

import conecciones.MyConnection;
import excepciones.ConectException;

import java.net.*;
import javax.imageio.*;

public class VPrincipal extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel btns1;
	private JButton btnConf;
	private String imgConfFile = "archivos/configuracion.jpg";
	private Image imgConf;
	private JButton btnEst;
	private String imgEstFile = "archivos/estadisticas.jpg";
	private Image imgEst;

	private JPanel btns2;
	private JButton btnFutb;
	private String imgFutbFile = "archivos/futbolista.jpg";
	private Image imgFutb;
	private JButton btnPais;
	private String imgPaisFile = "archivos/pais.jpg";
	private Image imgPais;
	private JButton btnNDef1;
	private JButton btnNDef2;
	private JButton btnNDef3;
	private JButton btnNDef4;

	private VEstadisticas vest;
	private VFutbolista vfutb;
	private VPais vpais;

	
	public void verPrincipal() {
		this.setLayout(new BorderLayout());

		btns1 = new JPanel();
		btns1.setBorder(new EmptyBorder(20, 20, 10, 20));
		FlowLayout flow = new FlowLayout();
		flow.setAlignment(FlowLayout.RIGHT);
		btns1.setLayout(flow);

		btnEst = new JButton();
		btnEst.addMouseListener(new EstAdapter());
		btnEst.setBackground(Color.WHITE);
		btns1.add(btnEst);

		btnConf = new JButton();
		btnConf.addMouseListener(new ConfAdapter());
		btnConf.setBackground(Color.WHITE);
		btns1.add(btnConf);

		this.add(btns1, BorderLayout.NORTH);

		btns2 = new JPanel();
		btns2.setBorder(new EmptyBorder(40, 100, 100, 100));
		GridLayout grid = new GridLayout(2, 3);
		grid.setHgap(50);
		grid.setVgap(50);
		btns2.setLayout(grid);

		btnFutb = new JButton("FUTBOLISTA");
		btnFutb.addMouseListener(new FutbAdapter());
		btnFutb.setBackground(Color.cyan);
		btnPais = new JButton("PAIS");
		btnPais.addMouseListener(new PaisAdapter());
		btnPais.setBackground(Color.cyan);
		btnNDef1 = new JButton("SIN DEFINIR");
		btnNDef1.setBackground(Color.cyan);
		btnNDef2 = new JButton("SIN DEFINIR");
		btnNDef2.setBackground(Color.cyan);
		btnNDef3 = new JButton("SIN DEFINIR");
		btnNDef3.setBackground(Color.cyan);
		btnNDef4 = new JButton("SIN DEFINIR");
		btnNDef4.setBackground(Color.cyan);

		btns2.add(btnFutb);
		btns2.add(btnPais);
		btns2.add(btnNDef1);
		btns2.add(btnNDef2);
		btns2.add(btnNDef3);
		btns2.add(btnNDef4);

		this.add(btns2, BorderLayout.CENTER);

		LoadImages();

		this.addWindowListener(new FrameAdapter());
		
		this.setTitle("MundialFutbol - Qatar 2022");
		this.setSize(1000, 650);
		this.setVisible(true);
	}

	public void LoadImages() {
		URL urlConf = getClass().getClassLoader().getResource(imgConfFile);
		try {
			if (urlConf == null) {
				System.err.println("No se encuentra el archivo:" + imgConfFile);
			} else {
				imgConf = ImageIO.read(urlConf);
			}
			URL urlEst = getClass().getClassLoader().getResource(imgEstFile);
			if (urlEst == null) {
				System.err.println("No se encuentra el archivo:" + imgEstFile);
			} else {
				imgEst = ImageIO.read(urlEst);
			}
			URL urlFutb = getClass().getClassLoader().getResource(imgFutbFile);
			if (urlFutb == null) {
				System.err.println("No se encuentra el archivo:" + imgFutbFile);
			} else {
				imgFutb = ImageIO.read(urlFutb);
			}
			URL urlPais = getClass().getClassLoader().getResource(imgPaisFile);
			if (urlPais == null) {
				System.err.println("No se encuentra el archivo:" + imgPaisFile);
			} else {
				imgPais = ImageIO.read(urlPais);
			}
			dibujar();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void dibujar() {
		btnConf.setIcon(new ImageIcon(imgConf));
		btnEst.setIcon(new ImageIcon(imgEst));
		btnFutb.setIcon(new ImageIcon(imgFutb));
		btnPais.setIcon(new ImageIcon(imgPais));
	}

	@Override
	public void paintComponents(Graphics g) {
		super.paintComponents(g);
		dibujar();
	}

	public static void main(String[] args) {
		VPrincipal vprinc = new VPrincipal();
		vprinc.verPrincipal();
	}

	public class EstAdapter extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent arg0) {
			if (vest == null) {
				vest = new VEstadisticas();
			}
			if (!vest.isShowing()) {
				vest.verEstadisticas();
			}
		}
	}

	public class ConfAdapter extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent arg0) {
			VConfiguracion vconf = new VConfiguracion();
			vconf.verConfiguracion();
		}
	}

	public class FutbAdapter extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent arg0) {
			try {
				if (vfutb == null) {
					vfutb = new VFutbolista();
				}
				if (!vfutb.isShowing()) {
					vfutb.verFutbolista();
				}
			} catch (ConectException e) {
				JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
			}
		}
	}

	public class PaisAdapter extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent arg0) {
			try {
				if (vpais == null) {
					vpais = new VPais();
				}
				if (!vpais.isShowing()) {
					vpais.verPais();
				}
			} catch (ConectException e) {
				JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
			}
		}
	}
	
	public class FrameAdapter extends WindowAdapter{

		@Override
		public void windowClosing(WindowEvent e) {
			super.windowClosing(e);
			MyConnection.close();
			System.exit(0);
		}
		
	}

}
