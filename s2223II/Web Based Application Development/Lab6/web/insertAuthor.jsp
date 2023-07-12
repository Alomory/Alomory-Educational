<%-- 
    Document   : insertAuthor
    Created on : May 26, 2023, 8:01:21 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Author Page</title>
        <style>
            td{
                padding-right: 5vw;
            }
        </style>
    </head>
    <body>
        <h1>Lab6 - Task 2 - Perform create and retrieving record vai JSP page</h1>
        <fieldset>
            <legend>Author Registration</legend>
            <form action="processAuthor.jsp" method="post">
                <%--  Display six (6) labels and textfields representing Author No, Name,
                Address, City, State and Zip (in the combo box). --%>
                <table border="0">  
                    <tbody>
                        <tr>
                            <td><label for="authno">Author No:</label></td>
                            <td><input name="authno" type="text" placeholder="E.g. UKXXXXX" required></td>
                        </tr>
                        <tr>
                            <td><label for="name">Name:</label></td>
                            <td><input name="name" type="text" placeholder="Enter your name" required></td>
                        </tr>
                        <tr>
                            <td><label for="address">Address:</label></td>
                            <td><input name="address" type="text" placeholder="Enter your address" required></td>
                        </tr>
                        <tr>
                            <td><label for="city">City:</label></td>
                            <td><input name="city" type="text" placeholder="Enter your city" required></td>
                        </tr>
                        <tr>
                            <td><label for="state">State:</label></td>
                            <td><input name="state" type="text" placeholder="Enter your state" required></td>
                        </tr>
                        <tr>
                            <td><label for="zip">Zip</label></td>
                            <td><input name="zip" type="text" placeholder="Enter your zip" required></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" value="Submit">
                <input type="reset" value="Cancel">
            </form>
        </fieldset>
        <footer>
            <%@include file="copyRight.jsp"  %>
        </footer>
    </body>
</html>
