package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class insuranceQuotation_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("         <title>Insurance Quotation Form</title>\n");
      out.write("         <style>\n");
      out.write("             input[type=\"number\"],input[type=\"text\"]{\n");
      out.write("                 width: 100%;\n");
      out.write("             }\n");
      out.write("             select{\n");
      out.write("                 width: 50%\n");
      out.write("             }\n");
      out.write("             td{padding-right: 20px;}\n");
      out.write("         </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Insurance Quotation</h1>\n");
      out.write("        <form action=\"processInsuranceQuo.jsp\" method=\"POST\">\n");
      out.write("            <fieldset>\n");
      out.write("                <legend>Insurance Calculation</legend>\n");
      out.write("                <table>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"ic\">ICNo</label></td>\n");
      out.write("                        <td><input type=\"text\" size=\"14\" id=\"ic\" name=\"ic\" placeholder=\"E.g. 821210-05-3478\" required/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"name\">Name</label></td>\n");
      out.write("                        <td><input type=\"text\" size=\"50\" id=\"name\" name=\"name\" placeholder=\"Enter name\" required/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"price\">Market Price</label></td>\n");
      out.write("                        <td><input type=\"number\" id=\"price\" name=\"price\" placeholder=\"Price\" required/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"coverageType\">Coverage Type</label></td>\n");
      out.write("                        <td><select name=\"coverageType\">\n");
      out.write("                                <option value=\"1\">Third Party</option>\n");
      out.write("                                <option value=\"2\">Comprehensive</option>\n");
      out.write("                            </select>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><label for=\"cDiscount\">No claims discount<br/>(NCD)</label></td>\n");
      out.write("                        <td><select name=\"cDiscount\">\n");
      out.write("                                <option value=\"1\">10%</option>\n");
      out.write("                                <option value=\"2\">25%</option>\n");
      out.write("                                <option value=\"3\">35%</option>\n");
      out.write("                                <option value=\"4\">55%</option>\n");
      out.write("                            </select>\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><br/>\n");
      out.write("                            <input type=\"submit\" name=\"Submit\" value=\"Submit\" />\n");
      out.write("                            <input type=\"reset\" name=\"Cancel\" value=\"Cancel\" />\n");
      out.write("                        </td> \n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("            </fieldset>  \n");
      out.write("        </form>\n");
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
