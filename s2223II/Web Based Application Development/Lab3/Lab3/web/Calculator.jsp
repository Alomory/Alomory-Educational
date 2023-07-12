<%-- 
    Document   : Calculator
    Created on : Apr 29, 2023, 2:56:12 AM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculator Page</title>
    </head>
    <body bgcolor="#f0ffff" text="black">
    <center>
        <h2>Basic Calculator program in jsp</h2>
         <%
                String num1 = "0", num2 = "0";
                int result = 0;
                String op ="+";
                
                char opchar = op.charAt(0);
                if(request.getParameter("op")!= null){
                    op = request.getParameter("op");
                    opchar = op.charAt(0);
                    
                    num1 = request.getParameter("operand1");
                    num2 = request.getParameter("operand2");
                    
                    switch(opchar){
                    case '0': result = Integer.parseInt(num1) + Integer.parseInt(num2);
                    break;
                    case '1': result = Integer.parseInt(num1) - Integer.parseInt(num2);
                    break;
                    case '2': result = Integer.parseInt(num1) * Integer.parseInt(num2);
                    break;
                    case '3': result = Integer.parseInt(num1) / Integer.parseInt(num2);
                    break;
                    case '4': result = Integer.parseInt(num1) % Integer.parseInt(num2);
                    break;
                    }
                    }
                %>
        <form method="get" name="f1">
            <input type="text" size="10" name="operand1" value= <%=num1%> />
            <select name="op" size="1">
                <option value="0">+</option>
                <option value="1">-</option>
                <option value="2">*</option>
                <option value="3">/</option>
                <option value="4">%</option>
            </select>
            <input type="text" size="10" name="operand2" value= <%=num2%> />
            <p>
               
                <br/><br/><br/><br/>
                <input type="submit" value="Calculate"/>
                Result = <%= result + "" %>
            </p>
        </form>
    </center>
    </body>
</html>
