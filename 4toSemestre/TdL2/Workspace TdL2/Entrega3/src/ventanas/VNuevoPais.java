package ventanas;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.*;
import javax.swing.border.EmptyBorder;

import clases.Pais;
import conecciones.*;
import excepciones.InputException;

public class VNuevoPais extends JDialog {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel pnlErr;
	private JLabel lblErr;

	private JPanel pnlNom;
	private JLabel lblNom;
	private JTextField txtNom;

	private JPanel pnlGuar;
	private JButton btnGuar;

	private PaisDAO pDAO;

	private Integer id;

	public VNuevoPais() {
		this.setLayout(new GridLayout(4, 1));

		pnlErr = new JPanel();
		lblErr = new JLabel(" ");
		lblErr.setForeground(Color.RED);
		pnlErr.add(lblErr);
		this.add(pnlErr);

		pnlNom = new JPanel();
		pnlNom.setBorder(new EmptyBorder(25, 100, 25, 100));
		pnlNom.setLayout(new GridLayout(1, 2));
		lblNom = new JLabel("NOMBRE:");
		pnlNom.add(lblNom);
		txtNom = new JTextField(40);
		pnlNom.add(txtNom);
		this.add(pnlNom);

		this.add(new JLabel(" "));

		pnlGuar = new JPanel();
		pnlGuar.setBorder(new EmptyBorder(10, 70, 10, 70));
		btnGuar = new JButton("Guardar");
		btnGuar.addMouseListener(new GuarAdapter());
		pnlGuar.add(btnGuar);
		this.add(pnlGuar);

		pDAO = new PaisDAOjdbc();

	}

	public void verNuevoPais(Integer id) {
		this.id = id;
		lblErr.setText(" ");
		if (id == null) {
			txtNom.setText(null);
			this.setTitle("NUEVO PAIS");
		} else {
			Pais p = pDAO.encontrar(id);
			txtNom.setText(p.getNombre());
			this.setTitle("EDITAR PAIS");
		}
		this.setSize(750, 500);
		this.setModal(true);
		this.setVisible(true);
	}

	public class GuarAdapter extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent arg0) {
			try {
				String nom = txtNom.getText();
				comprobarCampos(nom);
				Pais p = new Pais(nom.trim(), "Español", id);
				pDAO.guardar(p);
				dispose();
			} catch (InputException e) {
				lblErr.setText(e.getMessage());
			}
		}

		private void comprobarCampos(String nom) throws InputException {
			if (nom.isBlank()) {
				throw new InputException("Falta llenar algun campo");
			}
			if (!nom.matches("[a-zñ A-ZÑ]+")) {
				throw new InputException("El nombre solo puede contener letras");
			}
			if ((id==null)&&(pDAO.encontrar(nom) != null)) {
				throw new InputException("Ese pais ya esta cargado");
			}
		}
	}

}
