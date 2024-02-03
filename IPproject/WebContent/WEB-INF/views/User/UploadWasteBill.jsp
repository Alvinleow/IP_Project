<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Upload Waste Bill</title>
<link rel="stylesheet" href="<c:url value='/CSS/styles.css'/>">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function(){
      $("#sidebarUser").load("<c:url value='/user_view/sidebarUser.jsp'/>"); 
    });
</script>
</head>
<body>
  <div id="sidebarUser"></div>
  <div class="top">
    <div class="logo-container">
        <img src="<c:url value='/images/MBIP_LOGO.png'/>" alt="MBIP_LOGO" >
    </div>
    <div class="icon-container">
        <img src="<c:url value='/images/user_icon.png'/>" alt="user_icon" width="70" height="70" id="userIcon" class="dropdown-toggle">
        <div class="dropdown-menu" aria-labelledby="userIcon">
            <a class="dropdown-item" href="<c:url value='/user_view/user_profile.jsp'/>">
                <i class="profile-icon"></i> Profile
            </a>
            <a class="dropdown-item" href="<c:url value='/both_view/logout_page.jsp'/>">
                <i class="logout-icon"></i> Logout
            </a>
        </div>
    </div>
  </div> 

  <div class="main-content">
    <div class="contain-container">
      <h2 class="title">
        <span class="title-background">Upload Data</span>
      </h2>

      <h1 class="UBill-title">Insert Data for Waste Consumption</h1>
      <form id="uploadForm">
      <div class="upload-instructions">
        <p>1. Fill in the number of days (For example, enter 3 if 3 days of waste was produced).</p>
        <input type="text" id="days" name="days" required>
        
        <p>2. Fill in the weight of waste material (kg)</p>
        <input type="text" id="waste-consumption" name="waste-consumption" required>
        <button type="submit" class="submit-button">Submit</button>
      </div>
      </form>
    </div>
  </div>

  <div class="footer-bar"></div>
  <script>
      document.getElementById('uploadForm').addEventListener('submit', function(event) {
          var days = document.getElementById('days');
          var wasteConsumption = document.getElementById('waste-consumption');

          if (!days.value || !wasteConsumption.value) {
              event.preventDefault(); // Stop the form from submitting
              alert('Please fill in all the criteria before submitting.');
          }
          // Further validation and form submission handling can be done here
      });
  </script>

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
