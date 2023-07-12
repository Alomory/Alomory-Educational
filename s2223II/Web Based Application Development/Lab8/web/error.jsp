<%-- 
    Document   : error
    Created on : Jun 5, 2023, 3:18:55 AM
    Author     : Omar Alomory(S63955)
--%>
<%@ page isErrorPage="true" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
    <center>
        <h1>Error</h1>
        <h2><%=exception.getMessage()%><br></h2>
    </center>
</body>
</html>
