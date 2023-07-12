<%-- 
    Document   : calculate
    Created on : May 21, 2023, 2:44:16 AM
    Author     : Omar Alomory(S63955)
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Circle Calculation Result</title>
    </head>
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
    <body>
        <fieldset>
            <legend><h2>Circle Calculation Result</h2></legend>
            <table border="0">
                <thead>
                    <tr>
                        <c:set var="radius" value="${param.radius}" />
                        <c:set var="area" value="${Math.PI * radius * radius}" />
                        <c:set var="perimeter" value="${2 * Math.PI * radius}" />
                        <th colspan="2">Result</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><p>Radius: </p></td>
                        <td><p>${radius}</p></td>
                    </tr>
                    <tr>
                        <td><p>Area: </p></td>
                        <td><p><fmt:formatNumber value="${area}" type="number" pattern="###.###" /></p></td>
                    </tr>
                    <tr>
                        <td><p>Perimeter: </p></td>
                        <td><p><fmt:formatNumber value="${perimeter}" type="number" pattern="###.###" /></p></td>
                    </tr>
                </tbody>
            </table>
        </fieldset>





        
        
    </body>
</html>

