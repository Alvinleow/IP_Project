<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carbon Footprint Calculation Result</title>
    <link rel="stylesheet" href="<c:url value='../css/styles.css'/>">
</head>
<body>
    <jsp:include page="../User/SidebarUser.jsp" />

    <div class="top">
        <div class="logo-container">
            <img src="<c:url value='/Images/MBIP_LOGO.png'/>" alt="MBIP_LOGO">
        </div>
        <div class="icon-container">
            <img src="<c:url value='/Images/user_icon.png'/>" alt="user_icon" width="70" height="70" id="userIcon" class="dropdown-toggle">
            <div class="dropdown-menu" aria-labelledby="userIcon">
                <a class="dropdown-item" href="<c:url value='/user/profile'/>">
                    <i class="profile-icon"></i> Profile
                </a>
                <a class="dropdown-item" href="<c:url value='/logout'/>">
                    <i class="logout-icon"></i> Logout
                </a>
            </div>
        </div>
    </div> 

    <div class="main-content">
        <div class="contain-container">
            <h2 class="title">
                <span class="title-background">Calculation/Generate Report</span>
            </h2>
            
            <h1 class="description">Carbon Footprint Calculation Result for Electricity</h1>
            <div class="result-value">46.72 kgCO<sub>2</sub></div>
            <div class="button-container">
                <button id="show-calculation" class="show-calculation">show calculation</button>
            </div>
            <div class="calculation-details">
                <p>[Electricity Consumption] kWh x [co2PerKwh] kgCO2 /kWh = [Carbon Footprint] kgCO2</p>
                <p>${ElectricConsumption}kWh x ${co2PerKwh} kgCO2/kWh = ${carbonFootprint} kgCO2</p>
            </div>
            <div class="button-container">
                <button type="button" class="finish-button" onclick="window.location.href='<c:url value="/user/upload"/>';">Finish</button>
            </div>
        </div>
    </div>

    <div class="footer-bar"></div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Show/hide calculation details
        document.getElementById('show-calculation').addEventListener('click', function() {
            var details = document.querySelector('.calculation-details');
            if(details.style.display === 'none') {
                details.style.display = 'block';
            } else {
                details.style.display = 'none';
            }
        });

        // Dropdown menu for user icon
        document.addEventListener('DOMContentLoaded', function() {
            var userIcon = document.getElementById("userIcon");
            var dropdownMenu = document.querySelector(".dropdown-menu");
            
            userIcon.addEventListener("click", function(event) {
                dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
                event.stopPropagation();
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
