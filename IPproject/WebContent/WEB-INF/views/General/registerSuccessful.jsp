<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Account</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/registerSuccessful.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/background.css'/>">
</head>
<body>
<div class="register-wrapper">
    <header>
        <img src="<c:url value='/Images/MBIP_LOGO.png'/>" alt="MBIP_LOGO"> 
    </header>
    
    <div class="message-wrapper">
	    <img src="<c:url value='/Images/successful-icon.png'/>" alt="Success" class="success-icon">
	    <p>Your account successfully created!</p>
	    <button type="submit" onclick="location.href='<c:url value='/login'/>';">Login</button>
	</div>
	
    <div class="footer-bar"></div>
</div>
</body>
</html>
