<%-- 
    Document   : processStudent
    Created on : May 28, 2023, 7:31:28 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<%@page errorPage="errorStudent.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab6 - Task 3 - Process Student Page</title>
        <style>
            .theStyle{
                color: blue;
                font-family: cursive;
            }
        </style>
    </head>
    <body>
        <h1>Process Student Page</h1>
        <jsp:useBean id="myStudent" class="lab6.com.java.Student" scope="request" />
        <jsp:setProperty name="myStudent" property="*" />
        
        <%
            int result;
            Connection myConnection = null;
           
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Step 1: MySQL driver loaded...!");

                String myURL = "jdbc:mysql://localhost/csflab6";
                myConnection = DriverManager.getConnection(myURL, "root", "admin");
                System.out.println("Step 2: Database is connected...!");

                String sInsertQry = "INSERT INTO students (stuno, stuname, stuprogram) VALUES(?,?,?)";
                PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);
                System.out.println("Step 3: Prepared Statement created!");
                System.out.println("Step 4: Perform insertion of record!");
                myPS.setString(1, myStudent.getStuno());
                myPS.setString(2, myStudent.getStuname());
                myPS.setString(3, myStudent.getStuprogram());
                
                result = myPS.executeUpdate();
                if (result > 0) {
                    System.out.println("\tRecord Successfully added into Student's table...!");
                    out.print("<div class= 'theStyle'><p>" + "Record with Student No " + myStudent.getStuno() + " successfully created ..!" + "</p>");
                    out.print("<p>" + "Details of record are: " + "</p>");
                    out.print("<p>Student No : " + myStudent.getStuno() + "</p>");
                    out.print("<p>Name : " + myStudent.getStuname() + "</p>");
                    out.print("<p>Program : " + myStudent.getStuprogram() + "</p></div>");
                }

                System.out.println("Step 5: Close database connection ...!");
                myConnection.close();
                System.out.println("Database Connection is closed ...!");

            
        %>
    </body>
</html>
