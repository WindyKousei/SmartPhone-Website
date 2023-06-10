package Sphone.DAO;

import java.util.List;

import Sphone.Model.Cart;
import Sphone.Model.Product;
public interface ICartDAO {
	public boolean addCart(Cart c);
	
	public List <Cart> getProductbyUser(String email);


	public boolean deleteProduct(int id, String email, int cartID);
}
