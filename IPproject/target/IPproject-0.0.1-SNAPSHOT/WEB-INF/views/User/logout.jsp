<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout Successful</title>
</head>
<body>
    <div class="logout-message">
        <p>You have been logged out successfully!</p>
        <form action="<c:url value='/login'/>" method="get">
            <button type="submit">Login Again</button>
        </form>
    </div>
</body>
</html>
