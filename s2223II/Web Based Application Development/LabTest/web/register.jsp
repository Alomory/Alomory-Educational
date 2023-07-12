<%-- 
    Document   : regester
    Created on : Jun 6, 2023, 10:47:44 AM
    Author     : Omar Alomory(S63955)
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>  
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: turquoise">
                <div>
                    <a href="index.jsp" class="navbar-brand"> Register new user </a>
                </div>

            
            </nav>
        </header>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:if test="${user != null}">
                        <form action="update" method="post">
                        </c:if>

                        <c:if test="${user == null}">
                            <form action="userServlet" method="post">
                                <input type="hidden" name="action" value="/insert">
                            </c:if>

                            <h2>
                                <c:if test="${user != null}">
                                    Edit Register
                                </c:if>

                                <c:if test="${user == null}">
                                    Add New Register
                                </c:if>
                            </h2>
                                
                            <fieldset class="form-group">
                                <label>Id</label> 
                                <input type="text" value="<c:out value='${user.id}' />" class="form-control" name="id" placeholder="Ali@gmail,com" required>
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Name</label> 
                                <input type="text" value="<c:out value='${user.name}' />" class="form-control" name="name" placeholder="Ali" required>
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Gender</label> 
                                <input type="text" value="<c:out value='${user.gender}' />" class="form-control" name="gender" placeholder="Female">
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Contact</label>
                                <input type="text" value="<c:out value='${user.contact}' />" class="form-control" name="contact" placeholder="0182934199">
                            </fieldset>

                            <fieldset class="form-group">
                                <label>IC</label> 
                                <input type="text" value="<c:out value='${user.ic}' />" class="form-control" name="ic" placeholder="999999999999">
                            </fieldset>
                            
                            <fieldset class="form-group">
                                <label>Age</label> 
                                <input type="text" value="<c:out value='${user.age}' />" class="form-control" name="age" placeholder="22">
                            </fieldset>
                            
                            <fieldset class="form-group">
                                <label>Address</label> 
                                <input type="text" value="<c:out value='${user.address}' />" class="form-control" name="address" placeholder="No12,Tmn Desa...">
                            </fieldset>
                            
                            <fieldset class="form-group">
                                <label>Email</label> 
                                <input type="text" value="<c:out value='${user.email}' />" class="form-control" name="email" placeholder="Ali@gmail,com">
                            </fieldset>

                            <button type="submit" class="btn btn-success">Save</button>
                        </form>
                </div>
            </div>
        </div>
    </body>
</html>

