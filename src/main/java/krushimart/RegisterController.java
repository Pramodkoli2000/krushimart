package krushimart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		int id=Integer.parseInt(req.getParameter("id"));
		String fname = req.getParameter("fName");
		String lname = req.getParameter("lName");
		long phone = Long.parseLong(req.getParameter("phone"));
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmpassword");
		String role = req.getParameter("role");

		User user = new User();
//		user.setId(id);
		user.setFirst_Name(fname);
		user.setLast_Name(lname);
		user.setPhone(phone);
		user.setEmail(email);
		user.setAddress(address);
		user.setPassword(password);
		user.setConfirmPassword(confirmPassword);
		user.setRole(role);

		UserCURD curd = new UserCURD();
		try {
			RequestDispatcher dispatcher = null;
			if (password.equals(confirmPassword)) {

				int count = curd.signUp(user);
				if (count != 0) {
					req.setAttribute("message", "Registration is Done..Please Login!");
					dispatcher = req.getRequestDispatcher("krushi_Login.jsp");
					dispatcher.forward(req, resp);
				} 
//				else if (role.equalsIgnoreCase("farmer")) {
//					dispatcher = req.getRequestDispatcher("farmerUserReg.jsp");
//					dispatcher.forward(req, resp);
//				} else if (role.equalsIgnoreCase("buyer")) {
//					dispatcher = req.getRequestDispatcher("buyerUserReg.jsp");
//					dispatcher.forward(req, resp);
//				}
			} else {
				req.setAttribute("message", "Password and Confirm Password not same !");
				dispatcher = req.getRequestDispatcher("signup.jsp");
				dispatcher.forward(req, resp);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
