<%-- 
    Document   : user
    Created on : Jun 1, 2023, 3:46:01 AM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Record</title>
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

            input[type=submit] , input[type=reset]{
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
            input[type="reset"]{
                background-color: #ff0000;
                color: white;
                
            }
            input[type="reset"]:hover{
                background-color: darkred;   
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
        <h3><b>New Record</b></h3>
        <hr>
        <form name="frmAddUser" action="UserController" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>User ID :</td>
                        <td><input name="userid" type="text" value="" size="25" required></td>
                    </tr>
                    <tr>
                        <td>First Name :</td>
                        <td><input name="firstName" type="text" value="" size="40" ></td>
                    </tr>
                    <tr>
                        <td>Last Name :</td>
                        <td><input name="lastName" type="text" value="" size="40" ></td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="action" value="insert" ></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" name="submit" value="Submit" >
                            <input type="reset" name="cancel" value="Cancel" >
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
            </div></div>
    </body>
</html>
