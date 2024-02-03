<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        #sidebarUser {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #FAF9F6;
            padding-top: 20px;
        }

        #sidebarUser a {
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            color: gray;
            display: flex;
            align-items: center;
            transition: 0.3s;
        }

        #sidebarUser a:hover {
            background-color: lightgray;
        }

        #sidebarUser img.logo {
            width: 80%;
            padding: 10px;
        }
        #sidebarUser img.icon {
            width: 24px; /* Adjust the width and height based on your icon size */
            height: 24px;
            margin-right: 10px;
        }
        #content {
            margin-left: 250px;
            padding: 16px;
        }
    </style>
</head>
<body>
    <div id="sidebarUser">
        <img src="<c:url value='/Images/logo_baru_web.gif'/>" alt="Sidebar Image" class="logo">
        <a href="<c:url value='/user/home'/>"><img src="<c:url value='/Images/home-48.png'/>" alt="Home Icon" class="icon">Home</a>
        <a href="<c:url value='//user/dashboard'/>"><img src="<c:url value='/Images/dashboard-64.png'/>" alt="Dashboard Icon" class="icon">Dashboard</a>
        <a href="<c:url value='/user/upload'/>"><img src="<c:url value='/Images/link-24.png'/>" alt="Upload Data Icon" class="icon">Upload Data</a>
        <a href="#"><img src="<c:url value='/Images/aboutus.png'/>" alt="About us Icon" class="icon">About us</a>
    </div>

    <!-- 
    <div id="content">
        <h2>Main Content Area</h2>
        <p>This is the main content area. You can add your website content here.</p>
    </div>
    -->
</body>
</html>
