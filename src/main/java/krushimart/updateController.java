package krushimart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/update")
public class updateController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		String firstName=req.getParameter("fName");
		String lastName=req.getParameter("lName");
		String email=req.getParameter("email");
		long phone=Long.parseLong(req.getParameter("phone"));
		String address=req.getParameter("address");
		
		User user=new User();
		user.setId(id);
		user.setFirst_Name(firstName);
		user.setLast_Name(lastName);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);
		
		
		
		UserCURD curd= new UserCURD();
		
		try {
			User validUser=curd.getUserInfoById(id);
			int result=curd.updateUserInfo(user);
			
			if(result!=0 && validUser.getRole().equalsIgnoreCase("farmer"))
			{
				req.setAttribute("message", "Updated");
				RequestDispatcher dispatcher = req.getRequestDispatcher("farmerProfilePage.jsp");
				dispatcher.forward(req, resp);
			}
			else if(result!=0 && validUser.getRole().equalsIgnoreCase("buyer"))
			{
				req.setAttribute("message", "Updated");
				RequestDispatcher dispatcher = req.getRequestDispatcher("buyerProfilePage.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	

}
