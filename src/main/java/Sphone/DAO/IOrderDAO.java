package Sphone.DAO;

import java.util.List;

import Sphone.Model.Order;

public interface IOrderDAO  {
	
	public int getOrderNumber();
	public boolean saveOrder(List<Order> list);
	public List<Order> getProduct(String email);
	public List<Order> getAllOrder();

}
