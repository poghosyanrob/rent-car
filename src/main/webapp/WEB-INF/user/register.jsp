<%@ page import="am.example.rentcar.model.statusEnam.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
<div class="card narrow-card">
    <a href="/" class="back-link">← Back</a>
    <h1>Register</h1>

    <form action="/register" method="post">
        <input type="text" name="name" placeholder="First Name" required>
        <input type="text" name="surname" placeholder="Last Name" required>
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>

        <div class="radio-group">
            <input type="radio" name="role" id="user" value="USER" checked>
            <label for="user">User</label>
            <input type="radio" name="role" id="admin" value="ADMIN">
            <label for="admin">Admin</label>
        </div>

        <input type="submit" value="Create Account" class="btn">
    </form>
</div>
</body>
</html>
