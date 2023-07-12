<%-- 
    Document   : StockInterface
    Created on : May 21, 2023, 1:00:20 PM
    Author     : Omar Alomory(S63955)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock Interface</title>
    </head>
    <body>
        <fieldset>
            <legend><h1>Fill in the form below to get the output:</h1></legend>
            <form action="ProcessStock.jsp" method="post">
                <table border="0">
                <tbody>
                    <tr>
                        <td><label for="stock">Stock Amount:</label></td>
                        <td><input type="number" name="stock" id="stock" placeholder="E.g. 800"></td>
                    </tr>
                    <tr>
                        <td><label for="sharePrice">Share Price:</label></td>
                        <td><input type="number" step="0.01" name="sharePrice" id="sharePrice" placeholder="E.g. 10.5"></td>
                    </tr>
                    <tr>
                        <td><label for="commission">Commission:</label></td>
                        <td><input type="number" step="0.01" name="commission" id="commission" placeholder="E.g. 5"></td>
                    </tr>
                </tbody>
            </table>
                <br>
                <input type="submit" value="Submit"> <input type="reset" value="Cancel">
            </form>

        </fieldset>
    </body>
</html>
