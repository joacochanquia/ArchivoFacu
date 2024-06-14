package clases;

public class Resultados {
	private String pais;
	private Integer gan;
	private Integer per;
	private Integer emp;
	private Integer tor;

	public Resultados() {
		gan = 0;
		per = 0;
		emp = 0;
		tor = 0;
	}
	
	public Resultados(String pais) {
		this.pais = pais;
		gan = 0;
		per = 0;
		emp = 0;
		tor = 0;
	}
	
	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public Integer getGan() {
		return gan;
	}

	public void setGan(Integer gan) {
		this.gan = gan;
	}
	
	public void addGan() {
		this.gan++;
	}

	public Integer getPer() {
		return per;
	}

	public void setPer(Integer per) {
		this.per = per;
	}
	
	public void addPer() {
		this.per++;
	}

	public Integer getEmp() {
		return emp;
	}

	public void setEmp(Integer emp) {
		this.emp = emp;
	}
	
	public void addEmp() {
		this.emp++;
	}

	public Integer getTor() {
		return tor;
	}

	public void setTor(Integer tor) {
		this.tor = tor;
	}
	
	public void addTor() {
		this.tor++;
	}

}
