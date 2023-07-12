<%-- 
    Document   : circleForm
    Created on : May 21, 2023, 2:42:43 AM
    Author     : Omar Alomory(S63955)
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Circle Calculation</title>
</head>
<body>
  <h2>Circle Calculation</h2>
  <form method="post" action="calculate.jsp">
    Enter the radius of the circle: <input type="text" name="radius" required><br><br>
    <input type="submit" value="Calculate">
  </form>
</body>
</html>

