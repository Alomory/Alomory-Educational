<%-- 
    Document   : editUser
    Created on : Jun 1, 2023, 3:57:14 AM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
        <style>
            body{
                background-color: azure;
            }
            input[type=text],input[type=password], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=submit] {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            div {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
                align-items: center;
            }
            .container{
                width: 50%;
                margin: auto;
                margin-top: 20vh;


            }
        </style>
    </head>
    <body>
        <div class="container">
            <div>
        <h3>Updating User Profile:</h3>
        <hr>
        <form name="frmEditUser" action="UserController" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>User ID :</td>
                        <td><input type="text" name="userid" readonly="readonly" 
                                   value="<c:out value="${user.userid}" />" size="25"></td>
                    </tr>
                    <tr>
                        <td>First Name :</td>
                        <td><input type="text" name="firstName"  
                                   value="<c:out value="${user.firstname}" />" size="40"></td>
                    </tr>
                    <tr>
                        <td>Last Name :</td>
                        <td><input type="text" name="lastName"  
                                   value="<c:out value="${user.lastname}" />" size="40"></td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="action" value="edit" ></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" name="submit" value="Submit" >
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        </div></div>
    </body>
</html>
