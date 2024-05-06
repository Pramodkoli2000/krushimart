<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="signup1.css">
<title>SignUpPage</title>
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
	<div class="container">
		<div class="applogo">
			<img src="Logo.jpeg" alt="#" class="logo2">

			<video class="logoimg" loop autoplay muted>
				<source src="WhatsApp Video 2023-12-04 at 2.14.01 PM.mp4"
					type="video/mp4">
			</video>
		</div>
		<div>
			<div class="cards">

				<div class="farmer cardreg">
					<div class="common-card" align="center" id="farmer1">
						<div class="far12">
							<h3 class="heading">FARMER</h3>
							<div>
								<img src="Farmer.jpeg" alt="famericon" width="110px"
									class="farmer_icon">
							</div>
							<div class="signup">
								<a href="farmerUserReg.jsp">SIGN UP</a>
							</div>
						</div>
					</div>
				</div>

				<div class="buyer cardreg">
					<div class="common-card" align="center">
						<h3 class="heading">CONSUMER</h3>
						<div>
							<img src="Lady.jpeg" alt="famericon" width="110px"
								class="farmer_icon">
						</div>
						<div class="signup">
							<a href="buyerUserReg.jsp">SIGN UP</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>