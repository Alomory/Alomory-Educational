<%-- 
    Document   : index
    Created on : Jun 5, 2023, 4:25:23 AM
    Author     : Omar Alomory(S63955)
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" 
              crossorigin="anonymous">
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <title>User Management Application</title>
    </head>
    <body>
        <h1>Application MVC system for Employee Management</h1>
        <ul>
            <li><a href="http://localhost:8080/Lab8/EmployeeServlet?action=list">All Employee List</a></li>
            <li><a href="http://localhost:8080/Lab8/EmployeeServlet?action=new">Add a new Employee</a></li>
            <li><a href="http://localhost:8080/Lab8/EmployeeServlet?action=list">Edit Employee</a></li>
        </ul>
        <hr>
        <h1>List of Cars Prices System(<i>Lab Exercise</i>)</h1>
        <ul>
            <li><a href="http://localhost:8080/Lab8/CarServlet?action=list">All Car Prices</a></li>
            <li><a href="http://localhost:8080/Lab8/CarServlet?action=new">Add a new Car</a></li>
            <li><a href="#" id="showLink">Edit Car Information</a></li>
        </ul>
        <div class="container">
        <div id="myDiv" style="display: none"">
        </div>
            </div>
        <script>
$(document).ready(function() {
    // Show the div and load content from servlet when clicking the "Show Div" link
    $("#showLink").click(function(event) {
        event.preventDefault(); // Prevent the default link behavior

        // Make an AJAX request to fetch data from the servlet
        $.ajax({
            url: "CarServlet?action=indexList", // Replace with the actual URL of your servlet
            method: "GET",
            success: function(response) {
                // Update the content of the div with the data received from the servlet
                $("#myDiv").html(response);

                // Slide down the div
                $("#myDiv").slideToggle();
            },
            error: function() {
                console.log("Error occurred while fetching data from servlet.");
            }
        });
    });

    // Hide the div when clicking the "Hide Div" link
    $("#hideLink").click(function(event) {
        event.preventDefault(); // Prevent the default link behavior

        // Slide up the div
        $("#myDiv").sli();
    });
});
        </script>
    </body>
</html>
