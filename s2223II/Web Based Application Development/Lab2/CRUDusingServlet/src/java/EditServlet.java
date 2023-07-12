/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author komar
 */
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.print("<style>"
                    + "body{\n"
                    + "  background-color: azure;\n"
                    + "} \n"
                    + "input[type=text],input[type=password], select {\n"
                    + "  width: 100%;\n"
                    + "  padding: 12px 20px;\n"
                    + "  margin: 8px 0;\n"
                    + "  display: inline-block;\n"
                    + "  border: 1px solid #ccc;\n"
                    + "  border-radius: 4px;\n"
                    + "  box-sizing: border-box;\n"
                    + "}\n"
                    + "\n"
                    + "input[type=submit] {\n"
                    + "  width: 100%;\n"
                    + "  background-color: #4CAF50;\n"
                    + "  color: white;\n"
                    + "  padding: 14px 20px;\n"
                    + "  margin: 8px 0;\n"
                    + "  border: none;\n"
                    + "  border-radius: 4px;\n"
                    + "  cursor: pointer;\n"
                    + "}\n"
                    + "\n"
                    + "input[type=submit]:hover {\n"
                    + "  background-color: #45a049;\n"
                    + "}\n"
                    + "\n"
                    + "div {\n"
                    + "  border-radius: 5px;\n"
                    + "  background-color: #f2f2f2;\n"
                    + "  padding: 20px;\n"
                    + "  align-items: center;\n"
                    + "}\n"
                    + ".container{\n"
                    + "    width: 50%;\n"
                    + "    margin: auto;\n"
                    + "    margin-top: 20vh;   \n"
                    + "}"
                    + "</style>");
            out.println("</head>");
            out.println("<body>");
            out.print("<div class=\"container\">");
            out.println("<h1>Update User</h1>");
            String sid = request.getParameter("id");
            int id = Integer.parseInt(sid);
            User u = UserDao.getUserById(id);
            out.print("<div>");
            out.print("<form action='EditServlet2' method='post'>");
            out.print("<table>");
            out.print("<tr><td></td><td><input type='hidden' name='id' value='"
                    + u.getId() + "'/> </td></tr>");
            out.print("<tr><td>Name:</td><td><input type='text' name='username' value='"
                    + u.getUsername() + "'/> </td></tr>");
            out.print("<tr><td>Password:</td><td><input type='password' name='password' value='"
                    + u.getPassword() + "'/> </td></tr>");
            out.print("<tr><td>Role:</td><td>"
                    + "<select name='role' style='width:150px'>"
                    + "<option>admin</option>"
                    + "<option>user</option>"
                    + "</select>"
                    + "</td></tr>");
            out.print("<tr><td colspan='2'> <input type='submit' value'Edit & Save'/></td></tr>");
            out.print("</table></form>");
            out.print("</div></div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
