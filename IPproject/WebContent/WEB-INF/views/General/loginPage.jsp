<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/loginPage.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/background.css'/>">
</head>
<body>
<div class="login-wrapper">
    <header>
        <img src="${pageContext.request.contextPath}/Images/MBIP_LOGO.png" alt="MBIP_LOGO">
    </header>
     <div class="login-content">
        <div class="welcome-text">
        	<p>Welcome to the Low Carbon Initiative System (LCIS) for Majlis Bandaraya Iskandar Puteri (MBIP).</p>
        	<p>Our innovative platform revolutionizes the traditional data collection and carbon consumption calculation process. 
        	With LCIS, experience a seamless transition from complex, manual procedures to a streamlined, computerized system. 
        	Our user-friendly interface and simplified forms make carbon tracking accessible to users of all ages, 
        	ensuring an efficient and organized approach to environmental stewardship.</p>
        	<p>Join us in our journey towards a low carbon future!</p>
        </div>
        <div class="login-container">
	        <div class="login-title">Log In Account</div>
	        <c:if test="${not empty error}">
		        <div class="alert alert-danger">
		        	${error}
				</div>
		    </c:if>
	        <form class="login-form" id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
	            <input type="text" id="username" name="username" placeholder="Username" required>
	            <input type="password" id="password" name="password" placeholder="Password" required>
	            <button type="submit">Log In</button>
	            <div class="footer">
	                <a href="<c:url value='/forgetPassword'/>">Forgot password?</a> | <a href="<c:url value='/register'/>">Register</a>
	            </div>
	        </form>
	    </div>
    </div>
    <div class="footer-bar"></div>
</div>
</body>
</html>