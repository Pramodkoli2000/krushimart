package krushimart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/delete")
public class DeleteProductController extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int id=Integer.parseInt(req.getParameter("id"));
	ProductCURD curd=new ProductCURD();
	
	try {
		int count=curd.deleteProduct(id);
		if(count!=0) {
//			List<Employee> list=curd.getAllEmployee();
//			//req.setAttribute use to pass data one page to another
//			req.setAttribute("listOfEmp", list);
			
			req.setAttribute("message", "Post Deleted !");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("farmerProfilePage.jsp");
			dispatcher.forward(req, resp);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}
}
