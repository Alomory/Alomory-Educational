<%-- 
    Document   : reserveList
    Created on : Jun 6, 2023, 10:49:07 AM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Boat Reservation Application</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: turquoise">
            <div>
                <a href="index.jsp" class="navbar-brand"> Boat Reservation Application </a>
            </div>

            <ul class="navbar-nav">
                <li><a href="reserveServlet?action=list" class="nav-link">Refresh</a></li>
            </ul>   
        </nav>
    </header>
    <br>

    <div class="row">

        <div class="container">
            <h3 class="text-center">List of Reservation</h3>
            <hr>
            <div class="container text-left">
                <a href="reserveServlet?action=new" class="btn btn-success">Add new Reservation</a>
            </div>
            <br>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Reservation Code</th>
                        <th>Id</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Boat Size</th>
                        <th>Boat Id</th>
                        <th>No of Participant</th>
                        <th>No of Boat</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="reserve" items="${listReserve}">
                        <tr>
                            <td>
                                <c:out value="${reserve.code}" />
                            </td>

                            <td>
                                <c:out value="${reserve.userid}" />
                            </td>

                            <td>
                                <c:out value="${reserve.startdate}" />
                            </td>

                            <td>
                                <c:out value="${reserve.enddate}" />
                            </td>
                            
                            <td>
                                <c:out value="${reserve.size}" />
                            </td>
                            
                            <td>
                                <c:out value="${reserve.boatid}" />
                            </td>
                            
                            <td>
                                <c:out value="${reserve.people}" />
                            </td>

                            <td>
                                <c:out value="${reserve.numboat}" />
                            </td>

                            <td> <a href="reserveServlet?action=edit&id=<c:out value='${reserve.code}'/>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="reserveServlet?action=delete&id=<c:out value='${reserve.code}'/>">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
