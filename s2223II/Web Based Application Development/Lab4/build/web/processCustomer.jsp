<%-- 
    Document   : processCustomer
    Created on : May 2, 2023, 11:27:17 AM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process Customer Page</title>
    </head>
    <body>
        <%
            final int price = 10;
            //Using JSP Scriptlet...
            String cust_no1 = request.getParameter("customer-code");
            int quantity1 = Integer.parseInt(request.getParameter("quantity"));
            String cust_typel = request.getParameter("customer-type");
            //Determine customer..
            if (cust_typel.equals("1") && quantity1 > 100) {
                out.print("You're entitle" + "10%"); %> <br> <%
                    out.print("Total amount is RM" + quantity1 * price * 0.9
                    );
                } else if (cust_typel.equals("2") && quantity1 > 100) {
                    out.print("You're entitle " + "25%"); %> <br> <%
                        out.print("Total amount is RM" + quantity1 * price * 0.75);
                    } else {
                        out.print("You're not entitle discount..!"); %> <br> <%
                out.print("Total amount is RM" + quantity1 * price);
            }
        %>
    </body>
</html>
