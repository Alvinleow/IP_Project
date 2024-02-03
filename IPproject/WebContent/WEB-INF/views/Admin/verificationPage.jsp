<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verification Page</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/verificationPage.css'/>">
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
    <h2>Verification Page of ${selectedCategory} bill for ${selectedMonth}</h2>
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">
            ${successMessage}
        </div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">
            ${errorMessage}
        </div>
    </c:if>
    <table>
	    <thead>
	        <tr>
	            <th>User ID</th>
	            <c:if test="${selectedCategory == 'cooking_oil'}">
	                <th>Recycling Days</th>
	                <th>Volume</th>
	            </c:if>
	            <c:if test="${selectedCategory == 'waste'}">
	                <th>Days Produced</th>
	                <th>Weight</th>
	            </c:if>
	            <c:if test="${selectedCategory == 'water' || selectedCategory == 'electricity'}">
	                <th>Consumption</th>
	            </c:if>
	            <th>File Content</th>
	            <th>Action</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach var="data" items="${unverifiedData}">
	            <tr>
	                <td>${data.user_id}</td>
	                <c:if test="${selectedCategory == 'cooking_oil'}">
	                    <td>${data.recycling_days}</td>
	                    <td>${data.volume}</td>
	                </c:if>
	                <c:if test="${selectedCategory == 'waste'}">
	                    <td>${data.days_produced}</td>
	                    <td>${data.weight}</td>
	                </c:if>
	                <c:if test="${selectedCategory == 'water' || selectedCategory == 'electricity'}">
	                    <td>${data.consumption}</td>
	                </c:if>
	                <td>
	                    <c:choose>
	                        <c:when test="${selectedCategory == 'water' || selectedCategory == 'electricity' || selectedCategory == 'cooking_oil'}">
	                            <a href="<c:url value='/downloadFile?fileId=${data.id}'/>">Download File</a>
	                        </c:when>
	                        <c:otherwise>
	                            N/A
	                        </c:otherwise>
	                    </c:choose>
	                </td>
	                <td>
	                    <a href="<c:url value='/admin/verify?id=${data.id}&category=${selectedCategory}&month=${selectedMonth}'/>">Verify</a>
	                </td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>


</div>

<div class="footer-bar"></div>

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
