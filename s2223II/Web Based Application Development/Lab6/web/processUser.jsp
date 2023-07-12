<%-- 
    Document   : processUser
    Created on : May 29, 2023, 12:28:40 AM
    Author     : Omar Alomory(S63955)
--%>

<%@page import="lab6.com.java.UserDAO, lab6.com.java.UserDatabaseConnections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process User Registration</title>
    </head>
    <body>
        <jsp:useBean id="newUser" class="lab6.com.java.User" scope="request"/>
        <jsp:setProperty name="newUser" property="*"/>
        
        <%
        UserDatabaseConnections db = new UserDatabaseConnections();
        UserDAO DBInsertion = new UserDAO();
        int result = DBInsertion.Register(newUser);
        if(result > 0){
        System.out.println("\tRecord Successfully added into Userprofile's table...!");
                    out.print("<div class= 'theStyle'><p>" + "Record with Username " + newUser.getUsername()+ " successfully created ..!" + "</p>");
                    out.print("<p>" + "Details of record are: " + "</p>");
                    out.print("<p>Username : " + newUser.getUsername() + "</p>");
                    out.print("<p>Password : " + newUser.getPassword() + "</p>");
                    out.print("<p>Full Name : " + newUser.getFirstname()+" "+newUser.getLastname()+ "</p></div>");
//                    session.setAttribute("firstname", newUser.getFirstname());
//                    session.setAttribute("lastname", newUser.getLastname());
                }
                
                System.out.println("Step 5: Close database connection ...!");
                // close the connection
                System.out.println("Database Connection is closed ...!");
                System.out.println("the result is ="+result);
              
                response.sendRedirect("login.jsp");
                
        
        %>
    </body>
</html>
