package conecciones;

import java.sql.*;
import java.util.ArrayList;

import clases.Futbolista;

public class FutbolistaDAOjdbc implements FutbolistaDAO {

	@Override
	public ArrayList<Futbolista> cargar() {
		PreparedStatement listaFutbolista;
		ArrayList<Futbolista> lista = null;
		try {
			listaFutbolista = MyConnection.getCon().prepareStatement("SELECT * FROM futbolista");
			ResultSet result = listaFutbolista.executeQuery();
			lista = new ArrayList<Futbolista>();
			PaisDAO pDAO = new PaisDAOjdbc();
			while (result.next()) {
				lista.add(new Futbolista(result.getString("nombre"), result.getString("apellido"),
						result.getInt("docIdentidad"), result.getInt("telefono"), result.getString("email"),
						pDAO.encontrar(result.getInt("idpais")), result.getInt("idfutbolista")));
			}
			listaFutbolista.close();
		} catch (java.sql.SQLException e) {
			System.err.println("Error al cargar del SQL: " + e.getMessage());
		}
		return lista;
	}

	@Override
	public void eliminar(Futbolista f) {
		PreparedStatement eliminarFutbolista;
		try {
			eliminarFutbolista = MyConnection.getCon()
					.prepareStatement("DELETE FROM futbolista WHERE idfutbolista=?");
			eliminarFutbolista.setInt(1, f.getId());
			eliminarFutbolista.executeUpdate();
			eliminarFutbolista.close();
		} catch (java.sql.SQLException e) {
			System.err.println("Error al eliminar del SQL: " + e.getMessage());
		}
	}

	@Override
	public Futbolista encontrar(String nombre, String apellido) {
		PreparedStatement buscarFutbolista;
		try {
			buscarFutbolista = MyConnection.getCon()
					.prepareStatement("SELECT * FROM futbolista WHERE apellido=? AND nombre=?");
			buscarFutbolista.setString(1, apellido);
			buscarFutbolista.setString(2, nombre);
			ResultSet result = buscarFutbolista.executeQuery();
			Futbolista futbolista = null;
			PaisDAO pDAO = new PaisDAOjdbc();
			if (result.next()) {
				futbolista = new Futbolista(result.getString("nombre"), result.getString("apellido"),
						result.getInt("docIdentidad"), result.getInt("telefono"), result.getString("email"),
						pDAO.encontrar(result.getInt("idpais")), result.getInt("idfutbolista"));
			}
			buscarFutbolista.close();
			return futbolista;
		} catch (java.sql.SQLException e) {
			System.err.println("Error al buscar en el SQL: " + e.getMessage());
			return null;
		}
	}

	@Override
	public Futbolista encontrar(int id) {
		PreparedStatement buscarFutbolista;
		try {
			buscarFutbolista = MyConnection.getCon().prepareStatement("SELECT * FROM futbolista WHERE idfutbolista=?");
			buscarFutbolista.setInt(1, id);
			ResultSet result = buscarFutbolista.executeQuery();
			Futbolista futbolista = null;
			PaisDAO pDAO = new PaisDAOjdbc();
			if (result.next()) {
				futbolista = new Futbolista(result.getString("nombre"), result.getString("apellido"),
						result.getInt("docIdentidad"), result.getInt("telefono"), result.getString("email"),
						pDAO.encontrar(result.getInt("idpais")), result.getInt("idfutbolista"));
			}
			buscarFutbolista.close();
			return futbolista;
		} catch (java.sql.SQLException e) {
			System.err.println("Error al buscar en el SQL: " + e.getMessage());
			return null;
		}
	}

	@Override
	public void guardar(Futbolista f) {
		// CARGAR FUTBOLISTA EN LA BASE DE DATOS
		if (f.getId() == null) {
			PreparedStatement guardarFutbolista;
			try {
				guardarFutbolista = MyConnection.getCon().prepareStatement(
						"INSERT INTO futbolista(nombre,apellido,docIdentidad,telefono,email,idpais) VALUES(?,?,?,?,?,?)");
				guardarFutbolista.setString(1, f.getNombre());
				guardarFutbolista.setString(2, f.getApellido());
				guardarFutbolista.setInt(3, f.getDocId());
				guardarFutbolista.setInt(4, f.getTelefono());
				guardarFutbolista.setString(5, f.getEmail());
				guardarFutbolista.setInt(6, f.getPais().getId());
				guardarFutbolista.executeUpdate();
				guardarFutbolista.close();
			} catch (java.sql.SQLException e) {
				System.err.println("Error de SQL: " + e.getMessage());
			}
		} else {
			PreparedStatement modificarFutbolista;
			try {
				modificarFutbolista = MyConnection.getCon().prepareStatement(
						"UPDATE futbolista SET nombre=?,apellido=?,docIdentidad=?,telefono=?,email=?,idpais=? WHERE idfutbolista=?");
				modificarFutbolista.setString(1, f.getNombre());
				modificarFutbolista.setString(2, f.getApellido());
				modificarFutbolista.setInt(3, f.getDocId());
				modificarFutbolista.setInt(4, f.getTelefono());
				modificarFutbolista.setString(5, f.getEmail());
				modificarFutbolista.setInt(6, f.getPais().getId());
				modificarFutbolista.setInt(7, f.getId());
				modificarFutbolista.executeUpdate();
				modificarFutbolista.close();
			} catch (java.sql.SQLException e) {
				System.err.println("Error de SQL: " + e.getMessage());
			}
		}
	}

}
