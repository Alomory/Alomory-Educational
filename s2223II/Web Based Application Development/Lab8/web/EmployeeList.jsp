<%-- 
    Document   : EmployeeForm
    Created on : Jun 5, 2023, 1:48:43 AM
    Author     : Omar Alomory(S63955)
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Management Application</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" 
              crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                <div>
                    <a href="index.jsp" class="navbar-brand">Employee Management App</a>
                </div>
                <ul class="navbar-nav">
                    <li><a href="EmployeeServlet?action=list" class="nav-link">Employee</a></li>

                </ul>
            </nav>
        </header>
        <br>
        <div class="row">
            <div class="container">
                <h3 class="text-center">List of Employees</h3>
                <hr>
                <div class="container text-letf">
                    <a href="EmployeeServlet?action=new" class="btn btn-success">Add new Employee</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Position</th>
                            <th>Action</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="employee" items="${listEmployee}">
                            <tr>
                                <td>
                                    <c:out value="${employee.id}" />
                                </td>
                                <td>
                                    <c:out value="${employee.name}" />
                                </td>
                                <td>
                                    <c:out value="${employee.email}" />
                                </td>
                                <td>
                                    <c:out value="${employee.position}" />
                                </td>
                                <td>
                                    <a href="EmployeeServlet?action=edit&id=<c:out value='${employee.id}'/>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="EmployeeServlet?action=delete&id=<c:out value='${employee.id}'/>">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
