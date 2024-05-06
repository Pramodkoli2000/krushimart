<%@page import="krushimart.ProductCURD"%>
<%@page import="java.util.Collections"%>
<%@page import="krushimart.Product"%>
<%@page import="java.util.List"%>
<%@page import="krushimart.UserCURD"%>
<%@page import="krushimart.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="farmerProfilePage.css">
<title>FarmerProfilePage</title>
</head>
<body>
	<%
	HttpSession httpSession = request.getSession();
	System.out.println(httpSession);
	String email = (String) httpSession.getAttribute("session");
	UserCURD userCURD = new UserCURD();
	User user = userCURD.getAllUserInfo(email);
	request.setAttribute("editUser", user);
	%>


	<div class="navbar">

		<a class="nav-link" href="homePage?id=<%=user.getId()%>">HOME</a> <a
			class="nav-link" href="createPost.jsp">POST</a>
		</li> <a class="nav-link" href="farmerProfilePage.jsp"
			style="font-weight: bolder">PROFILE</a> <a class="nav-link" href="#">ABOUT</a>
		<a class="nav-link" href="#">CONTACT</a>
	</div>
	<br>
	<br>


	<div class="main-div">


		<!-- % User user=(User)request.getAttribute("currentUser"); % -->
		<%-- <br> <br> <br> --%>

		<div>
		<%
				String message = (String) request.getAttribute("message");
				if (message != null) {
				%>
				<h2 style="margin-top: 10px" align="center">
					<%=message%>
				</h2>
				<%
				}
				%>
			<%
			ProductCURD product1 = new ProductCURD();
			List<Product> alist = product1.getMyProduct(user.getId());
			Collections.reverse(alist);
			%>
			<%
			for (Product product : alist) {
			%>

			<div align="center" class="post-container">

				
				<%-- <div align="center" style="border: 2px solid black; width: 400px;"> --%>
				<div class="abt-post">
					<input value="id" name="<%=user.getId()%>" hidden> <label
						hidden>Product Id: <%=product.getId()%></label><br> <label>PRODUCT
						NAME:<%=product.getProductName()%></label><br> <label>QUANTITY:
						<%=product.getQuantity()%></label><br> <label>PRICE: <%=product.getPrice()%></label><br>
					<label>DESCRIPTION:<%=product.getDescription()%>
					</label> <br>
					<br> <a href="delete?id=<%=product.getId()%>"><button
							class="but">Delete Post</button></a>
				</div>
			</div>
			<br>
			<br>
			<%
			}
			%>
			<br>
		</div>

		<div class="profile-info">
			<br><br>
			<!--  input type="hidden" value="" 
			<label>User Iduser.getId()d() %></label><br> -->
			<label class="lab">User Name : <%=user.getFirst_Name() + " " + user.getLast_Name()%></label><br>
			<label class="lab">Email: <%=user.getEmail()%></label><br> <label class="lab">Phone
				Number : <%=user.getPhone()%></label><br> <label class="lab">Address : <%=user.getAddress()%>
			</label><br> <a href="farmerEditProfile.jsp"><button class="but1">Edit
					Profile</button></a> <a href="changePassword.jsp"><button class="but2">Change
					Password</button></a>
		</div>
	</div>
</body>
</html>