<%-- 
    Document   : Exercise1
    Created on : Apr 9, 2023, 5:44:22 AM
    Author     : komar
--%>

<%@page import="javax.swing.plaf.basic.BasicHTML"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exercise 1</title>
        <style>
            body{
                width: 50%;
                margin: auto;
                background-color: azure;
                font-family: arial, sans-serif;
                text-align: center;
                margin-top: 30vh;
            }
            input {
                font-size: 1rem;
                width: 50%;
                padding: 5px;
                margin: 5px;
            }
        </style>
    </head>
    <body>
        <%! 
         String print(String value){
            return value;
        }
        %>
        <form action="AreaOfCircle" method="post">
        <h1>Please Enter the Radius:</h1>
        <input id="radius" name="radius" type="number" value="" min="0" style="margin:10px">
        <input type="button" value="Click here for in-web-solution" onclick="myFunction()" >
        <input type="submit" value="Click here servlet" onclick="AreaOfCircle" >
        
        </form>
        <h2 id="no"></h2>
        
        <script type="text/javascript">
           function myFunction(){
                let val = document.getElementById('radius').value;
                var check;
                val = Math.PI * Math.pow(val,2);
                if(check === undefined){
                    check = true;
                    document.getElementById('no').innerHTML = 'Area Of Circle is: <br><br>'+parseFloat(val).toFixed(2);
                }   
            }
        </script>
    </body>
</html>
