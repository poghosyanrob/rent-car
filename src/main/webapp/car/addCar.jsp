<%@ page import="am.example.rentcar.statusEnam.Status" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Car</title>
</head>
<body>
<h1>Add Cars</h1>
<a href="/">Back to Rent Car</a><br>
<a href="/car">Car</a>

<form action="/addCar" method="post">
    <input type="text" name="brand" placeholder="Brand"><br>
    <input type="text" name="model" placeholder="Model"><br>
    <input type="number" name="year" placeholder="Year"><br>
    <input type="number" name="dailyRate" placeholder="Dail Rate"><br>
    <input type="radio" required checked name="status" id="free" value="<%=Status.FREE%>">
    <label for="free">Free</label>
    <input type="radio" name="status" id="rental" value="<%=Status.RENTAL%>">
    <label for="rental">Rental</label>
    <input type="submit" value="Add Car">
</form>
</body>
</html>
