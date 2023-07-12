<%-- 
    Document   : jspParameter
    Created on : May 14, 2023, 7:04:54 PM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Using JSP Standard Action (Include and Param)</title>
    </head>
    <body>
        <h1>Using jsp:include and jsp:param to display information on JSP page</h1>
        <%
            String sCode = "CSM 3023";
            String sSubject = "Web Programming";
            String sCredit = "3(2+1)";
        %>    
        
        <!-- Call subjectInfo.jsp page & passing course information 
            to respective parameters... -->
        <jsp:include page="subjectInfo.jsp" flush="true">
            <jsp:param name="code" value="<%=sCode%>" />
            <jsp:param name="subject" value="<%=sSubject%>" />
            <jsp:param name="credit" value="<%=sCredit%>" />
        </jsp:include>
    </body>
</html>
