<%-- 
    Document   : processCurrency
    Created on : May 14, 2023, 6:27:44 PM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Currency JSP Page</title>
    </head>
    <body>
        <%!
            //Define constant...
            final double USD = 3.92;
            final double STG = 5.96;
            final double EURO = 4.47;
            
            //Define method to perform currency exchange...
            private double calculateRate(String currency, int amount) {
                double currencyChange = 0.00f;
                
                if (currency.equals("1"))
                    currencyChange = (double)(amount / USD);
                if (currency.equals("2"))
                    currencyChange = (double)(amount / STG);
                if (currency.equals("3"))
                    currencyChange = (double)(amount / EURO);
                    
                return currencyChange; //return the result...
            }
        %>    
        <h1>Use JSP Declaration tag, JSP Scriplet and JSP Expression in application</h1>
        <div style="color: #8000ff; font-family: Consolas, monaco, monospace;">
            <%
                //Calculate currency...
                int amount1 = Integer.parseInt(request.getParameter("amount"));
                String currency1 = request.getParameter("currency");

                out.print("Amount in Ringgit Malaysia is RM" +amount1 );%> <br> <%
                if (currency1.equals("1")){
                    out.print("Amount in USD is RM");
                } else if (currency1.equals("2")){
                    out.print("Amount in STG is RM");
                } else if (currency1.equals("3")){
                    out.print("Amount in Euro is RM");
                } else {

                }
                out.print(String.format("%.2f", (calculateRate(currency1, amount1))));
            %>
    </body>
</html>
