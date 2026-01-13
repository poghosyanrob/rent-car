<%@ page import="am.example.rentcar.model.Rental" %>
<%@ page import="am.example.rentcar.model.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="am.example.rentcar.model.Customer" %>
<%@ page import="am.example.rentcar.statusEnam.Status" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Rental</title>
</head>
<body>
<% Rental rental = (Rental) request.getAttribute("rental");%>
<% List<Car> carList = (List<Car>) request.getAttribute("car");%>
<% List<Customer> customerList = (List<Customer>) request.getAttribute("customer"); %>

<h1>Change Rental data</h1>
<a href="/">Back to Rent car</a>
<a href="/rental">Back to rental</a>

<form action="/changeRental" method="post">
    <input type="hidden" name="id" value="<%=rental.getId()%>">
    <select name="car_id">
        <% for (Car car : carList) {%>
            <% if(car.getStatus() == Status.RENTAL) {%>
                <% if(car.getId() == rental.getCar().getId()) {%>
                    <option disabled selected value="<%=car.getId()%>"><%=car.getBrand()%></option>
                <%}else{%>
                <option disabled value="<%=car.getId()%>"><%=car.getBrand()%></option>
                <%}%>
            <%}else{%>
                <% if(car.getId() == rental.getCar().getId()) {%>
                    <option selected value="<%=car.getId()%>"><%=car.getBrand()%></option>
                <%}else{%>
                    <option  value="<%=car.getId()%>"><%=car.getBrand()%></option>
                <%}%>
            <%}%>
        <%}%>
    </select><br>
    <select name="customer_id">
        <% for (Customer customer : customerList) {%>
            <% if(customer.getId() == rental.getCustomer().getId()) {%>
                <option selected value="<%=customer.getId()%>"><%=customer.getName()%></option>
            <%}else{%>
                <option value="<%=customer.getId()%>"><%=customer.getName()%></option>
            <%}%>
        <%}%>
    </select><br>
    <input type="date" name="start_date" value="<%=rental.getStartDate()%>"><br>
    <input type="date" name="end_date" value="<%=rental.getEndDate()%>"><br>
    <input type="submit" value="Change Rental">
</form>

</body>
</html>
