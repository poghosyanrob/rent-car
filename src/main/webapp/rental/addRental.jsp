<%@ page import="java.util.List" %>
<%@ page import="am.example.rentcar.model.Car" %>
<%@ page import="am.example.rentcar.model.Customer" %>
<%@ page import="am.example.rentcar.statusEnam.Status" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Rental</title>
</head>
<body>
<% List<Car> carList = (List<Car>) request.getAttribute("car");%>
<% List<Customer> customerList = (List<Customer>) request.getAttribute("customer"); %>

<h1>Add Rental</h1>
<a href="/">Back to Rent Car</a><br>
<a href="/rental">Back to Rental</a>

<form action="/addRental" method="post">
    <select name="car_id">
        <% for (Car car : carList) {%>
            <% if(car.getStatus() == Status.RENTAL) {%>
                <option disabled value="<%=car.getId()%>"><%=car.getBrand()%></option>
            <%}else{%>
                <option value="<%=car.getId()%>"><%=car.getBrand()%></option>
            <%}%>
        <%}%>
    </select><br>
    <select name="customer_id">
        <% for (Customer customer : customerList) {%>
            <option value="<%=customer.getId()%>"><%=customer.getName()%></option>
        <%}%>
    </select><br>
    <input type="date" name="start_date" placeholder="start-day"><br>
    <input type="date" name="end_date" placeholder="end-day"><br>
    <input type="submit" value="Add Rental">
</form>

</body>
</html>
