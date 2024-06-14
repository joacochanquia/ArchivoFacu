package ventanas;

import java.awt.*;
import java.awt.event.*;

import javax.swing.*;
import javax.swing.border.*;
import javax.swing.table.*;

import threads.LoadTblEst;

public class VEstadisticas extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JPanel pnlImp;
	private JButton btnImp;

	private JPanel pnlTbl;

	private JTable tbl;
	private String[] titulos = { "Pais", "Part. ganados", "Part. perdidos", "Part. empatados", "Cant. Torneos" };
	private MyModel modelo = new MyModel(titulos);
	private DefaultTableCellRenderer rendCent;

	public VEstadisticas() {
		this.setLayout(new BorderLayout());

		tbl = new JTable(modelo);
		pnlTbl = new JPanel();
		pnlTbl.setBorder(new EmptyBorder(20, 20, 20, 20));
		pnlTbl.setLayout(new BorderLayout());
		pnlTbl.add(new JScrollPane(tbl), BorderLayout.CENTER);
		this.add(pnlTbl, BorderLayout.CENTER);

		pnlImp = new JPanel();
		pnlImp.setBorder(new EmptyBorder(20, 20, 20, 20));
		btnImp = new JButton("IMPORTAR DATOS");
		btnImp.addMouseListener(new ImpAdapter());
		pnlImp.add(btnImp);
		this.add(pnlImp, BorderLayout.SOUTH);

		rendCent = new DefaultTableCellRenderer();
		rendCent.setHorizontalAlignment(JLabel.CENTER);

		tbl.setAutoCreateRowSorter(true);
		tbl.getColumnModel().getColumn(0).setCellRenderer(rendCent);
		tbl.getColumnModel().getColumn(1).setCellRenderer(rendCent);
		tbl.getColumnModel().getColumn(2).setCellRenderer(rendCent);
		tbl.getColumnModel().getColumn(3).setCellRenderer(rendCent);
		tbl.getColumnModel().getColumn(4).setCellRenderer(rendCent);
		tbl.getTableHeader().setResizingAllowed(false);
		tbl.getTableHeader().setReorderingAllowed(false);

		this.setTitle("ESTADISTICAS");
	}

	public void verEstadisticas() {
		tbl.setAutoCreateRowSorter(false);
		tbl.setAutoCreateRowSorter(true);
		this.setSize(700, 400);
		this.setVisible(true);
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

		@SuppressWarnings({ "unchecked", "rawtypes" })
		@Override
		public Class getColumnClass(final int column) {
			return this.getValueAt(0, column).getClass();
		}

		@Override
		public boolean isCellEditable(int row, int column) {
			return false;
		}

	}

	public class ImpAdapter extends MouseAdapter {
		public void mouseClicked(MouseEvent arg0) {

			tbl.setAutoCreateRowSorter(false);
			tbl.setAutoCreateRowSorter(true);

			new Thread(new LoadTblEst(modelo)).start();

		}
	}

}
