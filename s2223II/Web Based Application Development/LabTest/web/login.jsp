<%-- 
    Document   : login
    Created on : Jun 6, 2023, 10:46:07 AM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <style>
            label{
               width: 150px;
               float: left; 
            }
            
        </style>
    </head>
    <body><header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: turquoise">
                <div>
                    <a href="index.jsp" class="navbar-brand"> Welcome </a>
                </div>

                 
            </nav>
        </header>
                <div style="background-color: orange" class="container col-md-5">
                <div class="card">
                <div class="card-body">
                <form action="userServlet" method="post">
                <fieldset class="form-group">
                    <input type="hidden" name="action" value="/login"> 
                <label>Id</label> 
                <input type="text" value="<c:out value='${user.id}' />" class="form-control" name="id" placeholder="Ali@gmail,com" required>
                </fieldset>
                 <fieldset class="form-group">
                <label>IC</label> 
                <input type="text" value="<c:out value='${user.ic}' />" class="form-control" name="ic" placeholder="999">
                <input type="hidden" name="action" value="/login">
                <input type="submit" value="Login">
                </fieldset>
                </form></div></div></div>
        </body>
</html>
