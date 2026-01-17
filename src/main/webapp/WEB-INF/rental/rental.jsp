<%@ page import="java.util.List" %>
<%@ page import="am.example.rentcar.model.Rental" %>
<%@ page import="am.example.rentcar.model.User" %>
<%@ page import="am.example.rentcar.model.statusEnam.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rental</title>
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
<% List<Rental> rentalList = (List<Rental>) request.getAttribute("rental");%>
<%User user = (User) session.getAttribute("user");%>
<div class="card">
    <a href="/" class="back-link">← Home</a>
    <h1>Car rental</h1>
    <a href="/addRental" class="btn" style="margin-bottom: 20px;">+ Add New Rental</a>


<table>
    <tr>
        <th>Id</th>
        <th>Car</th>
        <th>Customer</th>
        <th>Start rental</th>
        <th>End rental</th>
        <th>Total cost</th>
        <th>Status</th>
        <% if(user.getRole() == UserRole.ADMIN){%>
        <th>Action</th>
        <%}%>
    </tr>
    <% for (Rental rental : rentalList) {%>
    <tr>
        <td><%=rental.getId()%></td>
        <td><%=rental.getCar().getBrand()%></td>
        <td><%=rental.getCustomer().getName()%></td>
        <td><%=rental.getStartDate()%></td>
        <td><%=rental.getEndDate()%></td>
        <td><%=rental.getTotalCost()%></td>
        <td><%=rental.getStatus()%></td>
        <% if(user.getRole() == UserRole.ADMIN){%>
        <td><a href="/deleteRental?id=<%=rental.getId()%>">delete</a>  |  <a href="/changeRental?id=<%=rental.getId()%>">Edit</a> </td>
        <%}%>
    </tr>
    <%}%>
</table>

</div>

</body>
</html>
