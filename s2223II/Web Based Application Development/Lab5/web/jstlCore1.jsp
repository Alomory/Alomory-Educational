<%-- 
    Document   : jstlCore1
    Created on : May 20, 2023, 10:40:59 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSTL tag library</title>
    </head>
    <body>
        <h1>Use JSTL’s features</h1>
        <c:set var="message" value= "Welcome to CSF3107 – Web Programming courses..!" />
        <p style="color: #cf3987; font-family: monospace; font-size: 1rem;"><c:out value="${message}"/></p>
    </body>
</html>
