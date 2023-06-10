package Sphone.Model;

public class Product {
	
	private int ProductId;
	private String ProductName;
	private String Brand;
	private String ProductYear;
	private String Price;
	private String Quantity; 	
	private String Photo;
	private String ProductCategory;
	private String Description;
	private String Status;
	private String Email;
	
	public Product(String productName, String brand, String productYear, String price, String quantity,
			String photo, String productCategory, String description, String Status, String Email) {
		super();
		this.ProductName = productName;
		this.Brand = brand;
		this.ProductYear = productYear;
		this.Price = price;
		this.Quantity = quantity;
		this.Photo = photo;
		this.ProductCategory = productCategory;
		this.Description = description;
		this.Status = Status;
		this.Email = Email;
	}
	
	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getProductId() {
		return ProductId;
	}
	public void setProductId(int ProductId) {
		this.ProductId = ProductId;
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
	public void setBrand(String name) {
		Brand = name;
	}
	public String getProductYear() {
		return ProductYear;
	}
	public void setProductYear(String productYear) {
		ProductYear = productYear;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public String getQuantity() {
		return Quantity;
	}
	public void setQuantity(String quantity) {
		Quantity = quantity;
	}
	public String getPhoto() {
		return Photo;
	}
	public void setPhoto(String photo) {
		Photo = photo;
	}
	public String getProductCategory() {
		return ProductCategory;
	}
	public void setProductCategory(String productCategory) {
		ProductCategory = productCategory;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	
}
