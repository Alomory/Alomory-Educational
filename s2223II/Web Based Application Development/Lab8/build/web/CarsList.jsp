<%-- 
    Document   : CarsList
    Created on : Jun 7, 2023, 2:10:20 AM
    Author     : Omar Alomory(S63955)
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Management System</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" 
              crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: darkred">
                <div>
                    <a href="index.jsp" class="navbar-brand">Car Management App</a>
                </div>
                <ul class="navbar-nav">
                    <li><a href="CarServlet?action=list" class="nav-link">Car List</a></li>

                </ul>
            </nav>
        </header>
        <br>
        <div class="row">
            <div class="container">
                <h3 class="text-center">List of Cars</h3>
                <hr>
                <div class="container text-letf">
                    <a href="CarServlet?action=new" class="btn btn-success">Add new Car</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Car ID</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Cylinders</th>
                            <th>Price</th>  
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="car" items="${listCars}">
                            <tr>
                                <td>
                                    <c:out value="${car.carId}" />
                                </td>
                                <td>
                                    <c:out value="${car.brand}" />
                                </td>
                                <td>
                                    <c:out value="${car.model}" />
                                </td>
                                <td>
                                    <c:out value="${car.cyclinder}" />
                                </td>
                                <td>
                                    <fmt:formatNumber value = "${car.price}" type = "currency" currencySymbol="RM"/>
                                </td>
                                <td>
                                    <a href="CarServlet?action=edit&id=<c:out value='${car.carId}'/>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="CarServlet?action=delete&id=<c:out value='${car.carId}'/>">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
