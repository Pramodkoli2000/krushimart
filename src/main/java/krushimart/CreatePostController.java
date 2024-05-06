package krushimart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/createpost")
public class CreatePostController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("productname");
			double price = Double.parseDouble(req.getParameter("productprice"));
			String productqty = req.getParameter("productquantity");
			String qtyunit = req.getParameter("qtyunit");
			String description = req.getParameter("Productdescription");
			Product product = new Product();
			product.setId(id);
			product.setProductName(name);
			product.setPrice(price);
			product.setQuantity(productqty);
			product.setQtyUnit(qtyunit);
			product.setDescription(description);

			ProductCURD curd = new ProductCURD();
			ProductCURD productC2 = new ProductCURD();
			UserCURD userCURD = new UserCURD();

			try {

				int result = curd.createProduct(product);
				RequestDispatcher dispatcher = null;
				if (result != 0) {

					HttpSession httpSession = req.getSession();
					System.out.println(httpSession);
					String email = (String) httpSession.getAttribute("session");
					User user = userCURD.getAllUserInfo(email);
					req.setAttribute("fmessage", "Post Created");
					List<Product> list = productC2.getAllProduct();
					req.setAttribute("listOfProduct", list);

					req.setAttribute("tempUserInfo", user);
					dispatcher = req.getRequestDispatcher("farmerHomePage.jsp");

				} 
//				else {
//					req.setAttribute("fmessage", "Enter the data to create Post");
//					dispatcher = req.getRequestDispatcher("createPost.jsp");
//				}
				dispatcher.forward(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (NumberFormatException e) {
			// TODO: handle exception
			RequestDispatcher dispatcher = null;
			req.setAttribute("postMessage", "Enter the data to create Post");
			dispatcher = req.getRequestDispatcher("createPost.jsp");
			dispatcher.forward(req, resp);

		}

	}

}
