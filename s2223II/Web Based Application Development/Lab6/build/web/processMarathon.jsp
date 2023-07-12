<%-- 
    Document   : processMarathon
    Created on : May 28, 2023, 11:56:51 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, lab6.com.java.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Marathon Page</title>
        <style>
            .theStyle{
                color: red;
                font-family: cursive;
            }
        </style>
    </head>
    <body>
        <h1>processing Marathon ...!</h1>
        <jsp:useBean id="myMarthon" class="lab6.com.java.Marathon" scope="request"/>
        <jsp:setProperty name="myMarthon" property="*" />

        <%
            int result;
            Database myDB = new Database();

            MarathonDAO object1 = new MarathonDAO();

            result = object1.addDetails(myMarthon);

            if (result > 0) {
                System.out.println("\tRecord Successfully added into Marathon's table...!");
                out.print("<div class= 'theStyle'><p>" + "Record with IC No " + myMarthon.getIcno() + " successfully created ..!" + "</p>");
                out.print("<p>" + "Details of record are: " + "</p>");
                out.print("<p>IC No : " + myMarthon.getIcno() + "</p>");
                out.print("<p>Name : " + myMarthon.getName() + "</p>");
                out.print("<p>Category : " + myMarthon.getCategory() + "</p></div>");
            }
            System.out.println("Step 5: Close database connection ...!");
            myDB.closeConnection();
            System.out.println("Database Connection is closed ...!");

        %>
        <%@include file="copyRight.jsp" %>
    </body>
</html>
