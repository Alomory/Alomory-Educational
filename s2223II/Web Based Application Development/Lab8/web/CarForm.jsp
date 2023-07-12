<%-- 
    Document   : CarForm
    Created on : Jun 7, 2023, 2:39:42 AM
    Author     : Omar Alomory(S63955)
--%>

<%@ page errorPage="error.jsp" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Management Application</title>
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
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <form action="CarServlet" method="post">
                        <c:if test="${car != null}">                     
                            <input type="hidden" name="action" value="update">
                        </c:if>
                        <c:if test="${car == null}">
                            <input type="hidden" name="action" value="insert">
                        </c:if>
                        <h2>
                            <c:if test="${car != null}">
                                Edit Car
                            </c:if>
                            <c:if test="${car == null}">
                                Add new Car
                            </c:if>
                        </h2>
                        <c:if test="${car != null}">
                            <input type="hidden" name="carid" value="<c:out value="${car.carId}"/>">
                        </c:if>
                        <fieldset class="form-group">
                            <label>Brand Name</label><input type="text" value="<c:out value='${car.brand}'/>"
                                                               class="form-control" name="brand" required>
                        </fieldset>
                        <fieldset class="form-group">
                            <label>Car Model</label><input type="text" value="<c:out value='${car.model}'/>"
                                                                class="form-control" name="model">
                        </fieldset>

                        <fieldset>
                            <label>Car Cylinders</label>
                            <input type="text" value="<c:out value="${car.cyclinder}"/>"
                                   class="form-control" readonly>
                            <input list="cylinders" id="cylinder" class="form-control" name="cyclinder" required>
                            <datalist id="cylinders">
                                <option value="3 Cylinders">
                                <option value="4 Cylinders">
                                <option value="6 Cylinders">
                                <option value="8 Cylinders">
                            </datalist>
                        </fieldset>
                        <fieldset class="form-group">
                            <label>Price(MYR)</label><input type="number" value="<c:out value='${car.price}'/>"
                                                                class="form-control" name="price">
                        </fieldset>
                        <button type="submit" class="btn btn-success">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
