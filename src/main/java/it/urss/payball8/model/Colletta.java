package it.urss.payball8.model;

import javax.persistence.Id;

/*
@Entity
@Table(name = "card")
 */
public class Colletta {
	
	@Id
	private Long id;
	
	private String datatime;
	
	private String amount;
	
	private String quote;
	
	private String amount_temp;
	
	private String beneficiary;
	
	public Colletta() {
	}

	public Colletta(Long id, String datatime, String amount, String quote, String amount_temp, String beneficiary) {
		this.id = id;
		this.datatime = datatime;
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

	public String getDatatime() {
		return datatime;
	}

	public void setDatatime(String datatime) {
		this.datatime = datatime;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getQuote() {
		return quote;
	}

	public void setQuote(String quote) {
		this.quote = quote;
	}

	public String getAmount_temp() {
		return amount_temp;
	}

	public void setAmount_temp(String amount_temp) {
		this.amount_temp = amount_temp;
	}

	public String getBeneficiary() {
		return beneficiary;
	}

	public void setBeneficiary(String beneficiary) {
		this.beneficiary = beneficiary;
	}

	@Override
	public String toString() {
		return "Colletta [id=" + id + ", datatime=" + datatime + ", amount=" + amount + ", quote=" + quote
				+ ", amount_temp=" + amount_temp + ", beneficiary=" + beneficiary + "]";
	}
	
	
}
