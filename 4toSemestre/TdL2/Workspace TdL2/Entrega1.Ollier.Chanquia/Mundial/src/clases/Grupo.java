package clases;
/**
 * 
 * @author Gabi
 * @author Joaco
 * 
 * @version 1.0.0
 *
 */
public class Grupo {
	
	private char letra; 
	private int[][] info; 
	private Pais[] pais;
	private Partido[] partido;
	/**
	 * 
	 * @return devuelve la letra del grupo
	 */
	public char getLetra() {
		return letra;
	}
	/**
	 * 
	 * @param letra , recibe la letra del grupo
	 */
	public void setLetra(char letra) {
		this.letra = letra;
	}
	/**
	 * 
	 * @return devuelve la informacion del grupo
	 */
	public int[][] getInfo() {
		return info;
	}
	/**
	 * 
	 * @param info , recibe la infromacion del grupo
	 */
	public void setInfo(int[][] info) {
		this.info = info;
	}
	/**
	 * 
	 * @return devuelve los paises que participan en el grupo
	 */
	public Pais[] getPais() {
		return pais;
	}
	/**
	 * 
	 * @param pais , recibe los paises que participan en el grupo
	 */
	public void setPais(Pais[] pais) {
		this.pais = pais;
	}
	/**
	 * 
	 * @return devuelve los partidos que se juegan en el grupo
	 */
	public Partido[] getPartido() {
		return partido;
	}
	/**
	 * 
	 * @param partido , recibe los partidos que se juegan en el grupo
	 */
	public void setPartido(Partido[] partido) {
		this.partido = partido;
	}
	

}
