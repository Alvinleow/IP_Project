<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload Status</title>
    <link rel="stylesheet" href="<c:url value='../css/uploadStatus.css'/>">
</head>
<body>
    <div class="status-message">
        <h2>Upload Status</h2>
        <p>${message}</p>
        <a href="<c:url value='/user/dashboard'/>">Return to Dashboard</a>
    </div>
</body>
</html>
