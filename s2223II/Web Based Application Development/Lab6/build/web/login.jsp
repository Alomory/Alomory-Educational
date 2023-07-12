<%-- 
    Document   : login
    Created on : May 29, 2023, 12:28:52 AM
    Author     : Omar Alomory(S63955)
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
            <div class="form">
                <fieldset>
                    <legend>Register</legend>
                    <!-- fix this by printing out invalid if user input wrong username or password -->
                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                    %>
                    <p style="color: red;"><%= errorMessage%></p>
                    <%
                        }
                    %>  

                    <form action="doLogin.jsp" method="get">
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td><label for="username">Username:</label></td>
                                    <td><input name="username" id="username" type="text" 
                                               placeholder="E.g. OmarAlomory" required maxlength="15" value="${param.username}"></td>
                                </tr>
                                <tr>
                                    <td><label for="password">Password:</label></td>
                                    <td><input name="password" id="password" 
                                               maxlength="10" type="password" placeholder="Your Passowrd" required></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="formBtn">
                            <input type="submit" value="Login">
                            <input type="reset" value="Cancel">
                        </div>
                        <div class="link"><a href="insertUser.html">Register Now</a></div>

                    </form>
                </fieldset>
            </div>
        </div>
    </body>
</html>
