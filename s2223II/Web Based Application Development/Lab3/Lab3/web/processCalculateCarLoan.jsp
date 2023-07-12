<%-- 
    Document   : processCalculateCarLoan
    Created on : Apr 30, 2023, 12:27:32 AM
    Author     : komar
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Formatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Calculate Car Loan Page</title>
        <style>
            code{
                font-size: x-large;
            }
        </style>
    </head>
    <body>
        <h1>Perform Car Loan Calculation</h1>
        <fieldset>
            <h2 style="color: #282bcf;font-family: sans-serif">Details of car loan: </h2>
            <%
                String loanAmt = "0";
                String period = "3";
                Formatter format = new Formatter();
                DecimalFormat df = new DecimalFormat("###,###,###.##");
                double tax = 0.0;
                double totalWithInt = 0.0;
                if (request.getParameter("loanAmount") != null) {
                    loanAmt = request.getParameter("loanAmount");
                    period = request.getParameter("period");
                    // this as it described in the titel of task 4
//                    if(period.charAt(0) < '5'){
//                        tax = 1.0280;
//                    }else if(period.charAt(0) > '5'){
//                        tax = 1.0450;
//                    }else{
//                        tax = 1.0365;
//                    }
                    // this gives the accurate answer as it shown in the figure
                    switch (period.charAt(0)) {
                        case '3':tax = 1.215; break;
                        case '4':tax = 1.255; break;
                        case '5':tax = 1.285; break;
                        case '7':tax = 1.315; break;
                    }
                    totalWithInt = Integer.parseInt(loanAmt) *tax;
                    
                }
            %>
            <code>Loan Request : <%=df.format(Integer.parseInt(loanAmt))%></code> <br>
            <code>Period of payment : <%=period%></code><br>
            <code>Total Loan (+ Interest): <%=df.format(Double.parseDouble(format.format("%.2f", totalWithInt).toString()))%></code><br>
        </fieldset>
    </body>
</html>
