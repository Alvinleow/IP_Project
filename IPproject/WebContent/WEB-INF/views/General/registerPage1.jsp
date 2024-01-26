<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Account</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/register1.css'/>">
</head>
<body>
<div class="register-wrapper">
    <header>
      <img src="<c:url value='/Images/back-icon.png'/>" alt="back" height="40px" id="backButton" onclick="history.back()">
      <img src="<c:url value='/Images/MBIP_LOGO.png'/>" alt="MBIP_LOGO"> 
    </header>
    <div class="register-container">
    <div class="register-title">Register account</div>
    <div class="steps-indicator">
      <ul>
        <li class="active"></li>
        <li></li>
        <li></li>
      </ul>
    </div>
    
    <form class="register-form" action="<c:url value='/register'/>" method="post">
        <input type="text" id="fullname" name="fullname" placeholder="Full Name" required>
        <input type="text" id="address" name="address" placeholder="Residential Address" autocomplete="address-line1" required>
        <input type="number" id="households" name="households" placeholder="Number of Households" required>
        <select id="buildingtype" name="buildingtype" required>
          <option value="">Select Type of Building</option>
          <option value="Bungalow">Bungalow</option>
          <option value="Semi-Detached Houses">Semi-Detached Houses</option>
          <option value="Detached Houses">Detached Houses</option>
          <option value="Terrace House">Terrace House</option>
          <option value="Link House">Link House</option>
          <option value="Superlink House">Superlink House</option>
          <option value="Townhouse">Townhouse</option>
          <option value="Penthouse">Penthouse</option>
          <option value="Condominium">Condominium</option>
          <option value="Serviced Residence">Serviced Residence</option>
          <option value="Studio Apartments">Studio Apartments</option>
          <option value="Duplex Condos">Duplex Condos</option>
          <option value="Apartment">Apartment</option>
          <option value="Flat">Flat</option>
        </select>
        
        <button type="submit">Next</button>
        <div class="footer">
        Already have an account? <a href="<c:url value='/login'/>">Log In</a>
        </div>
    </form>
    </div>
    <div class="footer-bar"></div>
</div>
</body>
</html>