package Sphone.DAO;

import java.util.List;

import Sphone.Model.Product;

public interface IProductDAO {

	boolean addProduct(Product p);

	List<Product> getAllProducts();

	boolean updateEditProducts(Product p);

	Product getProductById(int id);

	boolean deleteProducts(int id);

	List<Product> getSamSungPhone();

	List<Product> getIPhone();

	List<Product> getXiaomiPhone();

	List<Product> getAccessory();

	List<Product> getAllSamSung();

	List<Product> getAllApple();

	List<Product> getAllXiaomi();

	List<Product> getAllAccessory();

	List<Product> getProductByOld(String Email);

	boolean oldProductDelete(String Email, int ProductId);
	
	public List<Product> getProductBySearch(String ch);

}
