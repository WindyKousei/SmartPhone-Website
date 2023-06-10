package Sphone.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Sphone.DB.DBConnect;
import Sphone.Model.Product;

public class ProductDAOImpl implements IProductDAO {

	private Connection conn;

	public ProductDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addProduct(Product p) {
		boolean f = false;
		try {
			String sql = "insert into tblProduct (productName,brand,productYear,"
					+ "price,quantity,thumbnail,productCategory,description, status, email) " + "values(?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductName());
			ps.setString(2, p.getBrand());
			ps.setString(3, p.getProductYear());
			ps.setString(4, p.getPrice());
			ps.setString(5, p.getQuantity());
			ps.setString(6, p.getPhoto());
			ps.setString(7, p.getProductCategory());
			ps.setString(8, p.getDescription());
			ps.setString(9, p.getStatus());
			ps.setString(10, p.getEmail());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Product> getAllProducts() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		try {
			String sql = "select * from tblProduct";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				p.setDescription(rs.getString(9));
				p.setEmail(rs.getString(10));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean updateEditProducts(Product p) {
		boolean f = false;
		try {
			String sql = "update tblProduct set productName=?, brand=?, productYear=?,price=?, quantity=?, productCategory=? where product_id= ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductName());
			ps.setString(2, p.getBrand());
			ps.setString(3, p.getProductYear());
			ps.setString(4, p.getPrice());
			ps.setString(5, p.getQuantity());
			ps.setString(6, p.getProductCategory());
			ps.setInt(7, p.getProductId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public Product getProductById(int id) {
		Product p = null;
		try {
			String sql = "select *from tblProduct where Product_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				p.setDescription(rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public boolean deleteProducts(int id) {
		boolean check = false;
		try {
			String sql = "delete from tblProduct where product_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public List<Product> getSamSungPhone() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		try {
			String sql = "select * from tblProduct where brand=? and productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "SamSung");
			ps.setString(2, "Phone");
			ResultSet rs = ps.executeQuery();
			int index = 1;
			while (rs.next() && index <= 4) {
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				p.setDescription(rs.getString(9));
				list.add(p);
				index = index + 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> getIPhone() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		try {
			String sql = "select * from tblProduct where brand=? and productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Apple");
			ps.setString(2, "Phone");
			ResultSet rs = ps.executeQuery();
			int index = 1;
			while (rs.next() && index <= 4) {
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				p.setDescription(rs.getString(9));
				list.add(p);
				index = index + 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> getXiaomiPhone() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		try {
			String sql = "select * from tblProduct where brand=? and productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "XiaoMi");
			ps.setString(2, "Phone");
			ResultSet rs = ps.executeQuery();
			int index = 1;
			while (rs.next() && index <= 4) {
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				p.setDescription(rs.getString(9));
				list.add(p);
				index = index + 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> getAccessory() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		try {
			String sql = "select * from tblProduct where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Accessory");
			ResultSet rs = ps.executeQuery();
			int index = 1;
			while (rs.next() && index <= 4) {
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				p.setDescription(rs.getString(9));
				list.add(p);
				index = index + 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Product> getAllSamSung() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		try {
			String sql = "select * from tblProduct where brand=? and productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "SamSung");
			ps.setString(2, "Phone");
			ResultSet rs = ps.executeQuery();
			while (rs.next() ) {
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				p.setDescription(rs.getString(9));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Product> getAllApple() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		try {
			String sql = "select * from tblProduct where brand=? and productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Apple");
			ps.setString(2, "Phone");
			ResultSet rs = ps.executeQuery();
			while (rs.next() ) {
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				p.setDescription(rs.getString(9));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Product> getAllXiaomi() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		try {
			String sql = "select * from tblProduct where brand=? and productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "XiaoMi");
			ps.setString(2, "Phone");
			ResultSet rs = ps.executeQuery();
			while (rs.next() ) {
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				p.setDescription(rs.getString(9));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Product> getAllAccessory() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		try {
			String sql = "select * from tblProduct where productCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Accessory");
			ResultSet rs = ps.executeQuery();
			while (rs.next() ) {
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				p.setDescription(rs.getString(9));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Product> getProductByOld(String Email)
	{
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		try {
			String sql ="select * from tblProduct where status =? and email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, Email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				list.add(p);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
	}
	@Override
	public boolean oldProductDelete(String Email, int ProductId) {
		boolean check = false;
		try {
			String sql = "delete from tblProduct where product_id=? and email=? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, ProductId);
			ps.setString(2, Email);
			ps.setString(3,"Old");
			int i = ps.executeUpdate();
			if (i == 1) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
		
	}

	@Override
	public List<Product> getProductBySearch(String ch) {
		List<Product> list = new ArrayList<Product>();
		Product p = null;
		try {
			String sql ="select * from tblProduct where productName like ? or "
					+ "brand like ? or productCategory like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				p = new Product();
				p.setProductId(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setBrand(rs.getString(3));
				p.setProductYear(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setQuantity(rs.getString(6));
				p.setPhoto(rs.getString(7));
				p.setProductCategory(rs.getString(8));
				list.add(p);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
}
