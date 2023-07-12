<%-- 
    Document   : fmt_parseDate
    Created on : May 21, 2023, 2:23:27 AM
    Author     : Omar Alomory(S63955)
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Date prase Using JSTL </title>
    </head>
    <body>
        <h1>fmt: parseDate example</h1>
        <div>
            <c:set var="dateTimeString" value="17-11-2015 11:49" />
            <h4>
                dateTimeString: <c:out value="${dateTimeString}" />
            </h4>
                <fmt:parseDate value="${dateTimeString}"
                               type="both" var="parsedDateTime" pattern="dd-MM-yyy HH:mm"/>
                <p>
                    the date time after parsing: 
                    <c:out value="${parsedDateTime}" />
                </p>
                <br> 
                <p>
                    Date only (dd/MM/yyy): 
                    <fmt:formatDate value="${parsedDateTime}" pattern="dd/MM/yyyy" />
                </p>
        </div>
    </body>
</html>
