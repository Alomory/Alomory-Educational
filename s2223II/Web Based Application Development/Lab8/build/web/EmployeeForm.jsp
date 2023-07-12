<%-- 
    Document   : EmployeeForm
    Created on : Jun 5, 2023, 3:23:58 AM
    Author     : Omar Alomory(S63955)
--%>
<%@ page errorPage="error.jsp" %>  
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
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <form action="EmployeeServlet" method="post">
                        <c:if test="${employee != null}">                     
                            <input type="hidden" name="action" value="update">
                        </c:if>
                        <c:if test="${employee == null}">
                            <input type="hidden" name="action" value="insert">
                        </c:if>
                        <h2>
                            <c:if test="${employee != null}">
                                Edit Employee
                            </c:if>
                            <c:if test="${employee == null}">
                                Add new Employee
                            </c:if>
                        </h2>
                        <c:if test="${employee != null}">
                            <input type="hidden" name="id" value="<c:out value="${employee.id}"/>">
                        </c:if>
                        <fieldset class="form-group">
                            <label>Employee Name</label><input type="text" value="<c:out value='${employee.name}'/>"
                                                               class="form-control" name="name" required>
                        </fieldset>
                        <fieldset class="form-group">
                            <label>Employee Email</label><input type="text" value="<c:out value='${employee.email}'/>"
                                                                class="form-control" name="email">
                        </fieldset>

                        <fieldset>
                            <label>Employee Position</label>
                            <input type="text" value="<c:out value="${employee.position}"/>"
                                   class="form-control" readonly>
                            <input list="positionList" id="position" class="form-control" name="position">
                            <datalist id="positionList">
                                <option value="Manager">
                                <option value="Head of Dept">
                                <option value="Supervisor">
                                <option value="Director">
                            </datalist>
                        </fieldset>
                        <button type="submit" class="btn btn-success">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
