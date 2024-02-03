<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value='/css/generateReportSidebar.css'/>">
    <title>Generate Report</title>
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
        <div class="report-container">
            <h2 class="report-title">
                <span class="title-background">Calculation/Generate Report</span>
            </h2>
            <div class="formula">
                <p>Formula For Calculate Carbon Emission:</p>
                <p>{Water Consumption} m³ x 0.419 kgCO2 /m³ = {Carbon Footprint} kgCO2</p>
                <p>{Electricity Consumption} kWh x 0.584 kgCO2 /kWh = {Carbon Footprint} kgCO2</p>
                <p>{Waste Consumption} kg x 2.860 kgCO2 /kg = {Carbon Footprint} kgCO2</p>
                <p>{Cooking Oil Consumption} L x 2.860 kgCO2 /L = {Carbon Footprint} kgCO2</p>
            </div>
            <div class="buttons-container">
                <a href="<c:url value='/calculate'/>" target="_self">
                    <button class="calculate-btn">Calculate</button>
                </a>
                <br><br>
                <a href="<c:url value='/Admin/generateReport.jsp'/>" target="_self">
                    <button class="view-report-btn">View Report</button>
                </a>
            </div>
        </div>
    </div>
    <div class="footer-bar"></div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
