<%-- 
    Document   : studentRegister
    Created on : Jun 1, 2023, 10:01:04 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Registration</title>
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
    <div class="container"><div>
    <h1>Student Registration</h1>
    <form action="confirmRegister.jsp" method="POST">
        <label for="studentId">Student ID:</label>
        <input type="text" id="studentId" name="studentId" required><br><br>
        
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        
        <input type="submit" value="Submit">
    </form>
        </div></div>
</body>
</html>
