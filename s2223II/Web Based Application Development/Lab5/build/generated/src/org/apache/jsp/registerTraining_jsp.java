package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class registerTraining_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/copyRight.jsp");
  }

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Use JavaBeans in JavaScriptlet(Request)</title>\n");
      out.write("        <style>\n");
      out.write("            table {\n");
      out.write("                border-collapse: collapse;\n");
      out.write("                table-layout: fixed;\n");
      out.write("                max-width: 100%;\n");
      out.write("            }\n");
      out.write("             input[type=\"text\"],input[type=\"number\"], table, select{\n");
      out.write("               width: 100%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1><i>Register IT Training</i></h1>\n");
      out.write("        <form action=\"processTraining.jsp\" method=\"post\">\n");
      out.write("            <fieldset>\n");
      out.write("                <legend>Training Registration</legend>\n");
      out.write("                <table>                   \n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"icNo\">IC No</label></td>\n");
      out.write("                        <td><input name=\"icNo\" id=\"icNo\" type=\"text\"></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"name\">Name</label></td>\n");
      out.write("                        <td><input type=\"text\" name=\"name\" id=\"name\"></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"trainType\">Type of Training</label></td>\n");
      out.write("                        <td>\n");
      out.write("                            <select name=\"trainType\">\n");
      out.write("                                <option value=\"1\">C++ training</option>\n");
      out.write("                                <option value=\"2\">Java for beginner</option>\n");
      out.write("                                <option value=\"3\">HTML5</option>\n");
      out.write("                                <option value=\"4\">Java EEE</option>\n");
      out.write("                                <option value=\"5\">Android Programming</option>\n");
      out.write("                            </select>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"paxNo\">No of Pax</label></td>\n");
      out.write("                        <td><input type=\"number\" name=\"paxNo\" ></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"stuCheck\">Student</label></td>\n");
      out.write("                        <td>\n");
      out.write("                            <input type=\"radio\" name=\"stuCheck\" value=\"1\"> Yes\n");
      out.write("                            <input type=\"radio\" name=\"stuCheck\" value=\"0\"> No\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("                <br>\n");
      out.write("                <input type=\"submit\" value=\"Submit\"> <input type=\"reset\" value=\"Cancel\">\n");
      out.write("            </fieldset>\n");
      out.write("        </form>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<footer>\n");
      out.write("    <br><br>\n");
      out.write("    <p style=\"color: black; font-family: arial; font-size: 1rem\"><b>&copy;2023-Omar Alomory</b></p>\n");
      out.write("</footer>\n");
      out.write("\n");
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
