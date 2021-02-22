package it.urss.payball8.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "contribute")
public class Contribute implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;

	private String contributor;

	private Long colletta;

	private String stato;

	public Contribute() {
		stato = "default";
	}

	public Contribute(Long id, String contributor, Long colletta, String stato) {
		super();
		this.id = id;
		this.contributor = contributor;
		this.colletta = colletta;
		this.stato = stato;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getStato() {
		return stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Contribute [id=" + id + ", contributor=" + contributor + ", colletta=" + colletta + ", stato=" + stato
				+ "]";
	}

	

}
