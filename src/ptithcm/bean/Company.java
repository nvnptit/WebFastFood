package ptithcm.bean;

public class Company {
	private String name;
	private String slogan;
	private String logo;
	
	
	public Company() {
		super();
	}


	public Company(String name, String slogan, String logo) {
		super();
		this.name = name;
		this.slogan = slogan;
		this.logo = logo;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getSlogan() {
		return slogan;
	}


	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}


	public String getLogo() {
		return logo;
	}


	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	
}
