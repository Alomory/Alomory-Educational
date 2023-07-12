<%-- 
    Document   : notificationRegister
    Created on : Jun 1, 2023, 10:10:59 PM
    Author     : Omar Alomory(S63955)
--%>
<%
    String studentId = (String) session.getAttribute("studentId");
    String name = (String) session.getAttribute("name");
    String confirmationId = (String) session.getAttribute("confirmationId");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification Page</title>
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
                <h1>Notification Page</h1>
            <table border="0">
                <tbody>
                    <tr>
                        <td>Confirmation ID:</td>
                        <td><%= confirmationId %></td>
                    </tr>
                    <tr>
                        <td>Student ID:</td>
                        <td><%= studentId %></td>
                    </tr>
                    <tr>
                        <td>Name:</td>
                        <td><%= name %></td>
                    </tr>
                </tbody>
            </table>    
                    <p style="color: darkred; size: 1.5rem">Notification sent to end user!</p>
        </div></div>
</body>
</html>
