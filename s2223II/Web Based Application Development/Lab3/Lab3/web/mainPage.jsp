<%-- 
    Document   : mainPage
    Created on : Apr 30, 2023, 2:22:42 AM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            
                <%@include file="headerPage.jsp" %>
                <%@include file="calculateCarLoan.html" %>
            <main>
                <h1>Using JSP's Include directive</h1>
                <br><br>
                <p style="color: red">
                    Java Server Page (JSP) is a technology for controlling the content 
                    or appearance of Web pages through the use of servlets, small programs 
                    that are specified in the Web page and run on the Web server to modify 
                    the Web page before it is sent to the user who requested it.
                </p>
            </main>
           
                <%@include file="footerPage.jsp" %>
        
        </div>
    </body>
</html>
