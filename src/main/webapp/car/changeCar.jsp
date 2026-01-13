<%@ page import="am.example.rentcar.model.Car" %>
<%@ page import="am.example.rentcar.statusEnam.Status" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Car</title>
</head>
<body>
<%Car car = (Car) request.getAttribute("car");%>
<h1>Change Car data</h1>
<a href="/">Back to Rent Car</a><br>
<a href="/car">Back to Car</a>

<form action="/changeCar" method="post">
    <input type="hidden" name="id" value="<%=car.getId()%>">
    <input type="text" name="brand" value="<%=car.getBrand()%>"><br>
    <input type="text" name="model" value="<%=car.getModel()%>"><br>
    <input type="number" name="year" value="<%=car.getYear()%>"><br>
    <input type="number" name="dailyRate" value="<%=car.getDailyRate()%>"><br>
    <%if(car.getStatus() == Status.FREE){%>
        <input type="radio" checked name="status" id="free" value="<%=Status.FREE%>">
        <label for="free">Free</label>
        <input type="radio" name="status" id="rental" value="<%=Status.RENTAL%>">
        <label for="rental">Rental</label>
    <%}else{%>
        <input type="radio" name="status" id="free" value="<%=Status.FREE%>">
        <label for="free">Free</label>
        <input type="radio" checked name="status" id="rental" value="<%=Status.RENTAL%>">
        <label for="rental">Rental</label>
    <%}%>
    <input type="submit" value="Change Car">
</form>
</body>
</html>
