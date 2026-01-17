<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Customer</title>
    <link href="../css/style.css" rel="stylesheet">
</head>
<body>
<div class="card form-card">

    <a href="/" class="back-link">← Home</a>
    <h1>Add Customers</h1>
    <a href="/customer" class="back-link">← Back to Customer List</a>

<form action="/addCustomer" method="post">
    <input type="text" required name="name" placeholder="Name"><br>
    <input type="text" required name="surname" placeholder="Surname"><br>
    <input type="text" required name="licenseNumber" placeholder="License Number"><br>
    <input type="tel" required name="phone" placeholder="Phone"><br>
    <input type="email"  required name="email" placeholder="Email"><br>
    <input type="submit" value="Add Customer" class="btn">
</form>
</div>
</body>
</html>
