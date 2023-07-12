<%-- 
    Document   : fmt_formatDate
    Created on : May 21, 2023, 1:58:01 AM
    Author     : Omar Alomory(S63955)
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSTL tag library</title>
    </head>
    <body>
        <h1>Use fmt:formatDate features</h1>
        <div >
            <c:set var="now" value="<%= new java.util.Date()%>" />
            <p>
                Time (fmt:formatDate type="time"):
                <strong>
                    <fmt:formatDate type="time" value="${now}" />
                </strong>
            </p>
            <p>
                Date (fmt:formatDate type="date"):
                <strong>
                    <fmt:formatDate type="date" value="${now}" />
                </strong>
            </p>
            <p>
                Date, Time (fmt:formatDate type="both"):
                <strong>
                    <fmt:formatDate type="both" value="${now}" />
                </strong>
            </p>
            <p>
                Date, Time Short (fmt:formatDate type="both" dateStyle="short"):
                <strong>
                    <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${now}" />
                </strong>
            </p>
            <p>
                Date, Time Medium (fmt:formatDate type="both" dateStyle="medium" timeStyle="medium"):
                <strong>
                    <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${now}" />
                </strong>
            </p>
            <p>
                Date, Time Long (fmt:formatDate type="both" dateStyle="long" timeStyle="long"):
                <strong>
                    <fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${now}" />
                </strong>
            </p>
            <p>
                Date, Time (dd-MM-yyyy HH:mm:ss):
                <strong>
                    <fmt:formatDate pattern="dd-MM-yyy HH:mm:ss" value="${now}" />
                </strong>
            </p>
            <fmt:formatDate pattern="dd-MM-yyy HH:mm" value="${now}" var="nowString"/>
            <p>
                Now String (dd-MM-yyyy HH:mm):
                <strong>
                    <c:out value="${nowString}"/>
                </strong>
            </p>
        </div>
    </body>
</html>
