<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Download Report</title>
    <link rel="stylesheet" href="../css/viewReport.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(function(){
          $("#sidebarAdmin").load("../Admin/adminSidebar.jsp"); 
        });
    </script>

</head>
<body>
<jsp:include page="../Admin/adminSidebar.jsp" />
<div id="sidebarAdmin"></div>
<div class="top">
    <div class="logo-container">
      <img src="../Images/MBIP_LOGO.png" alt="MBIP_LOGO" >
  </div>
  <div class="icon-container">
      <img src="../Images/user_icon.png" alt="user_icon" width="70" height="70" id="userIcon" class="dropdown-toggle">
      <div class="dropdown-menu" aria-labelledby="userIcon">
          <a class="dropdown-item" href="../Admin/adminProfile.html">
              <i class="profile-icon"></i> Profile
          </a>
          <a class="dropdown-item" href="../General">
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
	          <!-- Report Item for January -->
	          <div class="download-item">
	            <img src="../Images/sheet_logo.png" alt="January Report" />
	            <p>January</p>
	            <button>Download</button>
	          </div>
	          <div class="download-item">
	            <img src="../Images/sheet_logo.png" alt="February Report" />
	            <p>February</p>
	            <button>Download</button>
	          </div>
	          <div class="download-item">
	            <img src="../Images/sheet_logo.png" alt="March Report" />
	            <p>March</p>
	            <button>Download</button>
	          </div>
	          <div class="download-item">
	            <img src="../Images/sheet_logo.png" alt="April Report" />
	            <p>April</p>
	            <button>Download</button>
	          </div>
	          <div class="download-item">
	            <img src="../Images/sheet_logo.png" alt="May Report" />
	            <p>May</p>
	            <button>Download</button>
	          </div>
	          <div class="download-item">
	            <img src="../Images/sheet_logo.png" alt="June Report" />
	            <p>June</p>
	            <button>Download</button>
	          </div>
	          <div class="download-item">
	            <img src="../Images/sheet_logo.png" alt="July Report" />
	            <p>July</p>
	            <button>Download</button>
	          </div>
	          <div class="download-item">
	            <img src="../Images/sheet_logo.png" alt="August Report" />
	            <p>August</p>
	            <button>Download</button>
	          </div>
	          <!-- Repeat blocks like the above for each month, adding 'new-indicator' span where appropriate -->
	          <!-- Report Item for June with 'NEW' indicator -->
	          <div class="download-item">
	            <img src="../Images/sheet_logo.png" alt="September Report" />
	            <p>September <span class="new-indicator">NEW</span></p>
	            <button>Download</button>
	          </div>
	          <!-- More report items... -->
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
