<%-- 
    Document   : Exercise
    Created on : Apr 30, 2023, 3:03:24 AM
    Author     : komar
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Formatter"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exercise Page >|_|<</title>
        <style>
            body{
                width: 50%;
                margin: auto;
                background-color: azure;
                font-family: monospace;
                text-align: center;
                margin-top: 10vh;
            }
            td{
                background-color: #f8f1df;
            }

            /* testing -------------------------------*/
            table {
                border-collapse: separate;
                border-spacing: 0;
                min-width: 350px;
                width: 100%;
                font-family: arial, sans-serif;
            }
            table tr th,
            table tr td {
                border-right: 1px solid #bbb;
                border-bottom: 1px solid #bbb;
                padding: 5px;
            }

            table tr th:first-child,
            table tr td:first-child {
                border-left: 1px solid #bbb;
            }
            table tr th {
                background: #eee;
                text-align: left;
                border-top: solid 1px #bbb;
            }

            /* top-left border-radius */
            table tr:first-child th:first-child {
                border-top-left-radius: 6px;
            }

            /* top-right border-radius */
            table tr:first-child th:last-child {
                border-top-right-radius: 6px;
            }

            /* bottom-left border-radius */
            table tr:last-child td:first-child {
                border-bottom-left-radius: 6px;
            }

            /* bottom-right border-radius */
            table tr:last-child td:last-child {
                border-bottom-right-radius: 6px;
            }
            /* testing -------------------------------*/
            input[type="submit"], input[type="reset"]{
                padding: 10px;
                border-radius: 5px;
                border: 0;
                cursor: pointer;
                background-color: gainsboro;
            }
            input[type="submit"]{
                background-color: #16a34a;
                color: white;
            }
            input[type="submit"]:hover{
                background-color: #15803d;
            }
            input[type="reset"]:hover{
                background-color: darkgray;
            }

            select {
                display: inline-block;
                box-sizing: border-box;
                padding: 0.5em 2em 0.5em 0.5em;
                border: 1px solid #eee;
                font: inherit;
                appearance: none;
                /*the arrow pointing down*/
                background-repeat: no-repeat;
                background-image: linear-gradient(45deg, transparent 50%, currentColor 50%), linear-gradient(135deg, currentColor 50%, transparent 50%);
                background-position: right 15px top 1em, right 10px top 1em;
                background-size: 5px 5px, 5px 5px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="tempConverter">
                <h1>Temperature Converter</h1>
                <form>
                    <%!
                        public String[] swap(String s) {
                            String tem[] = new String[2];

                            if (s.charAt(0) == '0') {
                                return tem = "Fahrenheit,Celsius".split(",");
                            } else {
                                return tem = "Celsius,Fahrenheit".split(",");
                            }
                        }
                    %>
                    <%
                        Formatter f = new Formatter();
                        DecimalFormat df = new DecimalFormat("###.####");

                        String temp = "32";
                        double result = 0.0;
                        String choice = "0";

                        if (request.getParameter("temp") != null) {
                            choice = request.getParameter("choice");
                            temp = request.getParameter("temp");
                            if (choice.charAt(0) == '1') {
                                result = (Integer.parseInt(temp) - 32) * 0.5556;

                            } else {
                                result = (Integer.parseInt(temp) * 1.8) + 32;
                            }
                        }
                    %>
                    <table border="0">
                        <tr>

                            <th>Temperature</th>
                            <th><%=swap(choice)[0]%></th>
                        </tr>
                        <tr>
                            <td><input type="number" name="temp" step="0.01" placeholder="E.g. 32" value=<%=temp%>/></td>
                            <td><textarea readonly disabled style="resize: none;"><%=df.format(result)%></textarea></td>
                        </tr>
                        <tr>
                            <td><label for="choice">To which you want to convert:</label></td>
                            <td><select name="choice" size="1">
                                    <option value="0">Fahrenheit</option>
                                    <option value="1">Celsius</option>
                                </select></td>

                        </tr>

                    </table>
                    <br>
                    <input type="submit" id="btnSubmit" value="Convert"/>
                    <input type="reset" id="btnCancel" value="Reset"/>
                </form>
            </div>
            <hr>
            <div class="rectComparison">
                <h1>Rectangle Area Comparison</h1>
                <form method="post">
                    <table>
                        <tr>
                            <th colspan="2">
                                <p>Rectangle 1:</p>
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <label for="length1">Length:</label>
                                <input type="number" step="0.01" name="length1" id="length1" required>
                            </td>
                            <td>
                                <label for="width1">Width:</label>
                                <input type="number" step="0.01" name="width1" id="width1" required>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">
                                <p>Rectangle 2:</p>
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <label for="length2">Length:</label>
                                <input type="number" step="0.01" name="length2" id="length2" required>
                            </td>
                            <td>
                                <label for="width2">Width:</label>
                                <input type="number" step="0.01" name="width2" id="width2" required>
                            </td>
                        </tr>
                    </table>
                    <br>
                    <input type="submit" id="btnSubmit2" value="Compare Areas">
                    <input type="reset" id="btnCancel2" value="Reset"/>

                </form>

                <%-- JSP code to calculate and display the area comparison --%>
                <%
                    if (request.getMethod().equals("POST")) {
                        double length1 = Double.parseDouble(request.getParameter("length1"));
                        double width1 = Double.parseDouble(request.getParameter("width1"));
                        double length2 = Double.parseDouble(request.getParameter("length2"));
                        double width2 = Double.parseDouble(request.getParameter("width2"));
                        double area1 = length1 * width1;
                        double area2 = length2 * width2;
                        String result2;
                        if (area1 > area2) {
                            result2 = "Rectangle 1 has a greater area of " + String.format("%.2f", area1) + ".";
                        } else if (area2 > area1) {
                            result2 = "Rectangle 2 has a greater area of " + String.format("%.2f", area2) + ".";
                        } else {
                            result2 = "Both rectangles have the same area of " + String.format("%.2f", area1) + ".";
                        }
                        out.println("<p>" + result2 + "</p>");
                    }
                %>
            </div>
            <hr>
        </div>
    </body>
</html>
