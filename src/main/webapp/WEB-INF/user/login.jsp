<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
<div class="card narrow-card">
    <a href="/" class="back-link">← Back</a>
    <h1>Log in</h1>

    <% String message = (String) session.getAttribute("message");
        if(message != null) { %>
    <div class="alert"><%=message%></div>
    <% session.removeAttribute("message"); %>
    <% } %>

    <form action="/login" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Log in" class="btn">
    </form>
</div>

</body>
</html>
