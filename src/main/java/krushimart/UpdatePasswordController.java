package krushimart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updatepassword")
public class UpdatePasswordController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmpassword");

		try {
			RequestDispatcher dispatcher = null;
			if (password.equals(confirmPassword)) {
				User user = new User();
				ProductCURD productCURD = new ProductCURD();
				UserCURD curd = new UserCURD();
				user.setPassword(password);
				User UserRole = curd.getAllUserInfo(email);
				
				int result = curd.updatePassword(email, password);
				if (result != 0 &&  UserRole.getRole().equalsIgnoreCase("Buyer")) {
//					List<Product> list = productCURD.getAllProduct();
//					req.setAttribute("listOfProduct", list);
//					req.setAttribute("bmessage", "Password Changed!");
					req.setAttribute("message", "Password Changed!Please Login!");
					dispatcher = req.getRequestDispatcher("krushi_Login.jsp");
				}
				else if(result != 0 &&  UserRole.getRole().equalsIgnoreCase("Farmer")) {
//					List<Product> list = productCURD.getAllProduct();
//					req.setAttribute("listOfProduct", list);
//					req.setAttribute("fmessage", "Password Changed!");
					req.setAttribute("message", "Password Changed!Please Login!");
					dispatcher = req.getRequestDispatcher("krushi_Login.jsp");
				}
				else {
					req.setAttribute("usermessage", "Enter Registered mail id !!");
					dispatcher = req.getRequestDispatcher("changePassword.jsp");
				}
			}
			else {
				req.setAttribute("usermessage", "Password and Confirm Password not same !!");
				dispatcher = req.getRequestDispatcher("changePassword.jsp");
			}
			dispatcher.forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
