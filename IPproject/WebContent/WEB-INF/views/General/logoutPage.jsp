<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout Successful</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/logoutPage.css">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/background.css'/>">
</head>
<body>
<div class="logout-wrapper">
    <header>
        <img src="<c:url value='/Images/MBIP_LOGO.png'/>" alt="MBIP_LOGO">
    </header>
    
	<div class="message-wrapper">
	    <img src="<c:url value='/Images/successful-icon.png'/>" alt="Success" class="success-icon">
	    <p>Log out successfully!</p>
	    <button type="button" onclick="window.location.href='<c:url value='/login'/>';">Login Again</button>
	</div>

    <div class="footer-bar"></div>
</div>
</body>
</html>
