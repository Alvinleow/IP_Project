<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Forget Password</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/forgetPassword1.css'/>">
</head>
<body>
<div class="register-wrapper">
    <header>
      <img src="<c:url value='/Images/back-icon.png'/>" alt="back" height="40px" id="backButton" onclick="history.back()">
      <img src="<c:url value='/Images/MBIP_LOGO.png'/>" alt="MBIP_LOGO"> 
    </header>
    <div class="register-container">
    <div class="register-title">Reset Password</div>
    <div class="steps-indicator">
      <ul>
        <li class="active"></li>
        <li></li>
        <li></li>
      </ul>
    </div>
    
    <c:if test="${not empty error}">
        <div class="alert alert-danger">
        	${error}
		</div>
    </c:if>
    
    <form class="register-form" id="registerForm" action="<c:url value='/processForgetPassword'/>" method="POST">
        <input type="email" id="email" name="email" placeholder="Enter your registered email address" required>
        <input type="text" id="username" name="username" placeholder="Enter your registered username" required>
        <button type="submit">Next</button>
        <div class="footer">
        	Already have an account? <a href="<c:url value='/login'/>">Log In</a>
        </div>
    </form>
    </div>
    <div class="footer-bar"></div>
</div>

</body>
</html>
