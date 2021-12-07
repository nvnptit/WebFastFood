package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Slides")
public class Slide {
	@Id
	@GeneratedValue
	private int id;
	
	private String img;
	private String caption;
	private String content;
	private boolean active;
	
	public Slide() {
		super();
	}
	
	public Slide(int id, String img, String caption, String content, boolean active) {
		super();
		this.id = id;
		this.img = img;
		this.caption = caption;
		this.content = content;
		this.active = active;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
}
