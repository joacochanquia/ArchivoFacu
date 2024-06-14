package conecciones;

public class FactoryDAO {

	public static FutbolistaDAO getFutbolistaDAO() {
		return new FutbolistaDAOjdbc();
	}

	public static PaisDAO getPaisDAO() {
		return new PaisDAOjdbc();
	}

}
