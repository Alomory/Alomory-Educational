<%-- 
    Document   : ArrayList
    Created on : Apr 30, 2023, 1:51:32 AM
    Author     : komar
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Use Java ArrayList</title>
        <style>
            p, footer{
                color: blue;
            }
        </style>
    </head>
    <body>
        <h1>Use JSP Page Directive</h1>
        <%
        ArrayList<String> studentList = new ArrayList<>();
        studentList.add("Mohamad Azam");
        studentList.add("Peter Chong");
        studentList.add("Rahimah Mansor");
        studentList.add("Sri Devi");
        studentList.add("Ng Hue Ween");
        studentList.add("S. Nagarajan");
        
        //Display the number of records
        out.print("<p>The number of records in ArrayList are "+studentList.size()+"</p>");
        
        //Populate a list of student!
        for (int i = 0; i < studentList.size(); i++) {
                out.print("<p>Record "+(i+1)+" is "+studentList.get(i) +"</p>");
            }

        %>
    </body>
    <footer>&copy;2023-Mohamad Nor</footer>
</html>
