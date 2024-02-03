<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Forget Password</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/resetSuccessful.css'/>">
</head>
<body>
<div class="register-wrapper">
    <header>
        <img src="<c:url value='/Images/MBIP_LOGO.png'/>" alt="MBIP_LOGO"> 
    </header>
    <div class="register-container">
    <div class="steps-indicator">
        <ul>
          <li class="completed"></li>
          <li class="completed"></li>
          <li class="active"></li>
        </ul>
      </div>
    
    <img src="<c:url value='/Images/successful-icon.png'/>" alt="Success" class="success-icon">
    <p>Your password successfully reset!</p>
    <button type="submit" onclick="location.href='<c:url value='/login'/>';">Login</button>
    </div>
    <div class="footer-bar"></div>
</div>
</body>
</html>
