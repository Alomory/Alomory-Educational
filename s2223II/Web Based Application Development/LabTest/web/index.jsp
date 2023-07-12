<%-- 
    Document   : index.jsp
    Created on : Jun 6, 2023, 10:44:39 AM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Boat Service</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            li{
                list-style: none;
            }
        </style>
    </head>
    <body>
        <div style="text-align: center">
        <h1 style="background-color: darkgray">What do u want to do??</h1><br>
        
        <ul>
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register.jsp">Register</a></li>
            <li><a href="reserveServlet?action=list">All Reservation List</a></li>
            <li><a href="reserveServlet?action=new">Book Reservation</a></li>
        </ul>
        <div>
    </body>
</html>
