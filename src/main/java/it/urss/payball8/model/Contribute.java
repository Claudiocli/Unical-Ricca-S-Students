package it.urss.payball8.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@Table(name = "contribute")
@IdClass(Contribute.class)
public class Contribute implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String contributor;

	@Id
	private Long colletta;

	private String stato;

	public Contribute() {
	}

	public Contribute(String contributor, Long colletta, String stato) {
		this.contributor = contributor;
		this.colletta = colletta;
		this.stato = stato;
	}

	public String getContributor() {
		return contributor;
	}

	public void setContributor(String contributor) {
		this.contributor = contributor;
	}

	public Long getColletta() {
		return colletta;
	}

	public void setColletta(Long colletta) {
		this.colletta = colletta;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getStato() {
		return stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}

	@Override
	public String toString() {
		return "Contribute [contributor=" + contributor + ", colletta=" + colletta + ", stato=" + stato + "]";
	}

}
