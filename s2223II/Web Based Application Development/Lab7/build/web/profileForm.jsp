<%-- 
    Document   : profileForm
    Created on : Jun 1, 2023, 9:41:50 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile From</title>
        <style>
            body{
                background-color: azure;
            }
            table{
                width: 100%;
                
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
        <div class="container"><div>
    <h1>User Profile Registration</h1>
    <form action="profileServlet" method="POST">
        <table border="0">
            <tbody>
                <tr>
                    <td><label for="username">Username:</label></td>
                    <td><input type="text" id="username" name="username" maxlength="15" required></td>
                </tr>
                <tr>
                    <td><label for="icno">IC No:</label></td>
                    <td><input type="text" id="icno" name="icno" maxlength="15"></td>
                </tr>
                <tr>
                    <td><label for="firstname">First Name:</label></td>
                    <td><input type="text" id="firstname" name="firstname" maxlength="50" required></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Submit"><input type="reset" value="Cancel">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
            </div></div>
</body>
</html>
