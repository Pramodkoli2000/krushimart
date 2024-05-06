package krushimart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/krushilogin")
public class LoginController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserCURD curd = new UserCURD();
		ProductCURD productC2=new ProductCURD();

		try {
			User user = curd.getAllUserInfo(email);
			RequestDispatcher dispatcher = null;
			if (user.getPassword() != null) {
//				//Starting HTTP session
				HttpSession httpSession=req.getSession();
				httpSession.setAttribute("session", email);

				if (user.getPassword().equals(password) && user.getRole().equalsIgnoreCase("Farmer")) {
					
//					Cookie cookie=new Cookie("userInfo", email);
//					resp.addCookie(cookie);
					List<Product>list=productC2.getAllProduct();
					
					req.setAttribute("listOfProduct", list);
					
					req.setAttribute("tempUserInfo", user);
					System.out.println(user.getId());
					
					dispatcher = req.getRequestDispatcher("farmerHomePage.jsp");
				} else if (user.getPassword().equals(password) && user.getRole().equalsIgnoreCase("Buyer")) {
//					Cookie cookie=new Cookie("userInfo", email);
//					resp.addCookie(cookie);
					List<Product>list=productC2.getAllProduct();
					req.setAttribute("listOfProduct", list);
					req.setAttribute("tempUserInfo", user);
					System.out.println(user.getId());
					dispatcher = req.getRequestDispatcher("buyerHomePage.jsp");
				}else {
					req.setAttribute("message", "invalid Password!");
					dispatcher = req.getRequestDispatcher("krushi_Login.jsp");
				}
			} else {
				req.setAttribute("message", "User not Register..Please Register!");
				dispatcher = req.getRequestDispatcher("signup.jsp");
			}
			dispatcher.forward(req, resp);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
