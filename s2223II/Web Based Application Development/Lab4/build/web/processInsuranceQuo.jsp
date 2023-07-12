<%-- 
    Document   : processInsuranceQuo
    Created on : May 14, 2023, 6:45:46 PM
    Author     : komar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Insurance Quotation Details</title>
    </head>
    <body>
        <%!
            //Define method to  calculate the insurance quotation. ...
            private double calculateRate(String coverageType, String cDiscount, int price) {
                double insurance = 0.00f;
                if (coverageType.equals("1")) {
                    if (cDiscount.equals("1"))
                        insurance = (double)(0.033 * price);
                    if (cDiscount.equals("2"))
                        insurance = (double)(0.025 * price);
                    if (cDiscount.equals("3"))
                        insurance = (double)(0.018 * price);
                    if (cDiscount.equals("4"))
                        insurance = (double)(0.012 * price);
                } else {
                    if (cDiscount.equals("1"))
                        insurance = (double)(0.038 * price);
                    if (cDiscount.equals("2"))
                        insurance = (double)(0.03 * price);
                    if (cDiscount.equals("3"))
                        insurance = (double)(0.024 * price);
                    if (cDiscount.equals("4"))
                        insurance = (double)(0.018 * price);
                }
                return insurance; //return the result...
            }
        %>
        
        <%
            String icNo = request.getParameter("ic");
            String name = request.getParameter("name");
            int price1 = Integer.parseInt(request.getParameter("price"));
            String covType = request.getParameter("coverageType").equals("1")? "Third Party":"Comprehensive";
            String cDis = request.getParameter("cDiscount");
            double gst = calculateRate(covType, cDis, price1) * 0.06;
            double total = gst + calculateRate(covType, cDis, price1);
        %>
        
        <div style="font-family: Arial, Helvetica, sans-serif">
            <fieldset>
                <legend><h2>Details of Insurance Quotation</h2></legend>
                <div style="color: darkviolet"> 
                    <p>IC No : <%=icNo%></p>
                    <p>Customer Name : <%=name%><br/></p>
                    <p>Market Price : <%=price1%><br/></p>
                    <p>Coverage Type : <%=covType%><br/>
                    </p>
                    
                    <p>No claim discount (NCD) : 
                        <%
                            if (cDis.equals("1")) {
                                out.println("10%");
                            } else if (cDis.equals("2")) {
                                out.println("25%");
                            } else if (cDis.equals("3")) {
                                out.println("35%");
                            } else {
                                out.println("55%");
                            }
                        %><br/>
                    </p>
                    
                    <p>Insurance amount : <%= String.format("%.2f", 
                            (calculateRate(covType, cDis, price1)))%><br/></p>
                    <p>6% GST : <%=String.format("%.2f", gst)%><br/></p>
                    <p>Final amount (with 6% GST) : <%= String.format("%.2f", total)%></p>
                </div>
            </fieldset>  
        </div>
    </body>
</html>
