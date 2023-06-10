package Sphone.Model;

public class Order {
	private int id;
	private String OrderId;
	private String FirstName;
	private String LastName;
	private String Email;
	private String Phone;
	private String Address;
	private String Payment;
	private String ProductName;
	private String Brand;
	private Double Price;
	
	
	public Order() {
		super();
	}
	
	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}
	
	public String getProductName() {
		return ProductName;
	}



	public void setProductName(String productName) {
		ProductName = productName;
	}



	public String getBrand() {
		return Brand;
	}



	public void setBrand(String brand) {
		Brand = brand;
	}



	public Double getPrice() {
		return Price;
	}



	public void setPrice(Double price) {
		Price = price;
	}



	public String getOrderId() {
		return OrderId;
	}

	public void setOrderId(String orderId) {
		OrderId = orderId;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getPayment() {
		return Payment;
	}
	public void setPayment(String payment) {
		Payment = payment;
	}
	
	
}
