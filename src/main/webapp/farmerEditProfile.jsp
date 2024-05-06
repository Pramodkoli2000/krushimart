<%@page import="krushimart.User"%>
<%@page import="krushimart.UserCURD"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FarmerEditProfile</title>
<link rel="stylesheet" type="text/css" href="farmerEditProfile.css">
</head>
<body>
	<%
	HttpSession httpSession = request.getSession();
	String email = (String) httpSession.getAttribute("session");
	UserCURD userCURD = new UserCURD();
	User user = userCURD.getAllUserInfo(email);
	request.setAttribute("editUser", user);
	%>


	<div class="navbar">
		<a class="nav-link" href="homePage?id=<%=user.getId()%>">HOME</a> <a
			class="nav-link" href="createPost.jsp">POST</a> <a class="nav-link"
			href="farmerProfilePage.jsp">PROFILE</a> <a class="nav-link" href="#">ABOUT</a>
		<a class="nav-link" href="#">CONTACT</a>
	</div>
<br><br><br>
	<div class="main-div" align="center">
		<div class="form1">
			<form action="update" method="post">
		<input type="text" name="id" hidden="true" value="<%=user.getId()%>" /><br>
		<br> <label>First Name :</label> <input  class="input" type="text" name="fName"
			value="<%=user.getFirst_Name()%>" /><br>
		<br> <label>Last Name :</label> <input  class="input" type="text" name="lName"
			value="<%=user.getLast_Name()%>" /><br>
		<br> <label>Email Id :</label> <input  class="input" type="text" name="email"
			value="<%=user.getEmail()%>" /><br>
		<br> <label>Phone No :</label> <input  class="input" type="tel" name="phone"
			value="<%=user.getPhone()%>" /><br>
		<br> <label>Address :</label> <input  class="input" type="text" name="address"
			value="<%=user.getAddress()%>" /> <br>
		<br>

		<button class="but">Update</button>
		<a href="farmerProfilePage.jsp"><input class="but" 
			type="button"
			value="Cancel"></a>
	</form>
		</div>
	
</div>
</body>
</html>