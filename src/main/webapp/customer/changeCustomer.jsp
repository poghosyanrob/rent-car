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
    <input type="hidden" required name="id" value="<%=customer.getId()%>">
    <input type="text" required name="name" value="<%=customer.getName()%>"><br>
    <input type="text" required name="surname" value="<%=customer.getSurname()%>"><br>
    <input type="text" required name="licenseNumber" value="<%=customer.getLicenseNumber()%>" ><br>
    <input type="tel" required name="phone" value="<%=customer.getPhone()%>"><br>
    <input type="email" required name="email" value="<%=customer.getEmail()%>"><br>
    <input type="submit" value="Change Customer">
</form>

</body>
</html>
