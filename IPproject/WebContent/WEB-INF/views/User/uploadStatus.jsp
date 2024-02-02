<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload Status</title>
    <link rel="stylesheet" href="<c:url value='/CSS/uploadStatus.css'/>">
</head>
<body>
    <div class="status-message">
        <h2>Upload Status</h2>
        <p>${message}</p>
        <a href="<c:url value='/admin/dashboard'/>">Return to Dashboard</a>
    </div>
</body>
</html>
