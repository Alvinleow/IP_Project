<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choose Month</title>
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
  <div class="month-container">
    <h2 class="month-title">
        <span class="title-background">Choose Month</span>
    </h2>
    <div class="month-selection">
        <form action="<c:url value='/admin/verify-upload-category'/>" method="GET">
            <select name="month" required>
                <option value="" disabled selected>Select Month</option>
                <option value="January">January</option>
                <option value="February">February</option>
                <option value="March">March</option>
                <!-- Add other months -->
            </select>
            <button type="submit">Next</button>
        </form>
    </div>
  </div>
</div>
<div class="footer-bar"></div>
</body>
</html>
