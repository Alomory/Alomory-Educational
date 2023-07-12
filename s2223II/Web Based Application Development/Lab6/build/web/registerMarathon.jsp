<%-- 
    Document   : registerMarathon
    Created on : May 28, 2023, 11:39:19 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <style>
            td{
                padding-right: 5vw;
            }
        </style>
    </head>
    <body>
        <h1>Lab6 - Task 3 - Perform creating and retrieving record via JSP page</h1>
        <fieldset>
            <legend>Student Registration</legend>
            <form action="processMarathon.jsp" method="post">
                <table border="0">  
                    <tbody>
                        <tr>
                            <td><label for="icno">IC No:</label></td>
                            <td><input name="icno" type="text"  placeholder="E.g. 921110-10-2514" required></td>
                        </tr>
                        <tr>
                            <td><label for="name">Name:</label></td>
                            <td><input name="name" type="text" placeholder="Enter your name" required></td>
                        </tr>
                        <tr>
                            <td><label for="category">Program</label></td>
                            <td>
                                <select name="category">
                                    <option value="5 KM">5 KM</option>
                                    <option value="7 KM">7 KM</option>
                                    <option value="10 KM">10 KM</option>
                                </select>
                                
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <input type="submit" value="Submit">
                <input type="reset" value="Cancel">
            </form>
        </fieldset>
        <footer>
            <%@include file="copyRight.jsp"  %>
        </footer>
    </body>
</html>
