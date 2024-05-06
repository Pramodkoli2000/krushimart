<%@page import="java.util.Collections"%>
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
<link rel="stylesheet" type="text/css" href="../css/HomePageFarmer.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>BuyerHomePage</title>
</head>
<body>
	<h1 align="center">Buyer HOME PAGE</h1>
	<%
	String message = (String) request.getAttribute("bmessage");
	if (message != null) {
	%>
	<h2>
		<%=message%>
	</h2>
	<%
	}
	%>
	
	<% User user = (User)request.getAttribute("tempUserInfo"); %>
	
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li align="center" class="nav-item active"><a class="nav-link"
					href="homePage?id=<%=user.getId()%>">HOME<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="buyerProfilePage.jsp">PROFILE</a></li>
				<li class="nav-item"><a class="nav-link" href="#">ABOUT</a></li>
				<li class="nav-item"><a class="nav-link" href="#">CONTACT</a></li>
		</div>
	</nav>

	<div>
	<%
	List<Product> alist = (List) request.getAttribute("listOfProduct");
	Collections.reverse(alist);
	%>
	<%
		for (Product product : alist) {
		%>
		
			<div align="center" style="border: 2px solid black;width: 400px;">
				<div class="abt-post">
					<input value="id" name="<%=user.getId()%>" hidden>
					<label hidden>Product Id: <%=product.getId() %></label><br>
					<label>PRODUCT NAME:<%=product.getProductName() %></label><br>
					<label>QUANTITY: <%=product.getQuantity()%></label><br>
					<label>PRICE: <%=product.getPrice() %></label><br> 
					<label>DESCRIPTION:<%=product.getDescription() %> </label>
				</div>
			</div>
		<%
		}
		%>

		<br>


	</div>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    -->
</body>
</html>