package ventanas;

import java.awt.*;
import java.awt.event.*;

import javax.swing.*;
import javax.swing.border.*;

import conecciones.MyConnection;
import excepciones.ConectException;

public class VConfiguracion extends JDialog {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel pnlUsr;
	private JLabel lblUsr;
	private JTextField txtUsr;
	private JPanel pnlPsw;
	private JLabel lblPsw;
	private JTextField txtPsw;
	private JPanel pnlGuar;
	private JButton btnGuar;
	
	public VConfiguracion() {
		this.setLayout(new GridLayout(5,1));
		
		this.add(new JLabel(" "));
		
		pnlUsr = new JPanel();
		pnlUsr.setBorder(new EmptyBorder(10,100,10,100));
		pnlUsr.setLayout(new GridLayout(1,2));
		lblUsr = new JLabel("USUARIO BD:");
		pnlUsr.add(lblUsr);
		txtUsr = new JTextField(40);
		pnlUsr.add(txtUsr);
		this.add(pnlUsr);
		
		pnlPsw = new JPanel();
		pnlPsw.setBorder(new EmptyBorder(10,100,10,100));
		pnlPsw.setLayout(new GridLayout(1,2));
		lblPsw = new JLabel("PASSWORD BD:");
		pnlPsw.add(lblPsw);
		txtPsw = new JPasswordField(40);
		pnlPsw.add(txtPsw);
		this.add(pnlPsw);

		this.add(new JLabel(" "));
		
		pnlGuar = new JPanel();
		pnlGuar.setBorder(new EmptyBorder(10,70,10,70));
		btnGuar = new JButton("Guardar");
		btnGuar.addMouseListener(new GuarAdapter());
		pnlGuar.add(btnGuar);
		this.add(pnlGuar);
		
		this.setTitle("CONFIGURACION");
	}
	
	public void verConfiguracion() {
		txtUsr.setText(null);
		txtPsw.setText(null);
		this.setSize(650,400);
		this.setModal(true);
		this.setVisible(true);
	}
	
	public class GuarAdapter extends MouseAdapter{
		@Override
		public void mouseClicked(MouseEvent arg0) {
			MyConnection.close();
			try {
				MyConnection.setCon(txtUsr.getText(),txtPsw.getText());
				dispose();
			} catch (ConectException e) {
				JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
			}
		}
	}
	
}
