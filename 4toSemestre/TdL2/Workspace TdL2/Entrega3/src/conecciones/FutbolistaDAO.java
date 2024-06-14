package conecciones;

import java.util.ArrayList;

import clases.Futbolista;

public interface FutbolistaDAO {

	public ArrayList<Futbolista> cargar();

	public void eliminar(Futbolista f);

	public Futbolista encontrar(String nombre, String apellido);

	public Futbolista encontrar(int id);

	public void guardar(Futbolista f);
}
