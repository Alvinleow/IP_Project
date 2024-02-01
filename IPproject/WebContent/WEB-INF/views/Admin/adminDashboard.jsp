<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Admin</title>
    <link rel="stylesheet" href="../css/adminDashboard.css">

</head>
<body>
<jsp:include page="../Admin/adminSidebar.jsp" />

<div class="main-content">
    <div class="report-container">
        <div class="top">
            <div class="logo-container">
                <img src="../Images/MBIP_LOGO.png" alt="MBIP_LOGO">
            </div>
            <div class="icon-container">
                <img src="../Images/user_icon.png" alt="user_icon" width="70" height="70" id="userIcon" class="dropdown-toggle">
                <div class="dropdown-menu" aria-labelledby="userIcon">
                    <a class="dropdown-item" href="<c:url value='/admin/profile'/>">
                        <i class="profile-icon"></i> Profile
                    </a>
                    <a class="dropdown-item" href="<c:url value='/logout'/>">
                        <i class="logout-icon"></i> Logout
                    </a>
                </div>
            </div>
        </div>
        <h2 class="report-title">
            <span class="title-background">Dashboard</span>
        </h2>

        <img src="<c:url value='/Images/dashboard screenshot.png'/>" alt="Dashboard">
    </div>
</div>

<div class="footer-bar"></div>

<script>
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
