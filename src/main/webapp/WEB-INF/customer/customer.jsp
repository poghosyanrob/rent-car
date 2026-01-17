<%@ page import="java.util.List" %>
<%@ page import="am.example.rentcar.model.Customer" %>
<%@ page import="am.example.rentcar.model.User" %>
<%@ page import="am.example.rentcar.model.statusEnam.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
<% List<Customer> customerList = (List<Customer>) request.getAttribute("customer"); %>
<%User user = (User) session.getAttribute("user");%>

<div class="card">

    <a href="/" class="back-link">← Home</a>
    <h1>Customers list</h1>
    <a href="/addCustomer" class="btn" style="margin-bottom: 20px;">+ Add New Customer</a>

<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Surname</th>
        <th>License Number</th>
        <th>Phone</th>
        <th>Email</th>
        <% if(user.getRole() == UserRole.ADMIN){%>
        <th>Action</th>
        <%}%>
    </tr>
    <% for (Customer customer : customerList) {%>
    <tr>
        <td><%=customer.getId()%></td>
        <td><%=customer.getName()%></td>
        <td><%=customer.getSurname()%></td>
        <td><%=customer.getLicenseNumber()%></td>
        <td><%=customer.getPhone()%></td>
        <td><%=customer.getEmail()%></td>
        <% if(user.getRole() == UserRole.ADMIN){%>
        <td><a href="/deleteCustomer?id=<%=customer.getId()%>">delete</a>  |  <a href="/changeCustomer?id=<%=customer.getId()%>">Edit</a> </td>
        <%}%>
    </tr>
    <%}%>
</table>
</div>
</body>
</html>
