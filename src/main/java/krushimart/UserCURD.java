package krushimart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserCURD {
	public Connection getConnection() throws Exception {
		// 1.Load Driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// 2.Establish Connection
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/krushimart", "root", "root");
		return connection;

	}

	public int signUp(User user) throws Exception {
		Connection connection=getConnection();

		// 3.Create Statements
		PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO USER(FIRST_NAME, LAST_NAME, PHONE_NO, EMAIL_ID, Address, PASSWORD, ROLE)VALUES(?,?,?,?,?,?,?)");
//		preparedStatement.setInt(1, user.getId());
		preparedStatement.setString(1, user.getFirst_Name());
		preparedStatement.setString(2, user.getLast_Name());
		preparedStatement.setLong(3,user.getPhone());
		preparedStatement.setString(4, user.getEmail());
		
		preparedStatement.setString(5, user.getAddress());
		preparedStatement.setString(6, user.getPassword());
		preparedStatement.setString(7, user.getRole());

		// 4.Execute Statement or Process the Result
		int count = preparedStatement.executeUpdate();

		connection.close();
		return count;
	}
	
	public User getUserInfoById(int id) throws Exception {
		User user=new User();
		Connection connection=getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("Select * from USER where id=?");
		preparedStatement.setInt(1, id);
		ResultSet resultset = preparedStatement.executeQuery();
		while (resultset.next()) {
//			user.setPassword(resultset.getString("PASSWORD"));
//			user.setRole(resultset.getString("ROLE"));
			user.setId(resultset.getInt("id"));
			user.setFirst_Name(resultset.getString("FIRST_NAME"));
			user.setFirst_Name(resultset.getString("LAST_NAME"));
			user.setPhone(resultset.getLong("PHONE_NO"));
			user.setEmail(resultset.getString("EMAIL_ID"));
			user.setEmail(resultset.getString("Address"));
			user.setPassword(resultset.getString("PASSWORD"));
			user.setRole(resultset.getString("ROLE"));

			
		}
		connection.close();
		return user;
	}
	
	public User getAllUserInfo(String email) throws Exception {
		User user=new User();
		Connection connection=getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("Select * from USER where email_id=?");
		preparedStatement.setString(1, email);
		ResultSet resultset = preparedStatement.executeQuery();
		while (resultset.next()) {
			user.setId(resultset.getInt("id"));
			user.setFirst_Name(resultset.getString("FIRST_NAME"));
			user.setLast_Name(resultset.getString("LAST_NAME"));
			user.setPhone(resultset.getLong("PHONE_NO"));
			user.setEmail(resultset.getString("EMAIL_ID"));
			user.setAddress(resultset.getString("Address"));
			user.setPassword(resultset.getString("PASSWORD"));
			user.setRole(resultset.getString("ROLE"));
		}
		connection.close();
		return user;
	}
	
	public int updatePassword(String email,String password) throws Exception {
		Connection connection = getConnection();

		PreparedStatement preparedStatement = connection.prepareStatement("UPDATE USER SET PASSWORD=? WHERE EMAIL_ID=?");
		preparedStatement.setString(1, password);
		preparedStatement.setString(2,email);
		
		
		int result = preparedStatement.executeUpdate();
		connection.close();
		return result;
	}
	
	public int updateUserInfo(User user) throws Exception {
		Connection connection = getConnection();

		PreparedStatement preparedStatement = connection.prepareStatement("UPDATE USER SET FIRST_NAME=?,LAST_NAME=?,PHONE_NO=?,EMAIL_ID=?,Address=? WHERE ID=?");
		preparedStatement.setString(1, user.getFirst_Name());
		preparedStatement.setString(2, user.getLast_Name());
		
		preparedStatement.setLong(3, user.getPhone());
		preparedStatement.setString(4, user.getEmail());
		preparedStatement.setString(5, user.getAddress());
		preparedStatement.setInt(6, user.getId());


		int result = preparedStatement.executeUpdate();
		connection.close();
		return result;
	}
}
