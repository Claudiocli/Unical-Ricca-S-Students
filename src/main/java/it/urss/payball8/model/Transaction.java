package it.urss.payball8.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "transaction")
public class Transaction {
		
		private static final long serialVersionUID = 1L;
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Long id;
		
		private Float amount;
		
		private String datatime;
		
		private String category;
		
		private Long sender;
		
		private Long recipient;
		
		
		public Transaction() {
		}

		public Transaction(Long id, Float amount, String datatime, String category, Long sender, Long recipient) {
			super();
			this.id = id;
			this.amount = amount;
			this.datatime = datatime;
			this.category = category;
			this.sender = sender;
			this.recipient = recipient;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public Float getAmount() {
			return amount;
		}

		public void setAmount(Float amount) {
			this.amount = amount;
		}

		public String getDatatime() {
			return datatime;
		}

		public void setDatatime(String datatime) {
			this.datatime = datatime;
		}

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		public Long getSender() {
			return sender;
		}

		public void setSender(Long sender) {
			this.sender = sender;
		}

		public Long getRecipient() {
			return recipient;
		}

		public void setRecipient(Long recipient) {
			this.recipient = recipient;
		}

		@Override
		public String toString() {
			return "Transaction [id=" + id + ", amount=" + amount + ", datatime=" + datatime + ", category=" + category
					+ ", sender=" + sender + ", recipient=" + recipient + "]";
		}
		
		
		
}
