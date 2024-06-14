package conecciones;

import java.util.ArrayList;
import clases.Pais;
import excepciones.ConectException;

public interface PaisDAO {
	
	public ArrayList<Pais> cargar();

	public void eliminar(Pais p) throws ConectException;

	public Pais encontrar(String nombre);

	public Pais encontrar(int id);

	public void guardar(Pais p);
}
