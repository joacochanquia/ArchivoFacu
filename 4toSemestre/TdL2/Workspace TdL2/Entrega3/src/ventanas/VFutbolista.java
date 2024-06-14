package ventanas;

import java.util.*;
import java.awt.*;
import java.awt.event.*;
import java.io.FileWriter;
import java.io.IOException;

import javax.swing.*;
import javax.swing.border.*;
import javax.swing.table.*;

import conecciones.*;
import excepciones.*;
import clases.*;

public class VFutbolista extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel btns;
	private JButton btnNuev;
	private JButton btnCsv;
	private JButton btnVolv;

	private JPanel pnlDep;
	private JLabel lblDep;

	private JTable tbl;
	private String[] titulos = { "ID", "NOMBRE", "APELLIDO", "EDITAR", "ELIMINAR" };
	private MyModel modelo = new MyModel(titulos);
	private DefaultTableCellRenderer rendBlue;
	private DefaultTableCellRenderer rendCent;

	private static final String SEPARADOR = ",";
	private FutbolistaDAOjdbc fDAO;
	private ArrayList<Futbolista> lista;
	private VNuevoFutbolista vnuefutb;

	public VFutbolista() {

		this.setLayout(new BorderLayout());

		btns = new JPanel();
		btns.setBorder(new EmptyBorder(30, 30, 10, 30));
		FlowLayout flow = new FlowLayout();
		flow.setAlignment(FlowLayout.RIGHT);
		btns.setLayout(flow);

		btnNuev = new JButton("+ NUEVO");
		btnNuev.addMouseListener(new NuevAdapter());
		btns.add(btnNuev);

		btnCsv = new JButton("EXPORTAR CSV");
		btnCsv.addMouseListener(new CsvAdapter());
		btns.add(btnCsv);

		btnVolv = new JButton("VOLVER");
		btnVolv.addMouseListener(new VolvAdapter());
		btns.add(btnVolv);

		this.add(btns, BorderLayout.NORTH);

		pnlDep = new JPanel();
		pnlDep.setBorder(new EmptyBorder(10, 20, 40, 20));
		pnlDep.setLayout(new BorderLayout());

		lblDep = new JLabel("Deportistas");
		lblDep.setFont(new Font(Font.DIALOG, Font.BOLD, 20));
		pnlDep.add(lblDep, BorderLayout.NORTH);

		tbl = new JTable(modelo);
		tbl.addMouseListener(new TblAdapter());

		pnlDep.add(new JScrollPane(tbl), BorderLayout.CENTER);

		this.add(pnlDep);

		fDAO = new FutbolistaDAOjdbc();

		rendCent = new DefaultTableCellRenderer();
		rendCent.setHorizontalAlignment(JLabel.CENTER);
		rendBlue = new DefaultTableCellRenderer();
		rendBlue.setForeground(Color.BLUE);
		rendBlue.setHorizontalAlignment(JLabel.CENTER);

		tbl.getColumnModel().getColumn(0).setCellRenderer(rendCent);
		tbl.getColumnModel().getColumn(1).setCellRenderer(rendCent);
		tbl.getColumnModel().getColumn(2).setCellRenderer(rendCent);
		tbl.getColumnModel().getColumn(3).setCellRenderer(rendBlue);
		tbl.getColumnModel().getColumn(4).setCellRenderer(rendBlue);
		tbl.getTableHeader().setResizingAllowed(false);
		tbl.getTableHeader().setReorderingAllowed(false);

		this.setTitle("FUTBOLISTAS");

	}

	public void verFutbolista() throws ConectException {
		if (!MyConnection.isCon()) {
			throw new ConectException("Debe conectar la base de datos primero!");
		}
		refreshTbl();
		this.setSize(1000, 650);
		this.setVisible(true);
	}

	private void refreshTbl() {
		lista = fDAO.cargar();
		modelo.setRowCount(0);
		for (Futbolista f : lista) {
			modelo.addRow(new Object[] { f.getId(), f.getNombre(), f.getApellido(), "Editar", "Eliminar" });
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
			if (tbl.getSelectedColumn() == 3) {
				VNuevoFutbolista vnuefutb = new VNuevoFutbolista();
				vnuefutb.verNuevoFutbolista((Integer) tbl.getValueAt(tbl.getSelectedRow(), 0));
				refreshTbl();
			} else {
				if (tbl.getSelectedColumn() == 4) {
					int op = JOptionPane.showConfirmDialog(null, "¿Seguro quiere eliminar?", "Confirmar",
							JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
					if (op == 0) {
						fDAO.eliminar(fDAO.encontrar((Integer) tbl.getValueAt(tbl.getSelectedRow(), 0)));
						refreshTbl();
					}
				}
			}
		}
	}

	public class NuevAdapter extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent arg0) {
			if (vnuefutb == null) {
				vnuefutb = new VNuevoFutbolista();
			}
			vnuefutb.verNuevoFutbolista(null);
			refreshTbl();
		}
	}

	public class CsvAdapter extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent arg0) {
			String id, nom, ape;
			ArrayList<String> filas = new ArrayList<String>();
			for (int i = 0; i < tbl.getRowCount(); i++) {
				id = String.valueOf(tbl.getValueAt(i, 0));
				nom = String.valueOf(tbl.getValueAt(i, 1));
				ape = String.valueOf(tbl.getValueAt(i, 2));
				filas.add(id + SEPARADOR + nom + SEPARADOR + ape);
			}
			try {
				FileWriter csvWriter = new FileWriter(System.getProperty("user.home") + "\\Documents\\futbolistas.csv");
				csvWriter.append("ID");
				csvWriter.append(SEPARADOR);
				csvWriter.append("NOMBRE");
				csvWriter.append(SEPARADOR);
				csvWriter.append("APELLIDO");
				csvWriter.append('\n');
				for (String datos_fila : filas) {
					csvWriter.append(datos_fila);
					csvWriter.append('\n');
				}
				csvWriter.close();
			} catch (IOException e) {
				System.err.println("Problema de entrada salida: " + e.getMessage());
			}
		}
	}

	public class VolvAdapter extends MouseAdapter {
		@Override
		public void mouseClicked(MouseEvent arg0) {
			dispose();
		}
	}

}
