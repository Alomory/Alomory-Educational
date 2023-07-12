<%-- 
    Document   : forwardInfo
    Created on : May 14, 2023, 7:28:19 PM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>&lt;Forwarded_Action Example in JSP&gt;</title>
    </head>
    <body>

        <% String name = request.getParameter("U_Name"); %>
        <% String Email = request.getParameter("Email"); %>
        <% String Nationality = request.getParameter("Nationality"); %>
        <% String Background = request.getParameter("Background"); %>
        <% if (name != null) {%>
        <b><br/><br/><h2 align="center">

                <%=name%><br/>
                <%=Email%><br/>
                <%=Nationality%><br/>
                <%=Background%><br/><br/>

                <% out.print("Today is:" + java.util.Calendar.getInstance().getTime());%>
            </h2></b><br/>
            <%}%>
    </body>
</html>
