<%-- 
    Document   : AttributeIsSet
    Created on : Apr 9, 2023, 12:43:23 AM
    Author     : Omar Alomory(s63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>implicit JSP</title>
    </head>
    <body>
        <% session.setAttribute("user", "Fouad Abdulameer");%>
        <a href="GetAttribute.jsp">Click here to get user name</a>
        <br>
        <a href="MathematicsOperations.jsp">Result of mathematic operations</a>
    </body>
</html>
