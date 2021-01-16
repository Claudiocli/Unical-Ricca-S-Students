package it.urss.payball8.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@Table(name = "contribute")
@IdClass(Contribute.class)
public class Contribute implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	private Long contributor;
	
	@Id 
	private Long colletta;

	public Contribute() {
	}
	
	public Contribute(Long contributor, Long colletta) {
		this.contributor = contributor;
		this.colletta = colletta;
	}

	public Long getContributor() {
		return contributor;
	}

	public void setContributor(Long contributor) {
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
	
}
