package it.urss.payball8.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "recharge")
public class Recharge implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; 
	
	private String datetime;
	
	private Long account;
	
	private String card;
	
	private Float amount;

	public Recharge() {
		
	}
	
	public Recharge(Long id, String datetime, Long account, String card, Float amount) {
		this.id = id;
		this.datetime = datetime;
		this.account = account;
		this.card = card;
		this.amount = amount;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public Long getAccount() {
		return account;
	}

	public void setAccount(Long account) {
		this.account = account;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public Float getAmount() {
		return amount;
	}

	public void setAmount(Float amount) {
		this.amount = amount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Recharge [id=" + id + ", datetime=" + datetime + ", account=" + account + ", card=" + card + ", amount="
				+ amount + "]";
	}
	
	
	
}
