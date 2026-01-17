<%@ page import="am.example.rentcar.model.statusEnam.Status" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Car</title>
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
<div class="card form-card">
    <a href="/" class="back-link">← Home</a>
    <h1>Add Cars</h1>
    <a href="/car" class="back-link">← Back to Car List</a>

<form action="/addCar" method="post">
    <input type="text" required name="brand" placeholder="Brand"><br>
    <input type="text" required name="model" placeholder="Model"><br>
    <input type="number" required name="year" placeholder="Year"><br>
    <input type="number" required name="dailyRate" placeholder="Dail Rate"><br>
    <div class="radio-group">
        <input type="radio" required checked name="status" id="free" value="<%=Status.FREE%>">
        <label for="free">Free</label>
        <input type="radio" name="status" id="rental" value="<%=Status.RENTAL%>">
        <label for="rental">Rental</label>
    </div>
    <input type="submit" value="Add Car" class="btn">
</form>
</div>
</body>
</html>
