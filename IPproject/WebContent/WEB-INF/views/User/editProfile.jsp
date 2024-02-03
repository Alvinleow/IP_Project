<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/editProfile.css'/>">
</head>
<body>
<div class="register-wrapper">
    <header>
        <img src="<c:url value='/Images/back-icon.png'/>" alt="back" height="40px" id="backButton" onclick="history.back()">
        <img src="<c:url value='/Images/MBIP_LOGO.png'/>" alt="MBIP_LOGO">
    </header>
    <div class="register-container">
        <div class="register-title">Edit Profile</div>
        
        <form class="register-form" action="<c:url value='/admin/updateProfile'/>" method="post">
            <input type="email" id="email" name="email" placeholder="Email" value="${user.email}" required>
            <input type="tel" id="phoneNumber" name="phoneNumber" placeholder="Phone Number" pattern="\d{10,11}" maxlength="11" required
            title="Phone number must be 10 or 11 digits" value="${user.phoneNumber}" >	
            <input type="text" id="address" name="address" placeholder="Residential Address" value="${user.address}" required>
            <input type="number" id="households" name="households" placeholder="Number of Households" value="${user.households}" required>
            
            <select id="buildingtype" name="buildingtype" required>
                <option value="">Select Type of Building</option>
                <option value="Bungalow" ${user.buildingtype == 'Bungalow' ? 'selected' : ''}>Bungalow</option>
                <option value="Semi-Detached Houses" ${user.buildingtype == 'Semi-Detached Houses' ? 'selected' : ''}>Semi-Detached Houses</option>
                <option value="Detached Houses" ${user.buildingtype == 'Detached Houses' ? 'selected' : ''}>Detached Houses</option>
                <option value="Terrace House" ${user.buildingtype == 'Terrace House' ? 'selected' : ''}>Terrace House</option>
                <option value="Link House" ${user.buildingtype == 'Link House' ? 'selected' : ''}>Link House</option>
                <option value="Superlink House" ${user.buildingtype == 'Superlink House' ? 'selected' : ''}>Superlink House</option>
                <option value="Townhouse" ${user.buildingtype == 'Townhouse' ? 'selected' : ''}>Townhouse</option>
                <option value="Penthouse" ${user.buildingtype == 'Penthouse' ? 'selected' : ''}>Penthouse</option>
                <option value="Condominium" ${user.buildingtype == 'Condominium' ? 'selected' : ''}>Condominium</option>
                <option value="Serviced Residence" ${user.buildingtype == 'Serviced Residence' ? 'selected' : ''}>Serviced Residence</option>
                <option value="Studio Apartments" ${user.buildingtype == 'Studio Apartments' ? 'selected' : ''}>Studio Apartments</option>
                <option value="Duplex Condos" ${user.buildingtype == 'Duplex Condos' ? 'selected' : ''}>Duplex Condos</option>
                <option value="Apartment" ${user.buildingtype == 'Apartment' ? 'selected' : ''}>Apartment</option>
                <option value="Flat" ${user.buildingtype == 'Flat' ? 'selected' : ''}>Flat</option>
            </select>
            
            <button type="submit">Update</button>
        </form>
    </div>
    <div class="footer-bar"></div>
</div>

</body>
</html>