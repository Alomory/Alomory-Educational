<%-- 
    Document   : queryStudent
    Created on : May 28, 2023, 11:05:46 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page errorPage="errorStudent.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 6 - Task 4</title>
        <style>
            table{
                border-collapse: collapse;
            }
            th,td{
                border: 1px solid #999;
                padding: 0.5rem;
                text-align: left;
            }
            th{
                background-color: gold;
            }
        </style>
    </head>
    <body>
        <h1>Lab 6 - Task 4 : Retrieving record vis JSP page</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ISBNNo</th>
                    <th>Author</th>
                    <th>Title</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Step 1: MySQL driver loaded...!");

                    String myURL = "jdbc:mysql://localhost/csflab6";
                    Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
                    System.out.println("Step 2: Database is connected...!");

                    String myQuery = "SELECT * FROM student";
                    Statement myStatement = myConnection.createStatement();
                    ResultSet myResultSet = myStatement.executeQuery(myQuery);
                    System.out.println("Step 3: Prepared Statement created!");
                    System.out.println("Step 4: Getting the values from database!");
                    while (myResultSet.next()) {
                        out.print("<tr>");
                        out.print("<td width=\"20%\">" + myResultSet.getString(1) + "</td>");
                        out.print("<td width=\"40%\">" + myResultSet.getString(2) + "</td>");
                        out.print("<td width=\"40%\">" + myResultSet.getString(3) + "</td>");
                        out.print("</tr>");
                    }
                    System.out.println("Step 5: Close database connection ...!");
                    myConnection.close();
                    System.out.println("Database Connection is closed ...!");
                %>
            </tbody>
        </table>

    </body>
</html>
