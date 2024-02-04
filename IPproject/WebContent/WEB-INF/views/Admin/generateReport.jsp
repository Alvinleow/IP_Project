<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Report</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/generateReport.css">
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
        <!-- Add this form inside your main-content div in generateReport.jsp -->
		<form action="<c:url value='/admin/generateMonthlyReport'/>" method="GET">
		    <select name="selectedMonth" onchange="this.form.submit()">
		        <option value="" disabled selected>Choose Month</option>
		        <c:forEach items="${months}" var="month">
				    <option value="${month}">${month}</option>
				</c:forEach>
		    </select>
		</form>
        <div class="PieChart">
            <canvas id="myChart" style="width:100%;max-width:800px"></canvas>
        </div>
        <div class="total-count">
            <h3>Total Uploads for ${selectedMonth}: ${total}</h3>
        </div>
    </div>
</div>
<div class="footer-bar"></div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var selectedMonth = "${selectedMonth}";
        var countWater = ${countWater};
        var countElectricity = ${countElectricity};
        var countCookingOil = ${countCookingOil};
        var countWaste = ${countWaste};
        
        var xValues = ["Recycle Cooking Oil", "Waste", "Electricity", "Water"];
        var yValues = [countCookingOil, countWaste, countElectricity, countWater];
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
              text: "Carbon Emission for " + selectedMonth
            },
            // legend: {
            //     display: true,
            //     position: 'right'
            // },
          }
        });
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
