<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choose Month</title>
    <link rel="stylesheet" href="<c:url value='/css/chooseMonth.css'/>">
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
  <div class="month-container">
    <h2 class="month-title">
        <span class="title-background">Choose Month</span>
    </h2>
    <div class="month-selection">
        <form action="<c:url value='/admin/verify-upload-category'/>" method="GET">
            <select name="month" required>
                <option value="" disabled selected>Select Month</option>
                <option value="January">January</option>
                <option value="February">February</option>
                <option value="March">March</option>
                <option value="April">April</option>
                <option value="May">May</option>
                <option value="June">June</option>
                <option value="July">July</option>
                <option value="August">August</option>
                <option value="September">September</option>             
                <option value="October">October</option>
                <option value="November">November</option>
                <option value="December">December</option>
                <!-- Add other months -->
            </select>
            <button type="submit">Next</button>
        </form>
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
