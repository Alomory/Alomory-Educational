<%-- 
    Document   : main
    Created on : May 29, 2023, 12:29:39 AM
    Author     : Omar Alomory(S63955)
--%>

<%
if(session.getAttribute("username") == null){
    response.sendRedirect("insertUser.html");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="lab6.com.java.UserDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome <%=new UserDAO().getFullUserName((String)session.getAttribute("username")
                ,(String) session.getAttribute("password"))%></h1>
        <a href="Logout">Logout</a>
    </body>
</html>
