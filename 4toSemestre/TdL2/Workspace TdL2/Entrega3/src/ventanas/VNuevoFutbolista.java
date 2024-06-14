package ventanas;

import java.awt.*;
import java.awt.event.*;
import java.util.*;

import javax.swing.*;
import javax.swing.border.*;

import clases.*;
import conecciones.*;
import excepciones.InputException;

public class VNuevoFutbolista extends JDialog {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel pnlErr;
	private JLabel lblErr;

	private JPanel pnlNom;
	private JLabel lblNom;
	private JTextField txtNom;
	private JPanel pnlApe;
	private JLabel lblApe;
	private JTextField txtApe;
	private JPanel pnlMail;
	private JLabel lblMail;
	private JTextField txtMail;
	private JPanel pnlTel;
	private JLabel lblTel;
	private JTextField txtTel;
	private JPanel pnlPais;
	private JLabel lblPais;
	private Choice txtPais;

	private JPanel pnlGuar;
	private JButton btnGuar;

	private PaisDAO pDAO;
	private ArrayList<Pais> lista;

	private FutbolistaDAO fDAO;

	private Integer id;

	public VNuevoFutbolista() {
		this.setLayout(new GridLayout(8, 1));

		pnlErr = new JPanel();
		lblErr = new JLabel(" ");
		lblErr.setForeground(Color.RED);
		pnlErr.add(lblErr);
		this.add(pnlErr);

		pnlNom = new JPanel();
		pnlNom.setBorder(new EmptyBorder(10, 100, 10, 100));
		pnlNom.setLayout(new GridLayout(1, 2));
		lblNom = new JLabel("NOMBRE:");
		pnlNom.add(lblNom);
		txtNom = new JTextField(40);
		pnlNom.add(txtNom);
		this.add(pnlNom);

		pnlApe = new JPanel();
		pnlApe.setBorder(new EmptyBorder(10, 100, 10, 100));
		pnlApe.setLayout(new GridLayout(1, 2));
		lblApe = new JLabel("APELLIDO:");
		pnlApe.add(lblApe);
		txtApe = new JTextField(40);
		pnlApe.add(txtApe);
		this.add(pnlApe);

		pnlMail = new JPanel();
		pnlMail.setBorder(new EmptyBorder(10, 100, 10, 100));
		pnlMail.setLayout(new GridLayout(1, 2));
		lblMail = new JLabel("E-MAIL:");
		pnlMail.add(lblMail);
		txtMail = new JTextField(40);
		pnlMail.add(txtMail);
		this.add(pnlMail);

		pnlTel = new JPanel();
		pnlTel.setBorder(new EmptyBorder(10, 100, 10, 100));
		pnlTel.setLayout(new GridLayout(1, 2));
		lblTel = new JLabel("TELEFONO:");
		pnlTel.add(lblTel);
		txtTel = new JTextField(40);
		pnlTel.add(txtTel);
		this.add(pnlTel);

		pnlPais = new JPanel();
		pnlPais.setBorder(new EmptyBorder(10, 100, 10, 100));
		pnlPais.setLayout(new GridLayout(1, 2));
		lblPais = new JLabel("PAIS:");
		pnlPais.add(lblPais);
		txtPais = new Choice();
		pnlPais.add(txtPais);
		this.add(pnlPais);

		this.add(new JLabel(" "));

		pnlGuar = new JPanel();
		pnlGuar.setBorder(new EmptyBorder(10, 70, 10, 70));
		btnGuar = new JButton("Guardar");
		btnGuar.addMouseListener(new GuarAdapter());
		pnlGuar.add(btnGuar);
		this.add(pnlGuar);

		fDAO = new FutbolistaDAOjdbc();
		pDAO = new PaisDAOjdbc();

	}

	public void verNuevoFutbolista(Integer id) {
		this.id = id;
		txtPais.removeAll();
		lblErr.setText(" ");
		lista = pDAO.cargar();
		for (int i = 0; i < lista.size(); i++) {
			Pais p = lista.get(i);
			txtPais.add(p.getNombre());
		}
		if (id == null) {
			txtNom.setText(null);
			txtApe.setText(null);
			txtMail.setText(null);
			txtTel.setText(null);
			this.setTitle("NUEVO FUTBOLISTA");
		} else {
			Futbolista f = fDAO.encontrar(id);
			txtNom.setText(f.getNombre());
			txtApe.setText(f.getApellido());
			txtMail.setText(f.getEmail());
			txtTel.setText(f.getTelefono().toString());
			txtPais.select(f.getPais().getNombre());
			this.setTitle("EDITAR FUTBOLISTA");
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
				String ape = txtApe.getText();
				String mail = txtMail.getText();
				String tel = txtTel.getText();
				String nomPais = txtPais.getSelectedItem();
				comprobarCampos(nom, ape, mail, tel);
				Futbolista f = new Futbolista(nom.trim(), ape.trim(), Integer.valueOf(tel), 
						Integer.valueOf(tel), mail.trim(), pDAO.encontrar(nomPais), id);
				fDAO.guardar(f);
				dispose();
			} catch (InputException e) {
				lblErr.setText(e.getMessage());
			} catch (NumberFormatException e) {
				lblErr.setText("Numero demasiado grande");
			}
		}

		private void comprobarCampos(String nom, String ape, String mail, String tel) throws InputException {
			if ((nom.isBlank()) || (ape.isBlank()) || (mail.isBlank()) || (tel.isBlank())) {
				throw new InputException("Falta llenar algun campo");
			}
			if (!nom.matches("[a-zñ A-ZÑ]+")) {
				throw new InputException("El nombre solo puede contener letras");
			}
			if (!ape.matches("[a-zñ A-ZÑ]+")) {
				throw new InputException("El apellido solo puede contener letras");
			}
			if (mail.indexOf("@") == -1) {
				throw new InputException("El mail debe contener un @");
			}
			if (!tel.matches("[0-9]+")) {
				throw new InputException("El telefono solo puede contener numeros");
			}
			if ((id==null)&&(fDAO.encontrar(nom, ape) != null)) {
				throw new InputException("Ese futbolista ya esta cargado");
			}
		}
	}

}
