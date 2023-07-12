<%-- 
    Document   : processTraining
    Created on : May 20, 2023, 4:14:00 AM
    Author     : Omar Alomory(S63955)
--%>

<%@page import="java.util.Formatter"%>
<%@page import="com.Register"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Use JavaBeans in JavaScriptlet(Process)</title>
        <style>
            .display{
                font-family: cursive;
                font-size: 1.2rem;
                color: blue;
            }
        </style>
    </head>
    <body>
        <h1>Training Registration Acknowledgement</h1>
        <div class="display">
            <%
                com.Register info = new Register();
                info.setIcNo(request.getParameter("icNo"));
                info.setName(request.getParameter("name"));
                info.setNoOfPax(request.getParameter("paxNo"));
                info.setStuCheck(request.getParameter("stuCheck"));
                info.setTraningType(request.getParameter("trainType"));
                Formatter modify = new Formatter();
                                
            %>
            
            <p>IC No : <%=info.getIcNo()%></p>
            <p>Name : <%=info.getName()%></p>
            <p>Type of Training : <%=info.getTraningType()%></p>
            <p>Number of Pax : <%=info.getNoOfPax()%> person/s</p>
            <p>Student : <%=info.isStuCheck()%></p>
            <p>Amount Due : <%=modify.format("%.2f",info.getAmount())%></p>
        </div>
    </body>
</html>
