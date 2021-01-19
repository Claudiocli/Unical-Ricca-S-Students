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
	private Long account1;
	
	@Id
	private Long account2;
	
	public Friendship() {
		Clock clock = Clock.systemDefaultZone();
		datetime = LocalDateTime.now(clock).toString();
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
