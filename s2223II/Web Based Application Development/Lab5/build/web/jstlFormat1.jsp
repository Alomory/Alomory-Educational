<%-- 
    Document   : jstlFormat1
    Created on : May 21, 2023, 1:14:46 AM
    Author     : Omar Alomory(S63955)
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formatting using JSTL</title>
    </head>
    <body>
        <h1>Using JSTL formatting for formatting</h1>
        <div style="font-family: arial; font-size: 1rem; color: #d04362">
            <c:set var="total" value="2880.4638"/>
            <p>Number to be formatted is <c:out value="${total}"/></p>
            <p>Formatting number as currency with currency code : <fmt:formatNumber type="currency" currencyCode="MYR" value="${total}"/></p>
            <p>Formatting number to the nearest 2 integer digit : <fmt:formatNumber type="number" maxIntegerDigits="2" value="${total}"/></p>
            <p>Formatting number by grouping : <fmt:formatNumber type="number" groupingUsed="true" value="${total}"/></p>
            <p>Formatting number to the nearest 3 decimal places : <fmt:formatNumber type="number" maxFractionDigits="3" value="${total}"/></p>
            <p>Formatting number with percentage symbol : <fmt:formatNumber type="percent" value="${total}"/></p>
        </div>
    </body>
</html>
