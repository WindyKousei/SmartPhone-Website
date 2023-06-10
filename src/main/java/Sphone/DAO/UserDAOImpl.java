package Sphone.DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Sphone.Model.User;
public class UserDAOImpl implements IUserDAO{
	private Connection conn;
	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	@Override
	public User login(String email, String password) {
		User us=null;
		try {
			String sql="select * from  tblUser where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2,password);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				us=new User();
				us.setEmail(rs.getString(1));
				us.setPassword(rs.getString(2));
				us.setFirstName(rs.getString(3));
				us.setLastName(rs.getString(4));
				us.setPhone(rs.getString(5));
				us.setAddress(rs.getString(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}
	
	@Override
	public boolean register(User us) {

		boolean check = false;
		try {
			String sql = "insert into tblUser (email, password, first_name, last_name, phone, address) "
					+ "values( ?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());
			ps.setString(3, us.getFirstName());
			ps.setString(4, us.getLastName());
			ps.setString(5, us.getPhone());
			ps.setString(6, us.getAddress());

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
	public boolean checkPassword(String Email, String ps) {
		boolean check = false;
		try {
			String sql = "select * from tblUser where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, Email);
			pst.setString(2, ps);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				check = true;
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return check;
		
	}
	@Override
	public boolean updateProfile(User us)
	{
		boolean check = false;
		try {
			String sql = "update tblUser set first_name=?, last_name=?, phone=?, address=? where email=? ";
					
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getFirstName());
			ps.setString(2, us.getLastName());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getAddress());
			ps.setString(5, us.getEmail());

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
