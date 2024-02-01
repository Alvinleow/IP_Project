<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Report</title>
    <link rel="stylesheet" href="../css/generateReport.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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
          <a class="dropdown-item" href="../Admin/adminProfile.jsp">
              <i class="profile-icon"></i> Profile
          </a>
          <a class="dropdown-item" href="../General/">
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
        <div class="PieChart">
            <canvas id="myChart" style="width:100%;max-width:800px"></canvas>
        </div>
        <div class="buttons-container">
            <button class="generate-btn" onclick="msg()">Generate Report</button>
      		<br><br>
      		<a href="../Admin/viewReport.jsp" target="_self">
      		<button class="download-btn" >Download Report</button>
      		</a>
        </div>
    </div>
</div>
<div class="footer-bar"></div>

<script>
    function msg() {
      alert("Generation Success");
    }
</script>

<script>
    var xValues = ["Recycle Cooking Oil", "Waste", "Electricity", "Water"];
    var yValues = [7, 9, 46, 37];
    var barColors = [
      "#85b6ff",
      "#4ecb71",
      "#ffd233",
      "#ff9a62",
    ];
    
    new Chart("myChart", {
      type: "pie",
      data: {
        labels: xValues,
        datasets: [{
          backgroundColor: barColors,
          data: yValues
        }]
      },
      options: {
        title: {
          display: true,
          text: "Carbon Emission of June 2023"
        },
        // legend: {
        //     display: true,
        //     position: 'right'
        // },
      }
    });
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
