<%@ page import="am.example.rentcar.model.Car" %>
<%@ page import="am.example.rentcar.model.statusEnam.Status" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Car</title>
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
<div class="card form-card">
<%Car car = (Car) request.getAttribute("car");%>
    <a href="/" class="back-link">← Home</a>
<h1>Change Car data</h1>
<a href="/car">Back to Car</a>

<form action="/changeCar" method="post">
    <input type="hidden" required name="id" value="<%=car.getId()%>">
    <input type="text" required name="brand" value="<%=car.getBrand()%>"><br>
    <input type="text" required name="model" value="<%=car.getModel()%>"><br>
    <input type="number" required name="year" value="<%=car.getYear()%>"><br>
    <input type="number" required name="dailyRate" value="<%=car.getDailyRate()%>"><br>
    <div class="radio-group">
    <%if(car.getStatus() == Status.FREE){%>
        <input type="radio" required checked name="status" id="free" value="<%=Status.FREE%>">
        <label for="free">Free</label>
        <input type="radio" name="status" id="rental" value="<%=Status.RENTAL%>">
        <label for="rental">Rental</label>
    <%}else{%>
        <input type="radio" required name="status" id="free" value="<%=Status.FREE%>">
        <label for="free">Free</label>
        <input type="radio" checked name="status" id="rental" value="<%=Status.RENTAL%>">
        <label for="rental">Rental</label>
    <%}%>
    </div>
    <input type="submit" value="Change Car" class="btn">
</form>
</div>
</body>
</html>
