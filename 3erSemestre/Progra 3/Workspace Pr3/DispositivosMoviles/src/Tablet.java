
public class Tablet extends Mobile {
	private float pulgadas;

	public float getPulgadas() {
		return pulgadas;
	}
	public void setPulgadas(float pulgadas) {
		this.pulgadas = pulgadas;
	}
	@Override
	public String toString() {
		return "Tablet [" + super.toString() + ", pulgadas=" + pulgadas + "]";
	}
	@Override
	public boolean equals(Object o) {
		boolean result=false;
		if ((o!=null) && (o instanceof Tablet)){
			Tablet t = (Tablet) o;
			if ((t.getPulgadas()==this.getPulgadas())&& super.equals(o)) 
				result=true;
		}
		return result;
	}
	
}
