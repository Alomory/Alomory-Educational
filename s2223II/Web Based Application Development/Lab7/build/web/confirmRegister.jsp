<%-- 
    Document   : confirmRegister
    Created on : Jun 1, 2023, 10:05:35 PM
    Author     : Omar Alomory(S63955)
--%>
<%@ page import="java.util.UUID" %>

<%
    String studentId = request.getParameter("studentId");
    String name = request.getParameter("name");

    // Generate a unique confirmation ID
    String confirmationId = UUID.randomUUID().toString();

    // Store the student details in the session
    session.setAttribute("studentId", studentId);
    session.setAttribute("name", name);
    session.setAttribute("confirmationId", confirmationId);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation Page</title>
        <style>
            body{
                background-color: azure;
            }
            input[type=text],input[type=password], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=submit] , input[type=reset]{
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }
            input[type="reset"]{
                background-color: #ff0000;
                color: white;
                
            }
            input[type="reset"]:hover{
                background-color: darkred;   
            }

            div {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
                align-items: center;
            }
            .container{
                width: 50%;
                margin: auto;
                margin-top: 20vh;


            }
        </style>
    </head>
    <body>
        <div class="container"><div>
                <h1>Confirmation Page</h1>
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Student ID:</td>
                            <td><%= studentId%></td>
                        </tr>
                        <tr>
                            <td>Name:</td>
                            <td><%= name%></td>
                        </tr>
                        <tr>
                            <td>
                                <form action="notificationRegister.jsp" method="POST">
                                    <input type="hidden" name="confirmationId" value="<%= confirmationId%>">
                                    <input type="submit" value="Proceed">
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div></div>
    </body>
</html>