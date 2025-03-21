package conecciones;

import java.sql.*;
import java.util.ArrayList;

import clases.Futbolista;
import clases.Pais;
import excepciones.ConectException;

public class PaisDAOjdbc implements PaisDAO {

	@Override
	public ArrayList<Pais> cargar() {
		PreparedStatement listaPaises;
		ArrayList<Pais> lista = null;
		try {
			listaPaises = MyConnection.getCon().prepareStatement("SELECT * FROM pais");
			ResultSet result = listaPaises.executeQuery();
			lista = new ArrayList<Pais>();
			while (result.next()) {
				lista.add(new Pais(result.getString("nombre"), result.getString("idioma"), result.getInt("idpais")));
			}
			listaPaises.close();
		} catch (java.sql.SQLException e) {
			System.out.println("Error al cargar en el SQL: " + e.getMessage());
		}
		return lista;
	}

	@Override
	public void eliminar(Pais p) throws ConectException {
		PreparedStatement eliminarPais;
		if (this.tieneFutb(p)) {
			throw new ConectException("El pais no puede tener futbolistas");
		}
		try {
			eliminarPais = MyConnection.getCon().prepareStatement("DELETE FROM pais WHERE nombre=?");
			eliminarPais.setString(1, p.getNombre());
			eliminarPais.executeUpdate();
			eliminarPais.close();
		} catch (java.sql.SQLException e) {
			System.err.println("Error al eliminar en el SQL: " + e.getMessage());
		}
	}

	private boolean tieneFutb(Pais p) {
		FutbolistaDAO fDAO = new FutbolistaDAOjdbc();
		for (Futbolista f : fDAO.cargar()) {
			if (f.getPais().equals(p)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public Pais encontrar(String nombre) {
		PreparedStatement buscarPais;
		try {
			buscarPais = MyConnection.getCon().prepareStatement("SELECT * FROM pais WHERE nombre=?");
			buscarPais.setString(1, nombre);
			ResultSet result = buscarPais.executeQuery();
			Pais pais = null;
			if (result.next()) {
				pais = new Pais(result.getString("nombre"), result.getString("idioma"), result.getInt("idpais"));
			}
			buscarPais.close();
			return pais;
		} catch (java.sql.SQLException e) {
			System.err.println("Error al buscar en el SQL: " + e.getMessage());
			return null;
		}
	}

	@Override
	public Pais encontrar(int id) {
		PreparedStatement buscarPais;
		try {
			buscarPais = MyConnection.getCon().prepareStatement("SELECT * FROM pais WHERE idpais=?");
			buscarPais.setInt(1, id);
			ResultSet result = buscarPais.executeQuery();
			Pais pais = null;
			if (result.next()) {
				pais = new Pais(result.getString("nombre"), result.getString("idioma"), result.getInt("idpais"));
			}
			buscarPais.close();
			return pais;

		} catch (java.sql.SQLException e) {
			System.err.println("Error al buscar en el SQL: " + e.getMessage());
			return null;
		}
	}

	@Override
	public void guardar(Pais p) {
		// CARGAR EN BASE DE DATOS
		if (p.getId() == null) {
			PreparedStatement guardarPais;
			try {
				guardarPais = MyConnection.getCon().prepareStatement("INSERT INTO pais(nombre,idioma) VALUES(?,?)");
				guardarPais.setString(1, p.getNombre());
				guardarPais.setString(2, p.getIdioma());
				guardarPais.executeUpdate();
				guardarPais.close();
			} catch (java.sql.SQLException e) {
				System.err.println("Error al guardar en el SQL: " + e.getMessage());
			}
		} else {
			PreparedStatement modificarPais;
			try {
				modificarPais = MyConnection.getCon()
						.prepareStatement("UPDATE pais SET nombre=?,idioma=? WHERE idPais=?");
				modificarPais.setString(1, p.getNombre());
				modificarPais.setString(2, p.getIdioma());
				modificarPais.setInt(3, p.getId());
				modificarPais.executeUpdate();
				modificarPais.close();
			} catch (java.sql.SQLException e) {
				System.err.println("Error al actualizar en el SQL: " + e.getMessage());
			}
		}
	}
}