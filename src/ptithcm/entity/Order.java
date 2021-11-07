package ptithcm.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Orders")
public class Order {
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "usernameid")
	private User usernameid;
	
	@ManyToOne
	@JoinColumn(name = "id_product")
	private Product id_product;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@Column(name = "date")
	private Date date;
	@Column(name = "amount")
	private int amount;
	@Column(name = "discount")
	private int discount;
	@Column(name = "total")
	private int total;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUsernameid() {
		return usernameid;
	}
	public void setUsernameid(User usernameid) {
		this.usernameid = usernameid;
	}
	public Product getId_product() {
		return id_product;
	}
	public void setId_product(Product id_product) {
		this.id_product = id_product;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
}
