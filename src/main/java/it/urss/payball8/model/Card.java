package it.urss.payball8.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/*
@Entity
@Table(name = "card")
 */
public class Card {

	@Id
	private Long id;
	
	private String pan;
	
	private String holder;
	
	private String expiration_date;
	
	private String cvv;
	
	private String datatime;
	
	private Account account;
	
	public Card() {
	}

	public Card(Long id, String pan, String holder, String expiration_date, String cvv, String datatime, Account account) {
		this.id = id;
		this.pan = pan;
		this.holder = holder;
		this.expiration_date = expiration_date;
		this.cvv = cvv;
		this.datatime = datatime;
		this.account = account;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getDatatime() {
		return datatime;
	}

	public void setDatatime(String datatime) {
		this.datatime = datatime;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	
	@Override
	public String toString() {
		return "Card [id=" + id + ", pan=" + pan + ", holder=" + holder + ", expiration_date=" + expiration_date
				+ ", cvv=" + cvv + ", datatime=" + datatime + ", account=" + account + "]";
	}
	
	
	
}
