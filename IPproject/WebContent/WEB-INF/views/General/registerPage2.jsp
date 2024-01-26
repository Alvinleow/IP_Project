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
            <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Phone Number" pattern="[0-9]{11}" maxlength="11" required>
            <div class="confirm-code">
                <div class="code-input">
                    <p>Confirmation Code</p>
                    <input type="text" id="confirmCode" name="confirmCode" placeholder="  —  —  —  —  " pattern="[0-9]{4}" maxlength="4" required>
                </div>
                <div class="resend-button">
                    <button type="button">
                        <img src="<c:url value='/Images/resend.png'/>" alt="Resend" class="resend-icon">
                        Send Again
                    </button>
                </div>
            </div>
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
