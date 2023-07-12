<%-- 
    Document   : insertStudent
    Created on : May 28, 2023, 6:47:09 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task 3</title>
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
            <form action="processStudent.jsp" method="post">
                <table border="0">  
                    <tbody>
                        <tr>
                            <td><label for="stuno">Student No:</label></td>
                            <td><input name="stuno" type="text"  placeholder="E.g. UKXXXXX" required></td>
                        </tr>
                        <tr>
                            <td><label for="stuname">Name:</label></td>
                            <td><input name="stuname" type="text" placeholder="Enter your name" required></td>
                        </tr>
                        <tr>
                            <td><label for="stuprogram">Program</label></td>
                            <td>
                                <select name="stuprogram">
                                    <option value="BSc. Soft.Eng.">BSc. Soft.Eng.</option>
                                    <option value="BSc. with IM">BSc. with IM</option>
                                    <option value="BSc. in Networking">BSc. in Networking</option>
                                    <option value="BSc. in Robotics">BSc. in Robotics</option>
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
