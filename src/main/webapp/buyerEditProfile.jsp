<%@page import="krushimart.User"%>
<%@page import="krushimart.UserCURD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<% HttpSession httpSession = request.getSession();
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
	
				<li class="nav-item"><a class="nav-link" href="buyerProfilePage.jsp">PROFILE</a></li>
				<li class="nav-item"><a class="nav-link" href="#">ABOUT</a></li>
				<li class="nav-item"><a class="nav-link" href="#">CONTACT</a></li>
		</div>
	</nav>

<form action="update" method="post">

			  
				<input type="text" name="id" hidden="true" value="<%=user.getId()%>"/><br><br>
					
				<label>First Name :</label> 
				<input type="text" name="fName" value="<%=user.getFirst_Name()%>"/><br><br> 
				
				<label>Last Name :</label> 
				<input type="text" name="lName" value="<%=user.getLast_Name()%>"/><br><br>
				
				<label>Email Id :</label> 
				<input type="text" name="email" value="<%=user.getEmail()%>"/><br><br>  
				
				<label>Phone Number :</label>
				<input type="tel" name="phone" value="<%=user.getPhone()%>"/><br><br>
				
				 <label>Address :</label>
                <input type="text" name="address" value="<%=user.getAddress()%>"/> <br><br>
                
                <button>Update</button>
				<a href="buyerProfilePage.jsp"><input type="button" value="Cancel"></a>

</form>
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