<%-- 
    Document   : memberProcessing
    Created on : Apr 29, 2023, 2:12:47 AM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Processing Page</title>
    </head>
    <body>
       <h1>Passing data from main JSP's page to another JSP's page</h1>
       <fieldset>
           <%
           // Define variables...
           String myIC = null;
           String myName = null;
           
           // Use request.getParameter() method to retieve data from main's form...
           myIC = request.getParameter("my_icno");
           myName = request.getParameter("his_name");
           %>
        <!-- Display the output -->
        <p>Thank you for registering in this event...</p>
        <p>This is your details:</p>
        <p>IC No : <%=myIC%></p>
        <p>Name : <%=myName%></p>
       </fieldset>
    </body>
</html>
