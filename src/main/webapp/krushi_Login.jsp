<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
<div class="main-div">
	<div class="sub-div">
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
		<div class="sub-div2">
			<fieldset class="fset">
			<legend align="center" class="text-legend">WELCOME</legend>
			<div class="form">
				<form action="krushilogin" method="post">

				<label>Email: </label>
				<input type="text" name="email" class="form-input"> <br><br> 
				<label>Password: </label>
				<input type="text" name="password" class="form-input"><br><br>

				
				<a href=""><input type="button" value="Cancel" class="lbut"></a>
				<button class="lbut" style="margin-left: 30px;">Login</button>
				<br> <a href="changePassword.jsp"><button type="button"
						class="fbut">Forgot Password ?</button></a>

			</form>
			</div>
			
		</fieldset>
		</div>
		
	</div>
</div>
</body>
</html>