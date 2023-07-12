<%-- 
    Document   : ProcessStock
    Created on : May 21, 2023, 1:41:42 PM
    Author     : Omar Alomory(S63955)
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Displayed information</title>
        <style>
            p{
                font-family: cursive;
                color: blue;
            }
            span{
                color: red;
            }
        </style>
    </head>
    <body>
        <h1>Amount need to be payed</h1>
        <jsp:useBean id="userInfo" class="com.StockCalculator"></jsp:useBean>  
        <jsp:setProperty property="shares" name="userInfo" param="stock"/> 
        <jsp:setProperty property="pricePerShare" name="userInfo" param="sharePrice"/>  
        <jsp:setProperty property="commissionRate" name="userInfo" param="commission"/>

        <b>Record Entered by User:</b><br>  
        <p>The share of Stock: <span><jsp:getProperty property="shares" name="userInfo"/></span></p>
        <p>The price per Share: <span><jsp:getProperty property="pricePerShare" name="userInfo"/></span></p>  
        <p>The Stock broker Commission: <span><jsp:getProperty property="commissionRate" name="userInfo" />%</span></p>
        <hr>
        <b>Output:</b><br>
        <b><p>
                The amount paid for the stock alone without the commission: <span><fmt:formatNumber 
                        minFractionDigits="2" 
                        maxFractionDigits="2" 
                        type="number" value="${userInfo.amountWithoutCommission}"/></span>
            </p></b>
        <b><p>
                The amount of the commission : <span><fmt:formatNumber 
                        minFractionDigits="2" 
                        maxFractionDigits="2" 
                        type="number" value="${userInfo.commissionAmount}"/>
                    (<fmt:formatNumber type="percent" value="${userInfo.commissionRate/100}"/>)
                </span>
            </p></b>
            <b><p>
                    Total + <i>${userInfo.commissionRate}</i>% :<span><fmt:formatNumber 
                            minFractionDigits="2" 
                            maxFractionDigits="2" 
                            type="number" value="${userInfo.totalAmountPaid}"/></span>
            </p></b>                
        <hr>
    </body>
</html>
