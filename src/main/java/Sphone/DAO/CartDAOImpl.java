package Sphone.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Sphone.Model.Cart;
import Sphone.Model.Product;

public class CartDAOImpl implements ICartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean check = true;
		try {
			String sql = "insert into tblCart(product_id, email, productName," + " brand, price, total_price) "
					+ "values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getProductId());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getProductName());
			ps.setString(4, c.getBrand());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotalPrice());
			int i = ps.executeUpdate();
			if (i == 1)
				check = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public List<Cart> getProductbyUser(String email) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice = 0;
		try {
			String sql = "select * from tblCart where email =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Cart();
				c.setCartId(rs.getInt(1));
				c.setProductId(rs.getInt(2));
				c.setEmail(rs.getString(3));
				c.setProductName(rs.getString(4));
				c.setBrand(rs.getString(5));
				c.setPrice(rs.getDouble(6));

				totalPrice += rs.getDouble(7);
				c.setTotalPrice(totalPrice);

				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteProduct(int id, String email, int cartID) {
		boolean check = false;
		try {

			String sql = "delete from tblCart where product_id=? and email=? and cart_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, email);
			ps.setInt(3, cartID);
			int i = ps.executeUpdate();
			if (i == 1) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return check;
	}
	
	

}
