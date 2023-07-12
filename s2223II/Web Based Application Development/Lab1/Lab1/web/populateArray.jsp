<%-- 
    Document   : populateArray
    Created on : Apr 9, 2023, 3:18:01 AM
    Author     : Omar Alomory(s63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java arrays into HTML's table</title>
        <style>
            body{
                width: 50%;
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
        <table>
            <thead>
                <tr>
                    <th>Salesmen</th>
                    <th>Jan</th>
                    <th>Feb</th>
                    <th>Mac</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    //initializing the 2D array
                    int data[][] = {
                        {2500,2100,2200},
                        {2000,1900,2400},
                        {1800,2200,2450}
                    };
                    // populating 2D array in HTML using java for loops and HTML's tags 
                    for(int i = 0; i< data.length; i++){
                    out.print("<tr><td>Salesmen"+(i+1)+"</td>");
                        for(int j = 0; j< data[i].length; j++){
                            out.print("<td>"+data[i][j]+"</td>");
                        }
                        out.print("</tr>");
                    }
                 %>
            </tbody>
        </table>

    </body>
</html>
