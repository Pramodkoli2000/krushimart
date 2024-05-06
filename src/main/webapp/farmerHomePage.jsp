	<%@page import="java.util.Collections"%>
	<%@page import="com.mysql.cj.x.protobuf.MysqlxCrud.Collection"%>
	<%@page import="krushimart.User"%>
	<%@page import="krushimart.Product"%>
	<%@page import="java.util.List"%>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
	<!doctype html>
	<html lang="en">
	<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="farmerHomePage.css">

	<title>FarmerHomePage</title>
	</head>
	<body>
		<%-- <h1 align="center">Farmer HOME PAGE</h1> --%>
	
	<% User user = (User)request.getAttribute("tempUserInfo"); %>
		
			<div class="navbar">
				<a class="nav-link" href="homePage?id=<%=user.getId()%>" style="font-weight: bolder">HOME</a>
				<a class="nav-link" href="createPost.jsp">POST</a>
				<a class="nav-link" href="farmerProfilePage.jsp">PROFILE</a>
				<a class="nav-link" href="#">ABOUT</a>
				<a class="nav-link" href="#">CONTACT</a>
			</div>
			<br><br>
			<div class="main-div">
		
		<%
		String message = (String) request.getAttribute("fmessage");
		if (message != null) {
		%>
		<h2 align="center">
			<%=message%>
		</h2>
		<br>
		<%
		}
		%>

		<div>
		<%
		List<Product> alist = (List) request.getAttribute("listOfProduct");
		Collections.reverse(alist);
		%>
		<%
			for (Product product : alist) {
			%>
			
				<div align="center" class="post-container">
					<div class="abt-post">
						<input value="id" name="<%=user.getId()%>" hidden>
						<label hidden>Product Id: <%=product.getId() %></label><br>
						<label>PRODUCT NAME:<%=product.getProductName() %></label><br>
						<label>QUANTITY: <%=product.getQuantity()%></label><br>
						<label>PRICE: <%=product.getPrice() %></label><br> 
						<label>DESCRIPTION:<%=product.getDescription() %> </label>
					</div>
				</div>
				<br><br>
			<%
			}
			%>

			<br>


		</div>
	</div>

		<!--Optional JavaScript; choose one of the two!

		Option 1: jQuery and Bootstrap Bundle (includes Popper) -->

	</body>
	</html>