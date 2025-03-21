package aplicaciones;

import java.sql.*;
import clases.*;

public class BuscarDatos {

	public static void printPaises(Connection base) {
		PreparedStatement printPaises;
		try {
			printPaises = base.prepareStatement("SELECT * FROM pais");
			ResultSet result = printPaises.executeQuery();
			while (result.next()) {
				System.out.println(result.getInt("idpais") + "\t" + result.getString("nombre"));
			}
			printPaises.close();
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
		}
	}

	public static int idPais(Connection base, String nombre) {
		PreparedStatement idPais;
		try {
			idPais = base.prepareStatement("SELECT * FROM pais WHERE nombre=?");
			idPais.setString(1, nombre);
			ResultSet result = idPais.executeQuery();
			if (result.next()) {
				int id = result.getInt("idpais");
				idPais.close();
				return id;
			} else {
				idPais.close();
				return -1;
			}
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return -1;
		}
	}

	public static Pais buscarPais(Connection base, int idpais) {
		PreparedStatement buscarPais;
		try {
			buscarPais = base.prepareStatement("SELECT * FROM pais WHERE idpais=?");
			buscarPais.setInt(1, idpais);
			ResultSet result = buscarPais.executeQuery();
			if (result.next()) {
				Pais pais = new Pais(result.getString("nombre"), result.getString("idioma"));
				buscarPais.close();
				return pais;
			} else {
				buscarPais.close();
				return null;
			}
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return null;
		}
	}

	public static int idSede(Connection base, int idPais, String nombre) {
		PreparedStatement idSede;
		try {
			idSede = base.prepareStatement("SELECT * FROM sede WHERE nombre=? AND idpais=?");
			idSede.setString(1, nombre);
			idSede.setInt(2, idPais);
			ResultSet result = idSede.executeQuery();
			if (result.next()) {
				int id = result.getInt("idsede");
				idSede.close();
				return id;
			} else {
				idSede.close();
				return -1;
			}
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return -1;
		}
	}

	public static Sede buscarSede(Connection base, int idsede) {
		PreparedStatement buscarSede;
		try {
			buscarSede = base.prepareStatement("SELECT * FROM sede WHERE idsede=?");
			buscarSede.setInt(1, idsede);
			ResultSet result = buscarSede.executeQuery();
			if (result.next()) {
				Sede sede = new Sede(result.getString("nombre"), result.getInt("capacidad"),
						BuscarDatos.buscarPais(base, result.getInt("idpais")));
				buscarSede.close();
				return sede;
			} else {
				buscarSede.close();
				return null;
			}
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return null;
		}
	}

	public static int idFutbolista(Connection base, int docId) {
		PreparedStatement idFutbolista;
		try {
			idFutbolista = base.prepareStatement("SELECT * FROM futbolista WHERE docIdentidad=?");
			idFutbolista.setInt(1, docId);
			ResultSet result = idFutbolista.executeQuery();
			if (result.next()) {
				int id = result.getInt("idfutbolista");
				idFutbolista.close();
				return id;
			} else {
				idFutbolista.close();
				return -1;
			}
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return -1;
		}
	}

	public static Futbolista buscarFutbolista(Connection base, int idfutbolista) {
		PreparedStatement buscarFutbolista;
		try {
			buscarFutbolista = base.prepareStatement("SELECT * FROM futbolista WHERE idfutbolista=?");
			buscarFutbolista.setInt(1, idfutbolista);
			ResultSet result = buscarFutbolista.executeQuery();
			if (result.next()) {
				Futbolista futbolista = new Futbolista(result.getString("nombre"), result.getString("apellido"),
						result.getInt("docIdentidad"), result.getInt("telefono"), result.getString("email"),
						BuscarDatos.buscarPais(base, result.getInt("idpais")));
				buscarFutbolista.close();			
				return futbolista;
			} else {
				buscarFutbolista.close();
				return null;
			}
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return null;
		}
	}

}
