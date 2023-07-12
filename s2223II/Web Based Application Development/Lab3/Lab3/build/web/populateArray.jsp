<%-- 
    Document   : populateArray
    Created on : Apr 29, 2023, 6:16:38 PM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Populate Array Page</title>
        <style>
            body{
                width: 50%;
                margin: auto;
                background-color: azure;
                font-family: arial, sans-serif;
                text-align: center;
                margin-top: 30vh;
            }

            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
            th{
                background-color: #f5d882;
            }
            td{
                background-color: #f8f1df;
            }
            td, th {
                border: 1px solid #dddddd;
                text-align: center;
                padding: 8px;
            }
        </style>
    </head>
    <body>
        <h1>Read Java array and populate it into HTML's table</h1>
        <%
            String myArray[][] = {
                {"Slesman", "Jan", "Feb", "Mac"},
                {"2500", "2100", "2200"},
                {"2000", "1900", "2400"},
                {"1800", "2000", "2450"}
            };
        %>
        <table border="1">
            <%
                // later we can convert the string into int if we want to process the data.
                for (int i = 0; i < myArray.length; i++) {
                    if (i > 0) {
                        out.print("<tr><td>Salesman " + (i + 1) + "</td>");
                    } else {
                        out.print("<tr>");
                    }
                    for (int r = 0; r < myArray[i].length; r++) {
                        if (i == 0) {
                            out.print("<th>" + myArray[i][r] + "</th>");
                        } else {
                            out.print("<td>" + myArray[i][r] + "</td>");
                        }

                    }
                    out.print("</tr>");
                }
            %>
        </table>

    </body>
</html>
