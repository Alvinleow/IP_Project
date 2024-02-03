<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Profile</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminProfile.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function(){
      $("#sidebarAdmin").load("<c:url value='/Admin/adminSidebar.jsp'/>"); 
    });
</script>
<!-- Rest of the head content -->
</head>
<body>
<jsp:include page="../Admin/adminSidebar.jsp" />
<div class="main-content">
  <div class="report-container">
    <div class="top">
        <div class="logo-container">
            <img src="../Images/MBIP_LOGO.png" alt="MBIP_LOGO" >
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
        <span class="title-background">Profile</span>
    </h2>

    <div class="profile-container">
        <div class="profile-background"></div>
        <div class="profile-title">
            <div class="user-icon"><img src="../Images/user_icon.png" alt="user_icon" width="95" height="95" id="userIcon"></div>
            <div class="user-title">
                <p class="user-name">${user.fullname}</p>
                <p class="user-text">Personal Info</p>
            </div>
        </div>
        <div class="profile-info">

            <div class="information">
                <div class="icons">
                    <img src="../Images/profile_icon1.png" alt="profile_icon">
                </div>
                <div class="text">
                    Username: ${user.username}
                </div>
            </div>
            <div class="information">
                <div class="icons">
                    <img src="../Images/email_icon.png" alt="email_icon">
                </div>
                <div class="text">
                    Email: ${user.email}
                </div>
            </div>
            <div class="information">
                <div class="icons">
                    <img src="../Images/tel_icon.png" alt="phone_icon">
                </div>
                <div class="text">
                    Phone number: ${user.phoneNumber}
                </div>
            </div>
            <div class="information">
                <div class="icons">
                    <img src="../Images/address_icon.png" alt="address_icon">
                </div>
                <div class="text">
                    Residential Address: 
                    ${user.address}
                </div>
            </div>
            <div class="information">
                <div class="icons">
                    <img src="../Images/numbers_households_icon.png" alt="numbers_households_icon">
                </div>
                <div class="text">
                    Number of Households: ${user.households}
                </div>
            </div>
            <div class="information">
                <div class="icons">
                    <img src="../Images/building_icon.png" alt="building_icon">
                </div>
                <div class="text">
                    Type of Building: ${user.buildingtype}
                </div>
            </div>

        </div>
    </div>

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
