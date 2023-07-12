<%-- 
    Document   : Message1
    Created on : May 19, 2023, 7:47:46 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page info="Using JSP Standard Action to Call JavaBeans" %>
<%@page import="java.util.Date, com.Message" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Scriptlet</title>
        <style>
            p{
                color: blueviolet;
                font-family: cursive;
                font-size: 1.5rem;
            }
        </style>
    </head>
    <body>
        <h1>Using JSP Standard Action to call JavaBeans</h1>
        <%
        Message objMsg = new Message();
        
        objMsg.setMsg("Welcome to CSF3107 course….!");
        out.print("<p>"+objMsg.getMsg()+"</p>");
        out.print("<p>Current date is: "+new Date()+"</p>");
        
        %>
        
    </body>
</html>
