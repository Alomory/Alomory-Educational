package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.DecimalFormat;
import java.util.Formatter;
import javax.swing.JOptionPane;

public final class Exercise_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


                        public String[] swap(String s) {
                            String tem[] = new String[2];

                            if (s.charAt(0) == '0') {
                                return tem = "Fahrenheit,Celsius".split(",");
                            } else {
                                return tem = "Celsius,Fahrenheit".split(",");
                            }
                        }
                    
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Exercise Page >|_|<</title>\n");
      out.write("        <style>\n");
      out.write("            body{\n");
      out.write("                width: 50%;\n");
      out.write("                margin: auto;\n");
      out.write("                background-color: azure;\n");
      out.write("                font-family: monospace;\n");
      out.write("                text-align: center;\n");
      out.write("                margin-top: 10vh;\n");
      out.write("            }\n");
      out.write("            td{\n");
      out.write("                background-color: #f8f1df;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* testing -------------------------------*/\n");
      out.write("            table {\n");
      out.write("                border-collapse: separate;\n");
      out.write("                border-spacing: 0;\n");
      out.write("                min-width: 350px;\n");
      out.write("                width: 100%;\n");
      out.write("                font-family: arial, sans-serif;\n");
      out.write("            }\n");
      out.write("            table tr th,\n");
      out.write("            table tr td {\n");
      out.write("                border-right: 1px solid #bbb;\n");
      out.write("                border-bottom: 1px solid #bbb;\n");
      out.write("                padding: 5px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            table tr th:first-child,\n");
      out.write("            table tr td:first-child {\n");
      out.write("                border-left: 1px solid #bbb;\n");
      out.write("            }\n");
      out.write("            table tr th {\n");
      out.write("                background: #eee;\n");
      out.write("                text-align: left;\n");
      out.write("                border-top: solid 1px #bbb;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* top-left border-radius */\n");
      out.write("            table tr:first-child th:first-child {\n");
      out.write("                border-top-left-radius: 6px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* top-right border-radius */\n");
      out.write("            table tr:first-child th:last-child {\n");
      out.write("                border-top-right-radius: 6px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* bottom-left border-radius */\n");
      out.write("            table tr:last-child td:first-child {\n");
      out.write("                border-bottom-left-radius: 6px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* bottom-right border-radius */\n");
      out.write("            table tr:last-child td:last-child {\n");
      out.write("                border-bottom-right-radius: 6px;\n");
      out.write("            }\n");
      out.write("            /* testing -------------------------------*/\n");
      out.write("            input[type=\"submit\"], input[type=\"reset\"]{\n");
      out.write("                padding: 10px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                border: 0;\n");
      out.write("                cursor: pointer;\n");
      out.write("                background-color: gainsboro;\n");
      out.write("            }\n");
      out.write("            input[type=\"submit\"]{\n");
      out.write("                background-color: #16a34a;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("            input[type=\"submit\"]:hover{\n");
      out.write("                background-color: #15803d;\n");
      out.write("            }\n");
      out.write("            input[type=\"reset\"]:hover{\n");
      out.write("                background-color: darkgray;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            select {\n");
      out.write("                display: inline-block;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                padding: 0.5em 2em 0.5em 0.5em;\n");
      out.write("                border: 1px solid #eee;\n");
      out.write("                font: inherit;\n");
      out.write("                appearance: none;\n");
      out.write("                /*the arrow pointing down*/\n");
      out.write("                background-repeat: no-repeat;\n");
      out.write("                background-image: linear-gradient(45deg, transparent 50%, currentColor 50%), linear-gradient(135deg, currentColor 50%, transparent 50%);\n");
      out.write("                background-position: right 15px top 1em, right 10px top 1em;\n");
      out.write("                background-size: 5px 5px, 5px 5px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"tempConverter\">\n");
      out.write("                <h1>Temperature Converter</h1>\n");
      out.write("                <form>\n");
      out.write("                    ");
      out.write("\n");
      out.write("                    ");

                        Formatter f = new Formatter();
                        DecimalFormat df = new DecimalFormat("###.####");

                        String temp = "32";
                        double result = 0.0;
                        String choice = "0";

                        if (request.getParameter("temp") != null) {
                            choice = request.getParameter("choice");
                            temp = request.getParameter("temp");
                            if (choice.charAt(0) == '0') {
                                result = (Integer.parseInt(temp) - 32) * 0.5556;

                            } else {
                                result = (Integer.parseInt(temp) * 1.8) + 32;
                            }
                        }
                    
      out.write("\n");
      out.write("                    <table border=\"0\">\n");
      out.write("                        <tr>\n");
      out.write("\n");
      out.write("                            <th>Temperature</th>\n");
      out.write("                            <th>");
      out.print(swap(choice)[0]);
      out.write("</th>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><input type=\"number\" name=\"temp\" step=\"0.01\" placeholder=\"E.g. 32\" value=");
      out.print(temp);
      out.write("/></td>\n");
      out.write("                            <td><textarea readonly disabled style=\"resize: none;\">");
      out.print(df.format(result));
      out.write("</textarea></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><label for=\"choice\">To which you want to convert:</label></td>\n");
      out.write("                            <td><select name=\"choice\" size=\"1\">\n");
      out.write("                                    <option value=\"0\">Fahrenheit</option>\n");
      out.write("                                    <option value=\"1\">Celsius</option>\n");
      out.write("                                </select></td>\n");
      out.write("\n");
      out.write("                        </tr>\n");
      out.write("\n");
      out.write("                    </table>\n");
      out.write("                    <br>\n");
      out.write("                    <input type=\"submit\" id=\"btnSubmit\" value=\"Convert\"/>\n");
      out.write("                    <input type=\"reset\" id=\"btnCancel\" value=\"Reset\"/>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <hr>\n");
      out.write("            <div class=\"rectComparison\">\n");
      out.write("                <h1>Rectangle Area Comparison</h1>\n");
      out.write("                <form method=\"post\">\n");
      out.write("                    <table>\n");
      out.write("                        <tr>\n");
      out.write("                            <th colspan=\"2\">\n");
      out.write("                                <p>Rectangle 1:</p>\n");
      out.write("                            </th>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                                <label for=\"length1\">Length:</label>\n");
      out.write("                                <input type=\"number\" step=\"0.01\" name=\"length1\" id=\"length1\" required>\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                <label for=\"width1\">Width:</label>\n");
      out.write("                                <input type=\"number\" step=\"0.01\" name=\"width1\" id=\"width1\" required>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <th colspan=\"2\">\n");
      out.write("                                <p>Rectangle 2:</p>\n");
      out.write("                            </th>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                                <label for=\"length2\">Length:</label>\n");
      out.write("                                <input type=\"number\" step=\"0.01\" name=\"length2\" id=\"length2\" required>\n");
      out.write("                            </td>\n");
      out.write("                            <td>\n");
      out.write("                                <label for=\"width2\">Width:</label>\n");
      out.write("                                <input type=\"number\" step=\"0.01\" name=\"width2\" id=\"width2\" required>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table>\n");
      out.write("                    <br>\n");
      out.write("                    <input type=\"submit\" id=\"btnSubmit2\" value=\"Compare Areas\">\n");
      out.write("                    <input type=\"reset\" id=\"btnCancel2\" value=\"Reset\"/>\n");
      out.write("\n");
      out.write("                </form>\n");
      out.write("\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");

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
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <hr>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
