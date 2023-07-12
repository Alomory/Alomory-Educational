<%-- 
    Document   : SampleInsertionRecord
    Created on : May 23, 2023, 11:52:25 AM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lab 6 - Task 1 - Sample Insertion records into MySQL through JSP's page</h1>

        <%
            int result = 0;
            Connection myCon = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                out.println("Step 1: MySql Driver is loaded ...!");

        %>
        <br>
        <%            //Step 2
            String mySql = "jdbc:mysql://localhost:3306/csflab6";
            myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/csflab6", "root", "admin");
            out.println("Step 2: Database is Connected");


        %>
        <br>
        <%            //Step 3 
            out.println("Step 3:Prepared statement created");
            String sInsertQry = "INSERT INTO FirstTable VALUE (?)";

            PreparedStatement myPS = myCon.prepareStatement(sInsertQry);

        %>
        <br>
        <%            //Step 4: 
            out.println("Step 4:Perform insertion to the record. ");
            String name = "Welcome to access MySQL database with JSP ...!";
            myPS.setString(1, name);
            result = myPS.executeUpdate();
            if (result > 0) {
        %>
        <br>
        <%
                    out.println("Step 5: Close the database connection...");
                    out.println(" ");
                    out.println("Database Connection is closed ...!");
                    out.print("<p>" + "The record : (" + name + ") is "
                            + "successfully created...!");
                }
            } catch (Exception e) {
                out.println(e);
            }
            myCon.close();

        %>
    </body>
</html>
