package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Products")
public class Product {
	@Id
	@GeneratedValue
	private int id;
	
	private String name;
	private String type;
	private int price;
	private int quantity;
	private String description;
	private int discount;
	private String img;
	private boolean status;
	

	@OneToMany(mappedBy = "id", fetch = FetchType.EAGER)
	private Collection<Order> orders;
	
	public Product() {
		super();
	}
	public Product(int id, String name, String type, int price, int quantity, String description, int discount,
			String img, boolean status) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.price = price;
		this.quantity = quantity;
		this.description = description;
		this.discount = discount;
		this.img = img;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
}
