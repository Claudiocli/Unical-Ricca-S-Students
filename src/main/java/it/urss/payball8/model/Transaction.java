package it.urss.payball8.model;

import java.time.Clock;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "transaction")
public class Transaction implements java.io.Serializable{
		
		private static final long serialVersionUID = 1L;
		
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Long id;
		
		private Float amount;
		
		private String datetime;
		
		private String category;
		
		private Long sender;
		
		private Long recipient;
		
		
		public Transaction() {
			Clock clock = Clock.systemDefaultZone();
			datetime = LocalDateTime.now(clock).toString();
		}

		public Transaction(Long id, Float amount, String datetime, String category, Long sender, Long recipient) {
			this.id = id;
			this.amount = amount;
			this.datetime = datetime;
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

		public String getDatetime() {
			return datetime;
		}

		public void setDatetime(String datetime) {
			this.datetime = datetime;
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
			return "Transaction [id=" + id + ", amount=" + amount + ", datetime=" + datetime + ", category=" + category
					+ ", sender=" + sender + ", recipient=" + recipient + "]";
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}
		
		
}
