<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin Home Page</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminHomePage.css">
</head>
<body>
  <jsp:include page="../Admin/adminSidebar.jsp" />

<div class="main-content">
  <div class="report-container">
    <div class="top">
        <div class="logo-container">
            <img src="<c:url value='/Images/MBIP_LOGO.png'/>" alt="MBIP_LOGO">
        </div>
        <div class="icon-container">
            <img src="<c:url value='/Images/user_icon.png'/>" alt="user_icon" width="70" height="70" id="userIcon" class="dropdown-toggle">
            <div class="dropdown-menu" aria-labelledby="userIcon">
                <a class="dropdown-item" href="../admin_view/admin_profile.html">
                    <i class="profile-icon"></i> Profile
                </a>
                <a class="dropdown-item" href="../both_view/logout_page.html">
                    <i class="logout-icon"></i> Logout
                </a>
            </div>
        </div>
    </div>
    <h2 class="report-title">
        <span class="title-background">Home Page</span>
    </h2>

    <img src="<c:url value='/Images/home screenshot.png'/>" alt="HomePage">

  </div>
</div>
<div class="footer-bar"></div>

<script>
    // Pure JavaScript
    document.addEventListener('DOMContentLoaded', function() {
      var userIcon = document.getElementById("userIcon");
      var dropdownMenu = document.querySelector(".dropdown-menu");
    
      userIcon.addEventListener("click", function(event) {
        dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
        event.stopPropagation(); // Prevent the click from being detected by the window event
      });
    
      window.addEventListener("click", function() {
        if (dropdownMenu.style.display === "block") {
          dropdownMenu.style.display = "none";
        }
      });
    });
</script>

</body>
</html>
