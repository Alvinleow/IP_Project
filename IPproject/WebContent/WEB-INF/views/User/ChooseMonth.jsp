<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>

<%
    List<String> months = Arrays.asList("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Data for Carbon Emission Calculation</title>
    <link rel="stylesheet" href="<c:url value='../css/styles.css'/>">
    <!-- Include any other styles or scripts here -->
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
            
            <p class="description">Select month to insert data for carbon emission calculation</p>
            
            <div class="month-grid">
		        <% if (months != null && !months.isEmpty()) { %>
		            <div class="month-grid">
		                <% for (int i = 0; i < months.size(); i++) { %>
		                    <div class="month-item">
		                        <button class="month-button" id="<%= months.get(i) %>"><%= months.get(i) %></button>
		                        <span class="month-number"><%= i + 1 %></span>
		                    </div>
		                <% } %>
		            </div>
		        <% } else { %>
		            <p>No months available.</p>
		        <% } %>
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
                    window.location.href = '<c:url value="/user/chooseCategory"/>' + '?month=' + this.id;
                });
            });
        });
    </script>
</body>
</html>
