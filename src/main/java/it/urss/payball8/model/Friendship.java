package it.urss.payball8.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "friendship")
public class Friendship {

	
	private String datetime;
	@Id
	private Long account1;
	
	private Long account2;
	
	public Friendship() {
	}

	public Friendship(String datetime, Long account1, Long account2) {
		this.datetime = datetime;
		this.account1 = account1;
		this.account2 = account2;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public Long getAccount1() {
		return account1;
	}

	public void setAccount1(Long account1) {
		this.account1 = account1;
	}

	public Long getAccount2() {
		return account2;
	}

	public void setAccount2(Long account2) {
		this.account2 = account2;
	}

	@Override
	public String toString() {
		return "Friendship [datetime=" + datetime + ", account1=" + account1 + ", account2=" + account2 + "]";
	}
	
	
	
}
