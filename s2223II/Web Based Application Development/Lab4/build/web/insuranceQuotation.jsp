<%-- 
    Document   : insuranceQuotation
    Created on : May 14, 2023, 6:42:02 PM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Insurance Quotation Form</title>
         <style>
             input[type="number"],input[type="text"]{
                 width: 100%;
             }
             select{
                 width: 50%
             }
             td{padding-right: 20px;}
         </style>
    </head>
    <body>
        <h1>Insurance Quotation</h1>
        <form action="processInsuranceQuo.jsp" method="POST">
            <fieldset>
                <legend>Insurance Calculation</legend>
                <table>
                    <tr>
                        <td><label for="ic">ICNo</label></td>
                        <td><input type="text" size="14" id="ic" name="ic" placeholder="E.g. 821210-05-3478" required/></td>
                    </tr>
                    <tr>
                        <td><label for="name">Name</label></td>
                        <td><input type="text" size="50" id="name" name="name" placeholder="Enter name" required/></td>
                    </tr>
                    <tr>
                        <td><label for="price">Market Price</label></td>
                        <td><input type="number" id="price" name="price" placeholder="Price" required/></td>
                    </tr>
                    <tr>
                        <td><label for="coverageType">Coverage Type</label></td>
                        <td><select name="coverageType">
                                <option value="1">Third Party</option>
                                <option value="2">Comprehensive</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="cDiscount">No claims discount<br/>(NCD)</label></td>
                        <td><select name="cDiscount">
                                <option value="1">10%</option>
                                <option value="2">25%</option>
                                <option value="3">35%</option>
                                <option value="4">55%</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><br/>
                            <input type="submit" name="Submit" value="Submit" />
                            <input type="reset" name="Cancel" value="Cancel" />
                        </td> 
                    </tr>
                </table>
            </fieldset>  
        </form>
    </body>
</html>
