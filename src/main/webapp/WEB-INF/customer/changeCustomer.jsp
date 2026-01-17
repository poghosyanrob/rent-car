<%@ page import="am.example.rentcar.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Customer</title>
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
<div class="card form-card">
<% Customer customer = (Customer) request.getAttribute("customer"); %>


    <a href="/" class="back-link">← Home</a>
    <h1>Change Customer data</h1>
<a href="/customer"> Back to Customer</a>

<form action="/changeCustomer" method="post">
    <input type="hidden" required name="id" value="<%=customer.getId()%>">
    <input type="text" required name="name" value="<%=customer.getName()%>"><br>
    <input type="text" required name="surname" value="<%=customer.getSurname()%>"><br>
    <input type="text" required name="licenseNumber" value="<%=customer.getLicenseNumber()%>" ><br>
    <input type="tel" required name="phone" value="<%=customer.getPhone()%>"><br>
    <input type="email" required name="email" value="<%=customer.getEmail()%>"><br>
    <input type="submit" value="Change Customer" class="btn">
</form>
</div>
</body>
</html>
