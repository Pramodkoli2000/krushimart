<%@page import="krushimart.UserCURD"%>
<%@page import="krushimart.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CreatePost</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="createPost.css">
</head>
<body>
	<div class="main-div">

		<%
		HttpSession httpSession = request.getSession();
		System.out.println(httpSession);
		String email = (String) httpSession.getAttribute("session");
		request.setAttribute("tempUserInfo", email);
		UserCURD userCURD = new UserCURD();
		User user = userCURD.getAllUserInfo(email);
		%>

		<div class="navbar">
			<a class="nav-link" href="homePage?id=<%=user.getId()%>">HOME</a>
			<a class="nav-link" href="createPost.jsp" style="font-weight: bolder">POST</a>
			<a class="nav-link" href="farmerProfilePage.jsp">PROFILE</a> 
			<a class="nav-link" href="#">ABOUT</a> 
			<a class="nav-link" href="#">CONTACT</a>
		</div>
		<br>

		<div>
			
			<h1 align="center" class="name"><%=" Hey! " + user.getFirst_Name()%></h1>
			<%
			String message = (String) request.getAttribute("postMessage");
			if (message != null) {
			%>
			<h2 style="margin-top: 10px" align="center">
				<%=message%>
			</h2>
			<%
			}
			%>
			<div>
				<fieldset class="field">
					<div class="splitright">
						<form action="createpost" method="post">

							<div align="center">
								<br> <input name="id" value="<%=user.getId()%>" hidden>
								<br> <label>Product Name: </label> <input type="text"
									id="productName" name="productname" pattern="[A-Za-z\s]+"
									placeholder="Product Name" size="35.4px"><br> <label>Product
									Quantity: </label> <input type="text" id="productQuantity"
									name="productquantity" placeholder="Product Quantity"
									size="35.4px"> <br> <label>Product Price:
								</label> <input type="text" id="productPrice" name="productprice"
									pattern="[0-9]+" placeholder="Product Price"size="35.4px"><br>
								<label>Product Description: </label> <input type="text"
									id="productDescription" name="Productdescription"
									placeholder="Product Description" size="35.4px"><br>
								<br>
							</div>
							<button type="reset" class="lbut">Cancel</button>
							<button class="lbut">Post</button>
							
					</div>
					</form>
			</div>
			</fieldset>
		</div>
	</div>
</body>
</html>