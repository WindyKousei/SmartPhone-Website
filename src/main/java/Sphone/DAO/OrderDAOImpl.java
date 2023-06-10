package Sphone.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Sphone.Model.Order;

public class OrderDAOImpl implements IOrderDAO {

	private Connection conn;

	public OrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public int getOrderNumber() {
		int index = 1;
		try {
			String sql = "select * from tblOrder";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				index++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return index;
	}

	@Override
	public boolean saveOrder(List<Order> list) {
		boolean check = false;
		try {
			String sql = "insert into tblOrder (order_id,user_firstName,user_lastName,email,phone,address,productName,brand,price,payment)"
					+ " values(?,?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Order o : list) {
				ps.setString(1, o.getOrderId());
				ps.setString(2, o.getFirstName());
				ps.setString(3, o.getLastName());
				ps.setString(4, o.getEmail());
				ps.setString(5, o.getPhone());
				ps.setString(6, o.getAddress());
				ps.setString(7, o.getProductName());
				ps.setString(8, o.getBrand());
				ps.setDouble(9, o.getPrice());
				ps.setString(10, o.getPayment());
				
				ps.addBatch();
			}

			int[] count = ps.executeBatch();
			conn.commit();
			check = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public List<Order> getProduct(String email) {
		List<Order> list = new ArrayList<Order>();
		Order o = null;
		try {
			String sql ="select * from tblOrder where email =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				o = new Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setFirstName(rs.getString(3));
				o.setLastName(rs.getString(4));
				o.setEmail(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setAddress(rs.getString(7));
				o.setProductName(rs.getString(8));
				o.setBrand(rs.getString(9));
				o.setPrice(rs.getDouble(10));
				o.setPayment(rs.getString(11));
				list.add(o);
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Order> getAllOrder() {
		List<Order> list = new ArrayList<Order>();
		Order o = null;
		try {
			String sql ="select * from tblOrder";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				o = new Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setFirstName(rs.getString(3));
				o.setLastName(rs.getString(4));
				o.setEmail(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setAddress(rs.getString(7));
				o.setProductName(rs.getString(8));
				o.setBrand(rs.getString(9));
				o.setPrice(rs.getDouble(10));
				o.setPayment(rs.getString(11));
				list.add(o);
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

}
