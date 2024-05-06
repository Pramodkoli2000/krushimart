package krushimart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductCURD {
	public Connection getConnection() throws Exception {
		// 1.Load Driver
		Class.forName("com.mysql.cj.jdbc.Driver");

		// 2.Establish Connection
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/krushimart", "root", "root");
		return connection;

	}
	
	public int createProduct(Product product) throws Exception {
		Connection connection=getConnection();

		// 3.Create Statements
		PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO PRODUCT(PRODUCT_NAME, PRICE, QUANTITY, Description, FarmerId) VALUES(?,?,?,?,?)");

		preparedStatement.setString(1, product.getProductName());
		preparedStatement.setDouble(2, product.getPrice());
		preparedStatement.setString(3, product.getQuantity());
		preparedStatement.setString(4, product.getDescription());
		preparedStatement.setInt(5, product.getId());
		
		int count = preparedStatement.executeUpdate();

		connection.close();
		return count;
	}
	
	public List<Product> getAllProduct() throws Exception
	{
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection
				.prepareStatement("SELECT * FROM PRODUCT");
		ResultSet resultset = preparedStatement.executeQuery();
		List<Product>list =new ArrayList<Product>();
		while (resultset.next()) {
			Product product= new Product();
			product.setId(resultset.getInt("ID"));
			product.setProductName(resultset.getString("PRODUCT_NAME"));
			product.setPrice(resultset.getDouble("PRICE"));
			product.setQuantity(resultset.getString("QUANTITY"));
			product.setDescription(resultset.getString("Description"));
			
			list.add(product);
		}
		connection.close();
		return list;
	}
	
	public List<Product> getMyProduct(int userId) throws Exception
	{
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection
				.prepareStatement("SELECT * FROM PRODUCT WHERE FarmerId=?");
		preparedStatement.setInt(1, userId);
		ResultSet resultset = preparedStatement.executeQuery();
		List<Product>list =new ArrayList<Product>();
		while (resultset.next()) {
			Product product= new Product();
			product.setId(resultset.getInt("ID"));
			product.setProductName(resultset.getString("PRODUCT_NAME"));
			product.setPrice(resultset.getDouble("PRICE"));
			product.setQuantity(resultset.getString("QUANTITY"));
			product.setDescription(resultset.getString("Description"));
			
			list.add(product);
		}
		connection.close();
		return list;
	}
	
	public int deleteProduct(int id) throws Exception {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection
				.prepareStatement("DELETE FROM PRODUCT WHERE ID=?");
		preparedStatement.setInt(1, id);
		int result = preparedStatement.executeUpdate();
		connection.close();
		return result;
	}

}
