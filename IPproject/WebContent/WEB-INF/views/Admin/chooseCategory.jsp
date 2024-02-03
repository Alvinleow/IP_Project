<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choose Category</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
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
  <div class="category-container">
    <h2 class="category-title">
        <span class="title-background">Choose Category</span>
    </h2>
    <div class="category-selection">
        <form action="<c:url value='/admin/verify-upload'/>" method="GET">
            <select name="category" required>
                <option value="" disabled selected>Select Category</option>
                <option value="water">Water Bills</option>
                <option value="electricity">Electricity Bills</option>
                <option value="cookingOil">Cooking Oil Bills</option>
                <option value="waste">Waste Bills</option>
                <!-- Add other categories if any -->
            </select>
            <button type="submit">Verify</button>
        </form>
    </div>
  </div>
</div>
<div class="footer-bar"></div>
</body>
</html>
