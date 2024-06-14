package conecciones;

import java.sql.*;

import excepciones.ConectException;

public class MyConnection {
	private static Connection con = null;

	public static void setCon(String usuario, String contra) throws ConectException {
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + "mundial_futbol_2022", usuario, contra);
		} catch (SQLException e) {
			if (e.getMessage().contains("Communications link failure")) {
				throw new ConectException("No se encuentra la base de datos");
			}
			if(e.getMessage().contains("Access denied for user")) {
				throw new ConectException("Usuario o contraseña incorrectos");
			}
			System.err.println("Error de SQL: " + e.getMessage());
		}
	}

	public static Connection getCon() {
		return con;
	}

	public static boolean isCon() {
		return con != null;
	}

	public static void close() {
		try {
			if (con != null) {
				con.close();
				con = null;
			}
		} catch (SQLException e) {
			System.err.println("Error de SQL: " + e.getMessage());
		}
	}

}
