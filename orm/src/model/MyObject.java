package model;

public class MyObject {
	private int	id;
	private int	price;
	private String objectName;
	private String info;

	
	public String toString() {
		return "MyObject [id=" + id + ", price=" + price
				+ ", objectName=" + objectName + ", info=" + info + "]";
	}


	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
	}


	public String getObjectName() {
		return objectName;
	}


	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}
}
