
public class SmartPhone extends Mobile {
	private int numero;

	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	@Override
	public String toString() {
		return "SmartPhone [" + super.toString() + ", numero=" + numero + "]";
	}
	@Override
	public boolean equals(Object o) {
		boolean result=false;
		if ((o!=null) && (o instanceof SmartPhone)){
			SmartPhone s = (SmartPhone) o;
			if ((s.getNumero()==this.getNumero())&& super.equals(o)) 
				result=true;
		}
		return result;
	}
	
}
