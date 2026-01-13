<%@ page import="am.example.rentcar.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Customer</title>
</head>
<body>
<% Customer customer = (Customer) request.getAttribute("customer"); %>

<h1>Change Customer data</h1>
<a href="/" > Back to Rent Car</a><br>
<a href="/customer"> Back to Customer</a>

<form action="/changeCustomer" method="post">
    <input type="hidden" name="id" value="<%=customer.getId()%>">
    <input type="text" name="name" value="<%=customer.getName()%>"><br>
    <input type="text" name="surname" value="<%=customer.getSurname()%>"><br>
    <input type="text" name="licenseNumber" value="<%=customer.getLicenseNumber()%>" ><br>
    <input type="tel" name="phone" value="<%=customer.getPhone()%>"><br>
    <input type="email" name="email" value="<%=customer.getEmail()%>"><br>
    <input type="submit" value="Change Customer">
</form>

</body>
</html>
