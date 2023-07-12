<%-- 
    Document   : errorStudent
    Created on : May 28, 2023, 8:56:38 PM
    Author     : Omar Alomory(S63955)
--%>
<%@ page isErrorPage="true" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="errorFrm" action="insertStudent.jsp" method="post">
            <h2>Lab6 - Task 3 - Error is found:</h2>
            <p>When inserting record ...!</p>
            <p><jsp:expression> exception.getMessage() </jsp:expression></p>
            <br>
        </form>
    </body>
</html>
