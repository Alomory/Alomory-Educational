<%-- 
    Document   : processBMI
    Created on : May 14, 2023, 10:29:45 PM
    Author     : komar
--%>

<%@page import="java.util.Formatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BMI Calculation</title>
        <style>
            body{
                background-color: lightcyan;
                font-family: cursive;
                box-sizing: border-box;
            }
            .container >* {
                background-color: #dddddd; 
                padding: 10px;
                border-radius: 5px; 
            }
            .container{
                background-color: #e7e9eb;
                width: fit-content;
                margin: auto;
                margin-top: 50px;
                font-size: large;
                padding: 20px;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h1>Body Mass Index (BMI) Calculator</h1>
            <%!
                private double calculateBMI(float weight, float height) {
                    return weight / (Math.pow(height, 2));
                }
            %>

            <%
                //Using JSP Scriptlet...
                float weight = Float.parseFloat(request.getParameter("weight"));
                float height = Float.parseFloat(request.getParameter("height"));

                //Determine BMI status...
                Formatter f = new Formatter();
                String status = new String();
                double bmi = calculateBMI(weight, height);
                status = (height > 3) ? "invalid range, Height in Meter please"
                        : (bmi < 18.5) ? "Underweight"
                                : (bmi >= 18.5 && bmi <= 25) ? "Optimal"
                                        : (bmi > 25) ? "Overweight"
                                                : "No Status";
            %>
            <div style="margin: auto;">
                <h4>Your Weight : <%= weight%> kg</h4>
                <h4>Your Height : <%= height%> m</h4>
                <h4>Your BMI : <%= f.format("%.2f", bmi)%></h4>
                <h4>Weight Status : <%= status%></h4> 
            </div>
        </div>
    </body>
</html>
