<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Data for Carbon Emission Calculation</title>
    <link rel="stylesheet" href="<c:url value='/CSS/styles.css'/>">
    <!-- Include any other styles or scripts here -->
</head>
<body>
    <jsp:include page="../User/SidebarUser.jsp" />

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
            
            <p class="description">Select month to insert data for carbon emission calculation</p>
            
            <div class="month-grid">
                <!-- Month buttons -->
                <c:forEach var="month" items="${months}" varStatus="status">
                    <div class="month-item">
                        <button class="month-button" id="${month}">${month}</button>
                        <span class= "month-number">${status.index + 1}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div> 

    <div class="footer-bar"></div>

    <script>
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

            document.querySelectorAll('.month-button').forEach(button => {
                button.addEventListener('click', function() {
                    window.location.href = '<c:url value="/chooseCategory"/>' + '?month=' + this.id;
                });
            });
        });
    </script>
</body>
</html>
