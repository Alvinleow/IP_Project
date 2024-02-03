<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<jsp:include page="../User/SidebarUser.jsp" />
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Water Bill</title>
    <link rel="stylesheet" href="<c:url value='../css/styles.css'/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function(){
            $("#sidebarUser").load("sidebarUser.html"); 
        });
    </script>
</head>
<body>
    <jsp:include page="../User/SidebarUser.jsp" />

    <div class="top">
        <div class="logo-container">
            <img src="<c:url value='/Images/MBIP_LOGO.png'/>" alt="MBIP_LOGO" >
        </div>
        <div class="icon-container">
            <img src="<c:url value='/Images/user_icon.png'/>" alt="user_icon" width="70" height="70" id="userIcon" class="dropdown-toggle">
            <div class="dropdown-menu" aria-labelledby="userIcon">
                <a class="dropdown-item" href="<c:url value='/user/profile'/>">
                    <i class="profile-icon"></i> Profile
                </a>
                <a class="dropdown-item" href="<c:url value='/user/logout'/>">
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

            <h1 class="UBill-title">Insert Data for Recycling Cooking Oil Consumption</h1>
            <form id="uploadForm">
                <div class="upload-instructions">
                    <p>1. Please upload your recycling proof in pdf / jpeg / png.</p>
                    <input type="file" id="file-upload" name="file-upload" accept=".pdf,.jpeg,.png" required>
                    
                    <p>2. Fill in the number of days (For example, enter 3 if 3 days of oil was used).</p>
                    <input type="text" id="Odays-consumption" name="Odays-consumption" required>

                    <p>3. Fill in the volume of recycling cooking oil used(m3).</p>
                    <input type="text" id="oil-consumption" name="oil-consumption" required>
                    <button type="submit" class="submit-button">Submit</button>
                </div>
            </form>
        </div>
    </div>

    <div class="footer-bar"></div>
    <script>
        document.getElementById('uploadForm').onsubmit = function(event) {
            event.preventDefault();
            
            var fileUpload = document.getElementById('file-upload');
            var days = document.getElementById("Odays-consumption");
            var CookingOilConsumption = document.getElementById('oil-consumption');

            if (fileUpload.value && CookingOilConsumption.value && days.value) {
                window.location.href = '<c:url value="/CalculateResultOilConsumption.jsp"/>' + '?completed=oil';
            } else {
                alert('Please fill in all the criteria before submitting.');
            }
        };
    </script>

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
