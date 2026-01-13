<%@ page import="java.util.List" %>
<%@ page import="am.example.rentcar.model.Rental" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rental</title>
</head>
<body>
<% List<Rental> rentalList = (List<Rental>) request.getAttribute("rental");%>

<h1>Car rental</h1>
<a href="/"> Back to Rent Car</a><br>
<a href="/addRental">Add Rental</a>

<table  border="1px solid" style="border-collapse: collapse">
    <tr>
        <th>Id</th>
        <th>Car</th>
        <th>Customer</th>
        <th>Start rental</th>
        <th>End rental</th>
        <th>Total cost</th>
        <th>Status</th>
        <th>Action</th>
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
        <td><a href="/deleteRental?id=<%=rental.getId()%>">delete</a>  |  <a href="/changeRental?id=<%=rental.getId()%>">Change</a> </td>
    </tr>
    <%}%>
</table>



</body>
</html>
