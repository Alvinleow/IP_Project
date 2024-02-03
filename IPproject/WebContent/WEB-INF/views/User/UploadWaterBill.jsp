<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Water Bill</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
                <span class="title-background">Upload Data</span>
            </h2>

            <h1 class="UBill-title">Upload Water Bill</h1>
            <form id="uploadForm" action="<c:url value='/user/uploadWaterBill'/>" method="post" enctype="multipart/form-data">
                <div class="upload-instructions">
                    <p>1. Please upload your water bill in pdf / jpeg / png.</p>
                    <input type="file" id="file-upload" name="file" accept=".pdf,.jpeg,.png" required>
                    
                    <p>2. Fill in the water consumption (m³)</p>
                    <input type="text" id="water-consumption" name="consumption" required>
                    
                    <input type="hidden" name="bill_month" value="<%= session.getAttribute("selectedMonth") %>" />
    				<button type="submit" class="submit-button">Submit</button>
                </div>
            </form>
        </div>
    </div>

    <div class="footer-bar"></div>
    <script>
        // Dropdown Menu Script
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
