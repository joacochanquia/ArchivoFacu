package aplicaciones;

import java.util.Scanner;
import clases.*;
import java.sql.*;

public class IngresarDatos {

	static Scanner in = new Scanner(System.in);

	public static void main(String[] args) {
		String dir, usuario, contra;
		System.out.println("Ingrese base de datos:");
		dir = in.next();
		System.out.println("Ingrese usuario:");
		usuario = in.next();
		System.out.println("Ingrese contraseña:");
		contra = in.next();

		Connection base;
		try {
			base = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dir, usuario, contra);
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return;
		}
		int n;
		do {
			System.out.println("Que dato quiere ingresar?");
			System.out.println("[0] Salir	[1] Pais	[2] Sede	[3] Futbolista");
			n = in.nextInt();
			in.nextLine();
			switch (n) {
			case 0:
				break;
			case 1:
				ingresarPais(base);
				break;
			case 2:
				ingresarSede(base);
				break;
			case 3:
				ingresarFutbolista(base);
				break;
			default:
				System.out.println("Opcion Invalida");
				break;
			}
		} while (n != 0);
		in.close();
		try {
			base.close();
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return;
		}
	}

	public static boolean ingresarPais(Connection base) {
		System.out.println("Ingrese nombre del pais: ");
		String nombre = in.nextLine();
		int existe = BuscarDatos.idPais(base, nombre);
		if (existe != -1) {
			System.out.println("Ese pais ya existe");
			return false;
		}

		System.out.println("Ingrese idioma del pais: ");
		String idioma = in.nextLine();

		Pais pais = new Pais(nombre, idioma);

		return cargarPais(base, pais);

	}

	public static boolean cargarPais(Connection base, Pais pais) {
		// CARGAR EN BASE DE DATOS
		PreparedStatement cargarPais;
		try {
			cargarPais = base.prepareStatement("INSERT INTO pais(nombre,idioma) VALUES(?,?)");
			cargarPais.setString(1, pais.getNombre());
			cargarPais.setString(2, pais.getIdioma());
			int result = cargarPais.executeUpdate();
			if (result != 0) {
				System.out.println("Pais cargado exitosamente");
				cargarPais.close();
				return true;
			} else {
				System.out.println("No se pudo cargar el pais");
				cargarPais.close();
				return false;
			}
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return false;
		}
	}

	public static boolean ingresarSede(Connection base) {
		System.out.println("Ingrese nombre del pais de la sede: ");
		String nombPais = in.nextLine();
		int idpais = BuscarDatos.idPais(base, nombPais);
		if (idpais == -1) {
			System.out.println("Ese pais no existe");
			return false;
		}

		System.out.println("Ingrese nombre de la sede: ");
		String nombre = in.nextLine();
		int existe = BuscarDatos.idSede(base, idpais, nombre);
		if (existe != -1) {
			System.out.println("Esa sede ya existe, ¿quiere modificarla(1), eliminarla(2) o nada(0)?");
			int n = in.nextInt();
			in.nextLine();
			switch (n) {
			case 1:
				// MODIFICAR
				return modificarSede(base, existe);
			case 2:
				// ELIMINAR
				return eliminarSede(base, existe);
			}
			return false;
		} else {
			System.out.println("Ingrese capacidad de la sede: ");
			int capacidad = in.nextInt();
			in.nextLine();

			Sede sede = new Sede(nombre, capacidad, BuscarDatos.buscarPais(base, idpais));

			return cargarSede(base, sede);

		}

	}

	public static boolean eliminarSede(Connection base, int idsede) {
		PreparedStatement eliminarSede;
		try {
			eliminarSede = base.prepareStatement("DELETE FROM sede WHERE idsede=?");
			eliminarSede.setInt(1, idsede);
			int result = eliminarSede.executeUpdate();
			if (result != 0) {
				System.out.println("Sede eliminada exitosamente");
				eliminarSede.close();
				return true;
			} else {
				System.out.println("No se pudo eliminar la sede");
				eliminarSede.close();
				return false;
			}
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return false;
		}
	}

	public static boolean modificarSede(Connection base, int idsede) {
		System.out.println("Ingrese nuevo nombre de la sede: ");
		String nombre = in.nextLine();
		System.out.println("Ingrese nueva capacidad de la sede: ");
		int capacidad = in.nextInt();
		in.nextLine();
		System.out.println("Ingrese nuevo pais de la sede: ");
		String nombPais = in.nextLine();
		int idpais = BuscarDatos.idPais(base, nombPais);
		if (idpais == -1) {
			System.out.println("Ese pais no existe");
			return false;
		}
		int existe = BuscarDatos.idSede(base, idpais, nombre);
		if (existe != -1) {
			System.out.println("Esa sede ya existe");
			return false;
		}
		PreparedStatement modificarSede;
		try {
			modificarSede = base.prepareStatement("UPDATE sede SET nombre=?,capacidad=?,idpais=? WHERE idsede=?");
			modificarSede.setString(1, nombre);
			modificarSede.setInt(2, capacidad);
			modificarSede.setInt(3, idpais);
			modificarSede.setInt(4, idsede);
			int result = modificarSede.executeUpdate();
			if (result != 0) {
				System.out.println("Sede modificada exitosamente");
				modificarSede.close();
				return true;
			} else {
				System.out.println("No se pudo modificar la sede");
				modificarSede.close();
				return false;
			}
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return false;
		}
	}

	public static boolean cargarSede(Connection base, Sede sede) {
		// CARGAR SEDE EN BASE DE DATOS
		PreparedStatement cargarSede;
		try {
			cargarSede = base.prepareStatement("INSERT INTO sede(nombre,capacidad,idpais) VALUES(?,?,?)");
			cargarSede.setString(1, sede.getNombre());
			cargarSede.setInt(2, sede.getCapacidad());
			cargarSede.setInt(3, BuscarDatos.idPais(base, sede.getPais().getNombre()));
			int result = cargarSede.executeUpdate();
			if (result != 0) {
				System.out.println("Sede cargado exitosamente");
				cargarSede.close();
				return true;
			} else {
				System.out.println("No se pudo cargar la sede");
				cargarSede.close();
				return false;
			}
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return false;
		}
	}

	public static boolean ingresarFutbolista(Connection base) {
		System.out.println("Ingrese nombre del jugador: ");
		String nombre = in.nextLine();
		System.out.println("Ingrese apellido del jugador: ");
		String apellido = in.nextLine();
		System.out.println("Ingrese documento del jugador: ");
		int docId = in.nextInt();
		in.nextLine();
		int idfutbolista = BuscarDatos.idFutbolista(base, docId);
		if (idfutbolista != -1) {
			System.out.println("Ese futbolista ya existe");
			return false;
		}
		System.out.println("Ingrese telefono del jugador: ");
		int telefono = in.nextInt();
		in.nextLine();
		System.out.println("Ingrese email del jugador: ");
		String email = in.nextLine();

		BuscarDatos.printPaises(base);

		System.out.println("Ingrese id del pais al que pertenece: ");
		int idpais = in.nextInt();
		Pais pais = BuscarDatos.buscarPais(base, idpais);
		if (pais == null) {
			System.out.println("Ese pais no existe");
			return false;
		}

		Futbolista futbolista = new Futbolista(nombre, apellido, docId, telefono, email, pais);
		System.out.println("Quiere guardar al futbolista: Si[1] No[2]");
		System.out.println(futbolista);
		int n = in.nextInt();
		in.nextLine();
		switch (n) {
		case 1:
			return cargarFutbolista(base, futbolista);
		case 2:
			System.out.println("Ha elegido no cargar al futbolista");
			return true;
		default:
			System.out.println("Opcion invalida");
			return false;
		}

	}

	public static boolean cargarFutbolista(Connection base, Futbolista futbolista) {
		// CARGAR FUTBOLISTA EN LA BASE DE DATOS
		PreparedStatement cargarFutbolista;
		try {
			cargarFutbolista = base.prepareStatement(
					"INSERT INTO futbolista(nombre,apellido,docIdentidad,telefono,email,idpais) VALUES(?,?,?,?,?,?)");
			cargarFutbolista.setString(1, futbolista.getNombre());
			cargarFutbolista.setString(2, futbolista.getApellido());
			cargarFutbolista.setInt(3, futbolista.getDocId());
			cargarFutbolista.setInt(4, futbolista.getTelefono());
			cargarFutbolista.setString(5, futbolista.getEmail());
			cargarFutbolista.setInt(6, BuscarDatos.idPais(base, futbolista.getPais().getNombre()));
			int result = cargarFutbolista.executeUpdate();
			if (result != 0) {
				System.out.println("Futbolista cargado exitosamente");
				cargarFutbolista.close();
				return true;
			} else {
				System.out.println("No se pudo cargar el futbolista");
				cargarFutbolista.close();
				return false;
			}
		} catch (java.sql.SQLException e) {
			System.out.println("Error de SQL: " + e.getMessage());
			return false;
		}
	}

}
