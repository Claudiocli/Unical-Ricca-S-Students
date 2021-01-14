package it.urss.payball8.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "card")
public class Card {

	@Id
	private String pan;
	
	private String holder;
	
	private String expiration_date;
	
	private String cvv;
	
	private String datetime;
	
	private Long account;
	
	public Card() {
	}

	public Card(String pan, String holder, String expiration_date, String cvv, String datetime, Long account) {
		this.pan = pan;
		this.holder = holder;
		this.expiration_date = expiration_date;
		this.cvv = cvv;
		this.datetime = datetime;
		this.account = account;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}

	public String getHolder() {
		return holder;
	}

	public void setHolder(String holder) {
		this.holder = holder;
	}

	public String getExpiration_date() {
		return expiration_date;
	}

	public void setExpiration_date(String expiration_date) {
		this.expiration_date = expiration_date;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
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
	
	@Override
	public String toString() {
		return "Card [pan=" + pan + ", holder=" + holder + ", expiration_date=" + expiration_date
				+ ", cvv=" + cvv + ", datetime=" + datetime + ", account=" + account + "]";
	}
	
	
	
}
