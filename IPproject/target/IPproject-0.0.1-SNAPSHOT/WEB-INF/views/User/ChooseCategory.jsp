<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Consumption Category</title>
    <link rel="stylesheet" href="<c:url value='/CSS/styles.css'/>">
    <!-- Additional scripts or stylesheets can be included here -->
</head>

<body>
    <jsp:include page="../User/SidebarUser.jsp" />

    <div class="top">
        <div class="logo-container">
            <img src="<c:url value='/images/MBIP_LOGO.png'/>" alt="MBIP_LOGO">
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

            <p class= "description"></p>

            <div class="category-container">
                <div class="category-item">
                    <span class="button-number">1. </span>
                    <button class="category-button water" data-category = "water">Water</button>
                </div>
                <div class="category-item">
                    <span class="button-number">2. </span>
                    <button class="category-button electricity" data-category = "electricity">Electricity</button>
                </div>
                <div class="category-item">
                    <span class="button-number">3. </span>
                    <button class="category-button waste" data-category = "waste">Waste</button>
                </div>
                <div class="category-item">
                    <span class="button-number">4. </span>
                    <button class="category-button oil" data-category = "oil">Recycling cooking oil</button>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bar"></div>

    <script>
        function getQueryParam(param) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(param);
        }

        document.addEventListener('DOMContentLoaded', () => {
            const selectedMonth = getQueryParam('month');
            if (selectedMonth) {
                document.querySelector('.main-content p').textContent = 'Select consumption category for ' + selectedMonth + ' to insert data for carbon emission calculation';
            }
        });

        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const completedCategory = urlParams.get('completed');
            
            if (completedCategory) {
                // Add a green tick to the corresponding category button
                var completedButton = document.querySelector('.' + completedCategory);
                if (completedButton) {
                    var tick = document.createElement('img');
                    tick.src = '<c:url value="/images/check-icon.png"/>'; // Path to your green tick image
                    tick.alt = 'Completed';
                    tick.classList.add('check-icon', 'completed');
                    tick.style.display = 'block'; // Make sure to display the tick if it's set to none
                    completedButton.parentNode.appendChild(tick);
                }
            }
        });

        const categoryButtons = document.querySelectorAll('.category-button');
        
        categoryButtons.forEach(button => {
            button.addEventListener('click', function() {
                const category = this.getAttribute('data-category');
                switch(category) {
                    case 'water':
                        window.location.href = '<c:url value="/Upload-Water-Bill.jsp"/>';
                        break;
                    case 'electricity':
                        window.location.href = '<c:url value="/Upload-Electricity-Bill.jsp"/>';
                        break;
                    case 'waste':
                        window.location.href = '<c:url value="/Upload-Waste-Bill.jsp"/>';
                        break;
                    case 'oil':
                        window.location.href = '<c:url value="/Upload-Cooking-Oil-Recycling.jsp"/>';
                        break;
                }
            });
        });

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
