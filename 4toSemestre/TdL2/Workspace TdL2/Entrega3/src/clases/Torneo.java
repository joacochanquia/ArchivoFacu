package clases;

import java.util.*;

public class Torneo {
	private String nombre;
	private HashMap<String, Resultados> mapRes;

	public Torneo() {
		mapRes = new HashMap<String, Resultados>();
	}

	public Torneo(String nombre) {
		this.nombre = nombre;
		mapRes = new HashMap<String, Resultados>();
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void addPartido(String homeP, Integer homeS, String awayP, Integer awayS) {
		mapRes.putIfAbsent(homeP, new Resultados(homeP));
		mapRes.putIfAbsent(awayP, new Resultados(awayP));
		if (homeS > awayS) {
			mapRes.get(homeP).addGan();
			mapRes.get(awayP).addPer();
		} else {
			if (homeS < awayS) {
				mapRes.get(homeP).addPer();
				mapRes.get(awayP).addGan();
			} else {
				mapRes.get(homeP).addEmp();
				mapRes.get(awayP).addEmp();
			}
		}
	}

	public String ganador() {
		if (mapRes.isEmpty()) {
			return null;
		}
		Resultados gan = new Resultados();
		gan.setGan(-1);
		Collection<Resultados> listRes = mapRes.values();
		for (Resultados resAct : listRes) {
			if (resAct.getGan() > gan.getGan()) {
				gan = resAct;
			}
		}
		return gan.getPais();
	}

}
