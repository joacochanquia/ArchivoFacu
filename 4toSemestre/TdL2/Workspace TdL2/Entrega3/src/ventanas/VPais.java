package ventanas;

import java.awt.*;
import java.awt.event.*;
import java.util.*;

import javax.swing.*;
import javax.swing.border.*;
import javax.swing.table.*;

import clases.Pais;
import conecciones.MyConnection;
import conecciones.PaisDAOjdbc;
import excepciones.ConectException;

public class VPais extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel btns;
	private JButton btnNuev;
	private JButton btnVolv;
	private JPanel pnlPais;
	private JLabel lblPais;

	private JTable tbl;
	private String[] titulos = { "ID", "NOMBRE", "EDITAR", "ELIMINAR" };
	private MyModel modelo = new MyModel(titulos);
	private DefaultTableCellRenderer rendCent;
	private DefaultTableCellRenderer rendBlue;

	private PaisDAOjdbc pDAO;
	private ArrayList<Pais> lista;
	private VNuevoPais vnuepais;

	public VPais() {

		this.setLayout(new BorderLayout());

		btns = new JPanel();
		btns.setBorder(new EmptyBorder(30, 30, 10, 30));
		FlowLayout flow = new FlowLayout();
		flow.setAlignment(FlowLayout.RIGHT);
		btns.setLayout(flow);

		btnNuev = new JButton("+ NUEVO");
		btnNuev.addMouseListener(new NuevAdapter());
		btns.add(btnNuev);

		btnVolv = new JButton("VOLVER");
		btnVolv.addMouseListener(new VolvAdapter());
		btns.add(btnVolv);

		this.add(btns, BorderLayout.NORTH);

		pnlPais = new JPanel();
		pnlPais.setBorder(new EmptyBorder(10, 20, 40, 20));
		pnlPais.setLayout(new BorderLayout());

		lblPais = new JLabel("Paises");
		lblPais.setFont(new Font(Font.DIALOG, Font.BOLD, 20));
		pnlPais.add(lblPais, BorderLayout.NORTH);

		tbl = new JTable(modelo);
		tbl.addMouseListener(new TblAdapter());

		pnlPais.add(new JScrollPane(tbl), BorderLayout.CENTER);

		this.add(pnlPais);

		pDAO = new PaisDAOjdbc();

		rendCent = new DefaultTableCellRenderer();
		rendCent.setHorizontalAlignment(JLabel.CENTER);
		rendBlue = new DefaultTableCellRenderer();
		rendBlue.setForeground(Color.BLUE);
		rendBlue.setHorizontalAlignment(JLabel.CENTER);

		tbl.getColumnModel().getColumn(0).setCellRenderer(rendCent);
		tbl.getColumnModel().getColumn(1).setCellRenderer(rendCent);
		tbl.getColumnModel().getColumn(2).setCellRenderer(rendBlue);
		tbl.getColumnModel().getColumn(3).setCellRenderer(rendBlue);
		tbl.getTableHeader().setResizingAllowed(false);
		tbl.getTableHeader().setReorderingAllowed(false);

		this.setTitle("PAIS");

	}

	public void verPais() throws ConectException {
		if (!MyConnection.isCon()) {
			throw new ConectException("Debe conectar la base de datos primero!");
		}
		refreshTbl();
		this.setSize(1000, 650);
		this.setVisible(true);
	}

	private void refreshTbl() {
		lista = pDAO.cargar();
		modelo.setRowCount(0);
		for (Pais p : lista) {
			modelo.addRow(new Object[] { p.getId(), p.getNombre(), "Editar", "Eliminar" });
		}
		tbl.setModel(modelo);
	}

	public class MyModel extends DefaultTableModel {
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		public MyModel(final String[] titulos) {
			super(titulos, 0);
		}

		public MyModel(final Object[][] datos, final String[] titulos) {
			super(datos, titulos);
		}

		@Override
		public boolean isCellEditable(int row, int column) {
			return false;
		}

	}

	public class TblAdapter extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent arg0) {
			if (tbl.getSelectedColumn() == 2) {
				VNuevoPais vnuepais = new VNuevoPais();
				vnuepais.verNuevoPais((Integer) tbl.getValueAt(tbl.getSelectedRow(), 0));
				refreshTbl();
			} else {
				if (tbl.getSelectedColumn() == 3) {
					int op = JOptionPane.showConfirmDialog(null, "¿Seguro quiere eliminar?", "Confirmar",
							JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
					if (op == 0) {
						try {
							pDAO.eliminar(pDAO.encontrar((Integer) tbl.getValueAt(tbl.getSelectedRow(), 0)));
							refreshTbl();
						} catch (ConectException e) {
							JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
						}
					}
				}
			}
		}
	}

	public class NuevAdapter extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent arg0) {
			if (vnuepais == null) {
				vnuepais = new VNuevoPais();
			}
			vnuepais.verNuevoPais(null);
			refreshTbl();
		}
	}

	public class VolvAdapter extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent arg0) {
			dispose();
		}
	}

}
