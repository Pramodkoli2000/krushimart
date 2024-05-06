<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<link rel="stylesheet" type="text/css" href="changePassword.css">
</head>
<body>

	<div align="center" class="main-div">

		<form action="updatepassword" class="form1">
			<%
			String message = (String) request.getAttribute("usermessage");
			if (message != null) {
			%>
			<h2>
				<%=message%>
			</h2>
			<%
			}
			%>
		
			<br>
			<h1>Change Password</h1>
			<br> <label>Email Id:</label> <input class="input" type="text"
				name="email" placeholder="Enter Your Email id"> <br>
			<br> <label> New Password:</label> <input class="input"
				type="text" name="password" placeholder="Enter Your New Password"><br>
			<br> <label> Confirm Password:</label> <input class="input"
				type="text" name="confirmpassword"
				placeholder="Confirm the Password"> <br> <br>
			<button class="but" align="center">UPDATE</button>
			
			<a href="krushi_Login.jsp"><input class="but" type="button"
				value="Cancel"></a>
		
		</form>
	</div>
</body>
</html>