<%-- 
    Document   : GetAttribute
    Created on : Apr 9, 2023, 12:51:11 AM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>implicit JSP</title>
    </head>
    <body>
        <% 
            String name = (String)session.getAttribute("somethingElse");
            out.print("User Name is: "+name);
        %>
    </body>
</html>
