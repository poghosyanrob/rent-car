<%@ page import="am.example.rentcar.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>App</title>
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
<% User user = (User) session.getAttribute("user"); %>
<div class="card">
    <h1>Rent Car</h1>
    <% if(user == null) { %>
    <div class="nav-stack">
        <a href="/login" class="btn">Login</a>
        <a href="/register" class="btn">Register</a>
        <a href="/searchCar" class="back-link">Search for a free car</a>
    </div>
    <% } else { %>
    <div class="user-badge">
        Welcome, <%=user.getName()%>
    </div>
    <div class="nav-stack">
        <a href="/car" class="btn">Cars</a>
        <a href="/customer" class="btn">Customers</a>
        <a href="/rental" class="btn">Rentals</a>
        <a href="/searchCar" class="btn">Search for a free car</a>
        <a href="/logout" class="btn btn-danger">Log out</a>
    </div>
    <% } %>
</div>
</body>
</html>
