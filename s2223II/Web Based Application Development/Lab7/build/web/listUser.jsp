<%-- 
    Document   : listUser
    Created on : Jun 1, 2023, 3:31:50 AM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Lists</title>
        <style>
             body{
                width: 50%;
                margin: auto;
                background-color: azure;
                font-family: arial, sans-serif;
                text-align: center;
                margin-top: 30vh;
            }

            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
            th{
                background-color: #f5d882;
            }
            td{
                background-color: #f8f1df;
            }
            td, th {
                border: 1px solid #dddddd;
                text-align: center;
                padding: 8px;
            }
        </style>
    </head>
    <body>
        <h1>List of Users..!</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>User Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th colspan="2">Action</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="user" >
                <tr>
                    <td><c:out value="${user.userid}"/></td>
                    <td><c:out value="${user.firstname}"/></td>
                    <td><c:out value="${user.lastname}"/></td>
                    <td><a href='UserController?action=edit&userId=<c:out value="${user.userid}"/>'>Update</a></td>
                    <td><a href="UserController?action=delete&userId=<c:out value="${user.userid}"/>">Delete</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <p><a href="UserController?action=insert">Add User</a></p>
    </body>
</html>
