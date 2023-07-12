<%-- 
    Document   : reserveForm
    Created on : Jun 6, 2023, 10:48:26 AM
    Author     : Omar Alomory(S63955)
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Boat Reservation System</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: turquoise">
                <div>
                    <a href="index.jsp" class="navbar-brand"> Boat Reservation System </a>
                </div>

                <ul class="navbar-nav">
                    <li><a href="reserveServlet?action=list" class="nav-link">Boat</a></li>
                </ul>   
            </nav>
        </header>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:if test="${reserve != null}">
                        <form action="reserveServlet" method="post">
                            <input type="hidden" name="action" value="update">
                        </c:if>

                        <c:if test="${reserve == null}">
                            <form action="reserveServlet" method="post">
                                <input type="hidden" name="action" value="insert">
                            </c:if>

                            <h2>
                                <c:if test="${reserve != null}">
                                    Edit Reservation
                                </c:if>

                                <c:if test="${reserve == null}">
                                    Add New Reservation
                                </c:if>
                            </h2>

                            <c:if test="${reserve != null}">
                                <input type="hidden" name="code" value="<c:out value='${reserve.code}' />" />
                            </c:if>

                            <fieldset class="form-group">
                                <label>Id</label> 
                                <input type="text" value="<c:out value='${reserve.userid}' />" class="form-control" name="userid" placeholder="Ali@gmail.com" required>
                            </fieldset>

                            <fieldset class="form-group">
                                <label>Start Date</label> 
                                <input type="text" value="<c:out value='${reserve.startdate}' />" class="form-control" name="startdate" placeholder="YYYY-MM-DD">
                            </fieldset>
                            
                            <fieldset class="form-group">
                                <label>End Date</label> 
                                <input type="text" value="<c:out value='${reserve.enddate}' />" class="form-control" name="enddate" placeholder="YYYY-MM-DD">
                            </fieldset>
                            
                            <fieldset class="form-group">
                                <label>Boat Size</label>
                                <input type="text" value="<c:out value='${reserve.size}' />"
                                       id="size" class="form-control"   name="size" list="positionList"/>
                                <datalist id="positionList">
                                    <option value="small, 4 people">
                                    <option value="medium, 8 people">
                                    <option value="large, 12 people">
                                </datalist>
                            </fieldset>
                            
                            <fieldset class="form-group">
                                <label>Boat Id</label> 
                                <input type="text" value="<c:out value='${reserve.boatid}' />" class="form-control" name="boatid" placeholder="A56412">
                            </fieldset>
                            
                            <fieldset class="form-group">
                                <label>Operator Name</label> 
                                <input type="text" value="<c:out value='${reserve.operator}' />" class="form-control" name="operator" placeholder="Abu">
                            </fieldset>
                            
                            <fieldset class="form-group">
                                <label>No. of participants</label> 
                                <input type="text" value="<c:out value='${reserve.people}' />" class="form-control" name="people" placeholder="4">
                            </fieldset>
                            
                            <fieldset class="form-group">
                                <label>No. of boat</label> 
                                <input type="text" value="<c:out value='${reserve.numboat}' />" class="form-control" name="numboat" placeholder="4">
                            </fieldset>

                            <button type="submit" class="btn btn-success">Save</button>
                        </form>
                </div>
            </div>
        </div>
    </body>
</html>
