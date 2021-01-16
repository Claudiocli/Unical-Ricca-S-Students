package it.urss.payball8.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "colletta")
public class Colletta implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Long id;
	
	private String datetime;
	
	private Float amount;
	
	private Float quote;
	
	private Float amount_temp;
	
	private Long beneficiary;
	
	public Colletta() {
		amount_temp = 0.0F;
	}

	public Colletta(Long id, String datetime, Float amount, Float quote, Float amount_temp, Long beneficiary) {
		this.id = id;
		this.datetime = datetime;
		this.amount = amount;
		this.quote = quote;
		this.amount_temp = amount_temp;
		this.beneficiary = beneficiary;
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

	public Float getAmount() {
		return amount;
	}

	public void setAmount(Float amount) {
		this.amount = amount;
	}

	public Float getQuote() {
		return quote;
	}

	public void setQuote(Float quote) {
		this.quote = quote;
	}

	public Float getAmount_temp() {
		return amount_temp;
	}

	public void setAmount_temp(Float amount_temp) {
		this.amount_temp = amount_temp;
	}

	public Long getBeneficiary() {
		return beneficiary;
	}

	public void setBeneficiary(Long beneficiary) {
		this.beneficiary = beneficiary;
	}

	@Override
	public String toString() {
		return "Colletta [id=" + id + ", datetime=" + datetime + ", amount=" + amount + ", quote=" + quote
				+ ", amount_temp=" + amount_temp + ", beneficiary=" + beneficiary + "]";
	}
	
	
}
