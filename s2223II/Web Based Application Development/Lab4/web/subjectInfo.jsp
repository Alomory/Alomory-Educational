<%-- 
    Document   : subjectInfo
    Created on : May 14, 2023, 7:07:32 PM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Standard Action (Include and Param)</title>
    </head>
    <body>
        <h1>Calling subjectInfo.jsp page</h1>
        <p>Code = <%=request.getParameter("code")%></p>
        <p>Subject = <%=request.getParameter("subject")%></p>
        <p>Credit = <%=request.getParameter("credit")%></p>
    </body>
</html>
