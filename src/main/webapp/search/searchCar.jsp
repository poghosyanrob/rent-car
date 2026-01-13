<%@ page import="am.example.rentcar.model.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="am.example.rentcar.statusEnam.Status" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Cars</title>
</head>
<body>
<% List<Car> carList = (List<Car>) request.getAttribute("car");%>

<h1>That Cars which are free</h1>
<a href="/">Back to Rent Car</a><br>

<table  border="1px solid" style="border-collapse: collapse">
    <tr>
        <th>Id</th>
        <th>Brand</th>
        <th>Model</th>
        <th>Year</th>
        <th>Daily Rate</th>
    </tr>
    <% for (Car car : carList) {%>
    <%if(car.getStatus() == Status.FREE){%>
        <tr>
            <td><%=car.getId()%></td>
            <td><%=car.getBrand()%></td>
            <td><%=car.getModel()%></td>
            <td><%=car.getYear()%></td>
            <td><%=car.getDailyRate()%></td>
        </tr>
    <%}%>
    <%}%>
</table>

</body>
</html>
