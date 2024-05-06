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
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<title>Buyer Profile Page</title>
</head>
<body>

<%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<h2>
		<%=message%>
	</h2>
	<%
	}
%>

<% HttpSession httpSession = request.getSession();
	System.out.println(httpSession);
	String email = (String) httpSession.getAttribute("session");
	UserCURD userCURD= new UserCURD();
	User user= userCURD.getAllUserInfo(email);
	request.setAttribute("editUser",user);
	%>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li align="center" class="nav-item active"><a class="nav-link"
					href="homePage?id=<%=user.getId()%>">HOME<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link"
					href="buyerProfilePage.jsp">PROFILE</a></li>
				<li class="nav-item"><a class="nav-link" href="#">ABOUT</a></li>
				<li class="nav-item"><a class="nav-link" href="#">CONTACT</a></li>
		</div>
	</nav>
	
	<!-- % User user=(User)request.getAttribute("currentUser"); % -->
	

	<div align="center" style="border: 2px solid black;">

		<div>
		<!--  input type="hidden" value="" -->
			<label>User Id:<%=user.getId() %></label><br> 
			<label>USERNAME:<%=user.getFirst_Name() %></label><br>
			<label>EMAIL:<%=user.getEmail() %></label><br> 
			<label>PHONE NUMBER:<%=user.getPhone() %></label><br>
			<label>ADDRESS:<%=user.getAddress() %> </label>
			<a href="buyerEditProfile.jsp"><button>Edit Profile</button></a>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

</body>
</html>