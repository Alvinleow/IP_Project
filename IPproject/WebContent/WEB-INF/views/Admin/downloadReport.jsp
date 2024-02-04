<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Download Report</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/downloadReport.css'/>">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function(){
          $("#sidebarAdmin").load("<c:url value='/admin/sidebarAdmin.jsp'/>"); 
        });
    </script>
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
        <div class="download-container">
            <h2 class="report-title">
                <span class="title-background">Calculation/Generate Report</span>
            </h2>
            <div class="download-file">
                <h1 class="download-title">Low Carbon Initiatives Report 2023</h1>
                <div class="download-grid">
                    <!-- Use JSTL c:forEach to iterate over a list of reports -->
                    <c:forEach items="${reports}" var="report">
                        <div class="download-item">
                            <img src="<c:url value='/Images/sheet_logo.png'/>" alt="${report.month} Report" />
                            <p>${report.month}</p>
                            <!-- Assuming there's a method to download the report -->
                            <a href="<c:url value='/reports/download/${report.id}'/>" class="button">Download</a>
                        </div>
                    </c:forEach>
                </div>
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
