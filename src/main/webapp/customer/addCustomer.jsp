<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Customer</title>
</head>
<body>
<h1>Add Customers</h1>
<a href="/">Back to Rent Car</a><br>
<a href="/customer">Back to Customer</a>

<form action="/addCustomer" method="post">
    <input type="text" required name="name" placeholder="Name"><br>
    <input type="text" required name="surname" placeholder="Surname"><br>
    <input type="text" required name="licenseNumber" placeholder="License Number"><br>
    <input type="tel" required name="phone" placeholder="Phone"><br>
    <input type="email"  required name="email" placeholder="Email"><br>
    <input type="submit" value="Add Customer">
</form>

</body>
</html>
