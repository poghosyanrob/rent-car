<%@ page import="am.example.rentcar.model.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="am.example.rentcar.model.User" %>
<%@ page import="am.example.rentcar.model.statusEnam.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
<% List<Car> carList = (List<Car>) request.getAttribute("car"); %>
<%User user = (User) session.getAttribute("user");%>
<div class="card">
    <a href="/" class="back-link">← Home</a>
    <h1>Cars list</h1>
    <a href="/addCar" class="btn" style="margin-bottom: 20px;">+ Add New Car</a>

    <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Brand</th>
            <th>Model</th>
            <th>Year</th>
            <th>Daily Rate</th>
            <th>Status</th>
            <% if(user.getRole() == UserRole.ADMIN){%><th>Action</th><%}%>
        </tr>
        </thead>
        <tbody>
        <% for (Car car : carList) {%>
        <tr>
            <td><%=car.getId()%></td>
            <td><strong><%=car.getBrand()%></strong></td>
            <td><%=car.getModel()%></td>
            <td><%=car.getYear()%></td>
            <td>$<%=car.getDailyRate()%></td>
            <td><span class="<%= car.getStatus().toString().equals("FREE") ? "status-free" : "status-rental" %>">
                    <%=car.getStatus()%>
                </span></td>
            <% if(user.getRole() == UserRole.ADMIN){%>
            <td>
                <a href="/changeCar?id=<%=car.getId()%>">Edit</a> |
                <a href="/deleteCar?id=<%=car.getId()%>" style="color:red">Delete</a>
            </td>
            <%}%>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>
</body>
</html>
