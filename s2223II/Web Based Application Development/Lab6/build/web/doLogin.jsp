<%-- 
    Document   : doLogin
    Created on : May 29, 2023, 12:29:03 AM
    Author     : Omar Alomory(S63955)
--%>
<%@page import="lab6.com.java.UserDAO ,lab6.com.java.UserDatabaseConnections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Login</title>
    </head>
    <body>
        <jsp:useBean id="newUser" class="lab6.com.java.User" scope="request"/>
        <jsp:setProperty name="newUser"  property="username" value="${param.username}"/>
        <jsp:setProperty name="newUser"  property="password" value="${param.password}"/>
        
        
        <%
            
        UserDatabaseConnections db = new UserDatabaseConnections();
        UserDAO DBInsertion = new UserDAO();
       
        boolean result = new UserDAO().login(newUser);
        
        if(result ){
        System.out.println("\tlogged in Successfully ...!");
                    out.print("<div class= 'theStyle'><p>" + "Record with Username " + newUser.getUsername()+ " successfully Logged in ..!" + "</p>");
                    out.print("<p>" + "Details: " + "</p>");
                    out.print("<p>Username : " + newUser.getUsername() + "</p>");
                    out.print("<p>Password : " + newUser.getPassword() + "</p>");
                    out.print("<p>Full Name : " + newUser.getFirstname()+" "+newUser.getLastname()+ "</p></div>");
                    session.setAttribute("username", newUser.getLastname());
                    System.out.println("Step 5: Close database connection ...!");
                    //connection was here
                    System.out.println("Database Connection is closed ...!");
                    session.setAttribute("username", newUser.getUsername());
                    session.setAttribute("password", newUser.getPassword());
                    response.sendRedirect("main.jsp");
                    
                }else{
                request.setAttribute("errorMessage", "invalid username or password");
               RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
               rd.forward(request, response);
            }

                
                
               
                
        %>
    </body>
</html>
