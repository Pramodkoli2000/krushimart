package krushimart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/homePage")
public class HomePageController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		ProductCURD productC2=new ProductCURD();
		UserCURD curd= new UserCURD();
		try {
			
			User user= curd.getUserInfoById(id);
			if(user!=null ) {
				String name=user.getFirst_Name();
				if(user.getRole().equalsIgnoreCase("farmer")) {
					System.out.println("Home Page Controller: "+name);
					List<Product>list=productC2.getAllProduct();
					req.setAttribute("listOfProduct", list);
					req.setAttribute("tempUserInfo", user);
					RequestDispatcher dispatcher = req.getRequestDispatcher("farmerHomePage.jsp");
					dispatcher.forward(req, resp);
				}
				else if(user.getRole().equalsIgnoreCase("buyer")) {
					System.out.println("Home Page Controller: "+name);
					List<Product>list=productC2.getAllProduct();
					req.setAttribute("listOfProduct", list);
					req.setAttribute("tempUserInfo", user);
					RequestDispatcher dispatcher = req.getRequestDispatcher("buyerHomePage.jsp");
					dispatcher.forward(req, resp);
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
