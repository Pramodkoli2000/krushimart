
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Farmer Reg</title>
</head>

<body>
	<div align="center">
	<%
	String message = (String) request.getAttribute("messageforuser");
	if (message != null) {
	%>
	<h2>
		<%=message%>
	</h2>
	<%
	}
	%>
		<fieldset style="width: 400px; height: 540px;">
		<legend align="center">Farmer Registration</legend>
			<div>
				<h2>
					<u>Sign-up</u>
				</h2>
			</div>
			<br>

			<form action="register" method="post">
				
				<!-- input type="number" name="id" -->
				
				<label>First Name :</label> 
				<input type="text" name="fName" placeholder="Enter First Name"><br><br> 
				
				<label>Last Name :</label> 
				<input type="text" name="lName" placeholder="Enter Second Name" required><br><br>
				
				<label>Email Id :</label> 
				<input type="text" name="email" placeholder="Enter Your Email" required ><br><br>  
				
				<label>Phone Number :</label>
				<input type="tel" name="phone"  placeholder="Enter Phone Number" required><br><br>
				
				 <label>Address :</label>
                <input type="text" name="address" placeholder=" Enter Address"/> <br><br>
				
				<label>New Password:</label>
				<input type="text"name="password" placeholder="New Password"><br><br>
				
				<label>Confirm Password :</label>
                <input type="text" name="confirmpassword" placeholder="Confirm Password"/><br><br>
                
				<input type="text" name="role" value="Farmer" hidden> <br> <br>
				<button>Create</button>
				&nbsp;
				<button type="reset">Cancel</button>
				<br> <br> <br> Already have an account?<a href="krushi_Login.jsp">Login</a>
				<br> <br>
		
		</form>
		</fieldset>
	</div>
</body>

</html>