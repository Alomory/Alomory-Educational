<%-- 
    Document   : processAuthor
    Created on : May 26, 2023, 8:32:05 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Author Page</title>
        <style>
            .theStyle{
                color: blue;
                font-family: cursive;
            }
        </style>
    </head>
    <body>
        <h1>Lab 6 - Task 2 - Perform creating and retrieving record via JSP page</h1>
        <jsp:useBean id="myAuthor" class="lab6.com.java.Author" scope="request" />
        <jsp:setProperty name="myAuthor" property="*" />

        <%
            Connection myConnection = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String myURL = "jdbc:mysql://localhost/csflab6";
                
                myConnection = DriverManager.getConnection(myURL,"root", "admin");
                
                String sInsertQry = "INSERT INTO Author (authno, name, address, city, state , zip) VALUES"
                        + "(?,?,?,?,?,?)";
                PreparedStatement myPS = myConnection.prepareStatement(sInsertQry);
                myPS.setString(1, myAuthor.getAuthno());
                myPS.setString(2, myAuthor.getName());
                myPS.setString(3, myAuthor.getAddress());
                myPS.setString(4, myAuthor.getCity());
                myPS.setString(5, myAuthor.getState());
                myPS.setString(6, myAuthor.getZip());
                
                int result = myPS.executeUpdate();
                if(result > 0){
                System.out.println("\tRecord Successfully added into Author table...!");
                out.print("<div class= 'theStyle'><p>"+"Record with Author No "+myAuthor.getAuthno()+" successfully created ..!"+"</p>");
                out.print("<p>"+"Details of record are: "+"</p>");
                out.print("<p>Address : "+myAuthor.getAddress()+"</p>");
                out.print("<p>City : "+myAuthor.getCity()+"</p>");
                out.print("<p>State : "+myAuthor.getState()+"</p>");
                out.print("<p>Zip : "+myAuthor.getZip()+"</p></div>");
            }
            System.out.println("Step 5: Close database connection ...!");
            myConnection.close();
            System.out.println("Database Connection is closed ...!");
            } catch (SQLException e) {
                out.print("Error: " + e);
            }
            
            
            
            
            
            
        %>
    </body>
</html>
