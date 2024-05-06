
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="ShivaniGirme">
	<meta name="description" content="Sign-Up_page_of_Krushi_Mart">
    <title>SignUpPage</title>
    <link rel="stylesheet" href="signup.css">
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
    <div class="main-div">
        <div class="sub-div">
            <div class="Sign-up">
                <h1>Sign-Up Page</h1>
            </div>
            <div class="new-reg">
                <h1>New Registration</h1>
            </div>
        </div>
        <div class="card-main">
            <div class="card" id="c1">
                <a href="farmerUserReg.jsp" class="an">
              <img src="Farmer.png" alt="Farmer" style="width:100%">
                <div class="container">
                  <h4 class="name"><b>FARMER</b></h4>
                </div>
            </a>
            </div>
            <div class="card" id="c2">
                <a href="buyerUserReg.jsp"  class="an">
                <img src="Buyer.png" alt="Buyer" style="width:100%">
                <div class="container">
                  <h4 class="name"><b>BUYER</b></h4>
                </div>
            </a>
            </div>
        </div>
        <div>
            <h4 class="existing">Existing User?</h4>
        </div>
        <div>
           <a href="krushi_Login.jsp"><button type="button" class="but">Login</button></a> 
        </div>
        
    </div>
    
    
</body>
</html>