package it.urss.payball8.model;

public class WrapperCollettaContribute {

	private Colletta colletta;

	private Contribute contribute;

	public WrapperCollettaContribute() {
	}

	public WrapperCollettaContribute(Colletta colletta, Contribute contribute) {
		super();
		this.colletta = colletta;
		this.contribute = contribute;
	}

	public Colletta getColletta() {
		return colletta;
	}

	public void setColletta(Colletta colletta) {
		this.colletta = colletta;
	}

	public Contribute getContribute() {
		return contribute;
	}

	public void setContribute(Contribute contribute) {
		this.contribute = contribute;
	}

	@Override
	public String toString() {
		return "WrapperCollettaContribute [colletta=" + colletta + ", contribute=" + contribute + "]";
	}

}
