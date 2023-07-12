<%-- 
    Document   : registerTraining
    Created on : May 19, 2023, 8:39:45 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Use JavaBeans in JavaScriptlet(Request)</title>
        <style>
            table {
                border-collapse: collapse;
                table-layout: fixed;
                max-width: 100%;
            }
             input[type="text"],input[type="number"], table, select{
               width: 100%;
            }


        </style>
    </head>
    <body>
        <h1><i>Register IT Training</i></h1>
        <form action="processTraining.jsp" method="post">
            <fieldset>
                <legend>Training Registration</legend>
                <table>                   
                    <tr>
                        <td><label for="icNo">IC No</label></td>
                        <td><input name="icNo" id="icNo" type="text"></td>
                    </tr>
                    <tr>
                        <td><label for="name">Name</label></td>
                        <td><input type="text" name="name" id="name"></td>
                    </tr>
                    <tr>
                        <td><label for="trainType">Type of Training</label></td>
                        <td>
                            <select name="trainType">
                                <option value="1">C++ training</option>
                                <option value="2">Java for beginner</option>
                                <option value="3">HTML5</option>
                                <option value="4">Java EEE</option>
                                <option value="5">Android Programming</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="paxNo">No of Pax</label></td>
                        <td><input type="number" name="paxNo" ></td>
                    </tr>
                    <tr>
                        <td><label for="stuCheck">Student</label></td>
                        <td>
                            <input type="radio" name="stuCheck" value="1"> Yes
                            <input type="radio" name="stuCheck" value="0"> No
                        </td>
                    </tr>
                </table>
                <br>
                <input type="submit" value="Submit"> <input type="reset" value="Cancel">
            </fieldset>
        </form>
        <%@include file="copyRight.jsp" %>
    </body>
</html>
