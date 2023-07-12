<%-- 
    Document   : Exercise2
    Created on : Apr 9, 2023, 4:47:11 PM
    Author     : komar
--%>

<%@page import="java.util.Formatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.util.Scanner" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exercise 2</title>
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
        <h1> Sales.csv</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Customer</th>
                    <th>Cust. Type</th>
                    <th>Purchase</th>
                    <th>Discount</th>
                </tr>
            </thead>
            <tbody>              
        <%
        String name = "C:\\Users\\komar\\OneDrive - umt.edu.my\\Semester 4\\CSM3023 WEB BASED APPLICATION DEVELOPMENT by FAIZAH BINTI APLOP APLOP\\Lab solution\\Lab 1\\LabExercises\\src\\java\\MyFiles\\Sales.csv";
//        Scanner sc = new Scanner(new File(name));
//        sc.useDelimiter(";");
//        int count = 0;
//        while (sc.hasNext())  //returns a boolean value  
//        {  
//            out.print(sc.next()+"<br>");  //find and returns the next complete token from this scanner \
//            count++;
//        }   
//        out.print("<br><br> count is "+ count);
//        sc.close();    

        // create csvReader object passing
        // file reader as a parameter
        String line = "";
        String splitBy = ";";
        
        try {
          //parsing a CSV file into BufferedReader class constructor  
          BufferedReader br = new BufferedReader(new FileReader(name));
          while ((line = br.readLine()) != null)
          //returns a Boolean value  
          {
            String[] customers = line.split(splitBy); 
            Formatter  format = new Formatter();
            double discount = 0;
            //use comma as separator  
            
            if(customers[1].contains("Cash")){
               
                discount = Double.parseDouble(customers[2])*0.1;
            }else{
            discount = 0;
            }
            
            out.print("<tr><td>" + customers[0] + "</td><td>" 
                                + customers[1] + "</td><td>" 
                                + customers[2] +"</td><td>"
            +format.format("%.2f", discount)+"</td></tr>" );
          }
        }
        catch(IOException e) {
          e.printStackTrace();
        }
    
        %>
                    </tbody>
        </table>
    </body>
</html>
