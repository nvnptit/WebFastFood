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
@Table(name="Cart")
public class Cart {

	
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
}
