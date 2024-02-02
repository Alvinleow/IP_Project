<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
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

        #sidebarAdmin {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #FAF9F6;
            padding-top: 20px;
        }

        #sidebarAdmin a {
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            color: gray;
            display: flex;
            align-items: center;
            transition: 0.3s;
        }

        #sidebarAdmin a:hover {
            background-color:lightgray;
        }

        #sidebarAdmin img.logo {
            width: 80%;
            padding: 10px;
        }
        #sidebarAdmin img.icon {
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

    <div id="sidebarAdmin">
	    <img src="<c:url value='/Images/logo_baru_web.gif'/>" alt="Sidebar Image" class="logo">
	    <a href="<c:url value='/Admin/adminHomePage.jsp'/>"><img src="<c:url value='/Images/home-48.png'/>" alt="Home Icon" class="icon">Home</a>
	    <a href="#"><img src="<c:url value='/Images/calendar-50.png'/>" alt="Calendar Icon" class="icon">Calendar</a>
	    <a href="<c:url value='/Admin/dashboard_admin.jsp'/>"><img src="<c:url value='/Images/dashboard-64.png'/>" alt="Dashboard Icon" class="icon">Dashboard</a>
	    <a href="<c:url value='/Admin/calculate_generateReport.jsp'/>"><img src="<c:url value='/Images/report-50.png'/>" alt="Report Icon" class="icon">Calculation/Generate Report</a>
	    <a href="<c:url value='/Admin/view_participant.jsp'/>"><img src="<c:url value='/Images/person-64.png'/>" alt="Participants Icon" class="icon">View Participants</a>
	</div>

    <!-- <div id="content">
        <h2>Main Content Area</h2>
        <p>This is the main content area. You can add your website content here.</p>
    </div> -->

</body>
</html>
