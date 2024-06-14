package threads;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

import clases.*;
import ventanas.VEstadisticas.MyModel;

public class LoadTblEst implements Runnable {

	private static final String SEPARADOR = ",";
	private HashMap<String, Resultados> mapPais;
	private HashMap<String, Torneo> mapTour;
	private MyModel modelo;

	public LoadTblEst(MyModel modelo) {
		this.modelo = modelo;
	}

	@Override
	public void run() {
		BufferedReader br = null;
		String fileName;
		String linea = "";
		mapPais = new HashMap<String, Resultados>();
		mapTour = new HashMap<String, Torneo>();
		String homeP;
		String awayP;
		Integer homeS;
		Integer awayS;
		String tour;
		try {
			fileName = "/archivos/results.csv";
			InputStream inputStream = getClass().getResourceAsStream(fileName);
			InputStreamReader streamReader = new InputStreamReader(inputStream, StandardCharsets.UTF_8);
			br = new BufferedReader(streamReader);
			br.readLine();
			while ((linea = br.readLine()) != null) {
				try {
					String[] fields = linea.split(SEPARADOR);
					homeP = fields[1];
					awayP = fields[2];
					homeS = Integer.valueOf(fields[3]);
					awayS = Integer.valueOf(fields[4]);
					tour = fields[5];
					mapPais.putIfAbsent(homeP, new Resultados(homeP));
					mapPais.putIfAbsent(awayP, new Resultados(awayP));
					if (homeS > awayS) {
						mapPais.get(homeP).addGan();
						mapPais.get(awayP).addPer();
					} else {
						if (homeS < awayS) {
							mapPais.get(homeP).addPer();
							mapPais.get(awayP).addGan();
						} else {
							mapPais.get(homeP).addEmp();
							mapPais.get(awayP).addEmp();
						}
					}
					if (!tour.equals("Friendly")) {
						mapTour.putIfAbsent(tour, new Torneo(tour));
						mapTour.get(tour).addPartido(homeP, homeS, awayP, awayS);
					}
				} catch (NumberFormatException e) {
					System.err.println("No se encontro un resultado correcto");
				}
			}
		} catch (FileNotFoundException e) {
			System.err.println("No se encontro el archivo: " + e.getMessage());
		} catch (IOException e) {
			System.err.println("Problema de entrada salida: " + e.getMessage());
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (IOException e) {
					System.err.println("Problema de entrada salida: " + e.getMessage());
				}
		}
		//SE AGREGAN LOS TORNEOS GANADOS PARA CADA PAIS
		Collection<Torneo> listTour = mapTour.values();
		for (Torneo torAct : listTour) {
			mapPais.get(torAct.ganador()).addTor();
		}
		modelo.setRowCount(0);
		Collection<Resultados> listRes = mapPais.values();
		for (Resultados resAct : listRes) {
			modelo.addRow(new Object[] { resAct.getPais(), resAct.getGan(), resAct.getPer(), resAct.getEmp(),
					resAct.getTor() });
		}
	}

}
