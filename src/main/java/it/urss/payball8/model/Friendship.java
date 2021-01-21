package it.urss.payball8.model;

import java.time.Clock;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@Table(name = "friendship")
@IdClass(Friendship.class)
public class Friendship implements java.io.Serializable{

	private static final long serialVersionUID = 1L;

	private String datetime;
	
	@Id
	private String account1;
	
	@Id
	private String account2;
	
	public Friendship() {
		Clock clock = Clock.systemDefaultZone();
		datetime = LocalDateTime.now(clock).toString();
	}

	public Friendship(String datetime, String account1, String account2) {
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

	public String getAccount1() {
		return account1;
	}

	public void setAccount1(String account1) {
		this.account1 = account1;
	}

	public String getAccount2() {
		return account2;
	}

	public void setAccount2(String account2) {
		this.account2 = account2;
	}

	@Override
	public String toString() {
		return "Friendship [datetime=" + datetime + ", account1=" + account1 + ", account2=" + account2 + "]";
	}
	
	
}
