<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Account</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/register2.css'/>">
</head>
<body>
<div class="register-wrapper">
    <header>
      <img src="<c:url value='/Images/back-icon.png'/>" alt="back" height="40px" id="backButton" onclick="history.back()">
      <img src="<c:url value='/Images/MBIP_LOGO.png'/>" alt="MBIP_LOGO"> 
    </header>
    <div class="register-container">
        <div class="register-title">Register account</div>
        <div class="steps-indicator">
          <ul>
            <li class="completed"></li>
            <li class="active"></li>
            <li></li>
          </ul>
        </div>

        <form class="register-form" action="<c:url value='/registerProcess2'/>" method="post">
            <input type="email" id="email" name="email" placeholder="Email" required>
            <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Phone Number" pattern="\d{10,11}" maxlength="11" required
            title="Phone number must be 10 or 11 digits" >

            <button type="submit" class="submit-button">Next</button>
            <div class="footer">
            Already have an account? <a href="<c:url value='/login'/>">Log In</a>
            </div>
        </form>
    </div>
    <div class="footer-bar"></div>
</div>
</body>
</html>
