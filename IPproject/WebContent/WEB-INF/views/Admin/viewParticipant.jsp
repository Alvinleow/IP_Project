<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/css/viewParticipant.css'/>">
    <title>View Participant</title>
</head>
<body>
<jsp:include page="../Admin/adminSidebar.jsp" />
<div class="top">
  <div class="logo-container">
      <img src="<c:url value='/Images/MBIP_LOGO.png'/>" alt="MBIP_LOGO" >
  </div>
  <div class="icon-container">
      <img src="<c:url value='/Images/user_icon.png'/>" alt="user_icon" width="70" height="70" id="userIcon" class="dropdown-toggle">
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
<div class="main-content">
  <div class="view-container">
    <h2 class="view-title">
        <span class="title-background">View Participant</span>
    </h2>
    <div class="search-box">
        <input type="text" placeholder="Search...">
    </div>
    <div class="participant-list">
        <table>
        <thead>
            <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Address</th>
            <th>Households</th>
            <th>Building Type</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="participant" items="${participants}">
                    <tr>
                        <td>${participant.fullname}</td>
                        <td>${participant.email}</td>
                        <td>${participant.phoneNumber}</td>
                        <td>${participant.address}</td>
                        <td>${participant.households}</td>
                        <td>${participant.buildingtype}</td>
                    </tr>
          	</c:forEach>
        </tbody>
        </table>
    </div>
  </div>
</div>
<div class="footer-bar"></div>

<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
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
