<%-- 
    Document   : processUser
    Created on : May 20, 2023, 11:50:16 PM
    Author     : Omar Alomory(S63955)
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retrieve user information using jstl</title>
    </head>
    <body>
        <h2>Retrieve info using :c param & display it using c:out</h2>
        <br>
        <div style="color: #e348e4; font-family: arial; font-weight: bolder">
            <p>First Name : <c:out value="${param.firstname}"/></p>
            <p>Surname : <c:out value="${param.surname}"/></p>
            <p>Gender : <c:out value="${param.gender}"/></p>
            <p>Type of User : <c:out value="${param.userType}"/></p>

            <p>Prefer Language : 
                <c:set var="lan" value="${paramValues.language}" />
                <c:set var="lanLegnth" value="${fn:length(lan)}" />
                <c:if test="${lanLegnth > 1}">
                <ul><c:forEach var="temp" items="${paramValues.language}">
                        <li><c:out value="${temp}" /></li>
                    </c:forEach></ul> 
                </c:if>
                <c:if test="${lanLegnth == 1}">
                    <c:out value="${param.language}"/>
                </c:if>
        </div>
    </body>
</html>
