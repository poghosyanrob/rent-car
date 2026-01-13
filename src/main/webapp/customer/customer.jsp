<%@ page import="java.util.List" %>
<%@ page import="am.example.rentcar.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
</head>
<body>
<% List<Customer> customerList = (List<Customer>) request.getAttribute("customer"); %>


<h1>Customers list</h1>
<a href="/">Back to Rent Car</a><br>
<a href="/addCustomer">Add Customer</a>

<table  border="1px solid" style="border-collapse: collapse">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Surname</th>
        <th>License Number</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Action</th>
    </tr>
    <% for (Customer customer : customerList) {%>
    <tr>
        <td><%=customer.getId()%></td>
        <td><%=customer.getName()%></td>
        <td><%=customer.getSurname()%></td>
        <td><%=customer.getLicenseNumber()%></td>
        <td><%=customer.getPhone()%></td>
        <td><%=customer.getEmail()%></td>
        <td><a href="/deleteCustomer?id=<%=customer.getId()%>">delete</a>  |  <a href="/changeCustomer?id=<%=customer.getId()%>">Edit</a> </td>
    </tr>
    <%}%>
</table>

</body>
</html>
