package Sphone.DAO;

import Sphone.Model.User;

public interface IUserDAO {

	User login(String email, String password);

	boolean register(User us);

	boolean checkPassword(String Email, String ps);

	boolean updateProfile(User us);

}
