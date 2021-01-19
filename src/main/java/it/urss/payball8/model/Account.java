package it.urss.payball8.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "account")
public class Account {

	@Id
	private Long id;

	private String email;

	private String name;

	private String surname;

	private String cf;

	private String address;

	private String dob;

	private Float balance;
	
//	private List<Account> list_friendships;
	
	public Account() {
		balance = 0.0F;
	}
  
	public Account(Long id, String email, String name, String surname, String cf, String address,
			String dob, Float balance) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.surname = surname;
		this.cf = cf;
		this.address = address;
		this.dob = dob;
		this.balance = balance;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getCf() {
		return cf;
	}

	public void setCf(String cf) {
		this.cf = cf;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public Float getBalance() {
		return balance;
	}

	public void setBalance(Float balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", email=" + email + ", name=" + name + ", surname="
				+ surname + ", cf=" + cf + ", address=" + address + ", dob=" + dob + ", balance=" + balance + "]";
	}



}
