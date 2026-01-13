<%@ page import="am.example.rentcar.model.Car" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Car</title>
</head>
<body>
<% List<Car> carList = (List<Car>) request.getAttribute("car"); %>
<h1>Cars list</h1>
<a href="/">Back to Rent Car</a><br>
<a href="/addCar">Add Car</a>

<table  border="1px solid" style="border-collapse: collapse">
    <tr>
        <th>Id</th>
        <th>Brand</th>
        <th>Model</th>
        <th>Year</th>
        <th>Daily Rate</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <% for (Car car : carList) {%>
    <tr>
        <td><%=car.getId()%></td>
        <td><%=car.getBrand()%></td>
        <td><%=car.getModel()%></td>
        <td><%=car.getYear()%></td>
        <td><%=car.getDailyRate()%></td>
        <td><%=car.getStatus()%></td>
        <td><a href="/deleteCar?id=<%=car.getId()%>">delete</a>  |  <a href="/changeCar?id=<%=car.getId()%>">Edit</a> </td>
    </tr>
    <%}%>
</table>



</body>
</html>
