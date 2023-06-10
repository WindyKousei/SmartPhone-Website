package Sphone.Model;

public class Cart {
	private int CartId;
	private int ProductId;
	private String Email;
	private String ProductName;
	private String Brand;
	private Double Price;
	private Double totalPrice;
	private String PaymentType;

	
	public int getCartId() {
		return CartId;
	}
	public void setCartId(int cartId) {
		CartId = cartId;
	}
	public int getProductId() {
		return ProductId;
	}
	public void setProductId(int productId) {
		ProductId = productId;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
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
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getPaymentType() {
		return PaymentType;
	}
	public void setPaymentType(String paymentType) {
		PaymentType = paymentType;
	}
}
