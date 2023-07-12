/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author komar
 */
public class ViewServlet extends HttpServlet {

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
            // css styling :<
            out.print("<style>"
                    + " body{\n"
                    + "                width: 50%;\n"
                    + "                margin: auto;\n"
                    + "                background-color: azure;\n"
                    + "                font-family: arial, sans-serif;\n"
                    + "                text-align: center;\n"
                    + "                margin-top: 30vh;\n"
                    + "            }\n"
                    + "             \n"
                    + "table {\n"
                    + "            font-family: arial, sans-serif;\n"
                    + "            border-collapse: collapse;\n"
                    + "            width: 100%;\n"
                    + "          }\n"
                    + "th{\n"
                    + "              background-color: #f5d882;\n"
                    + "          }\n"
                    + " td{\n"
                    + "              background-color: #f8f1df;\n"
                    + "          }\n"
                    + "td, th {\n"
                    + "            border: 1px solid #dddddd;\n"
                    + "            text-align: center;\n"
                    + "            padding: 8px;\n"
                    + "          }"
                    + "</style>");
            out.println("<title>Servlet ViewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            // i started playing here

            out.println("<a href='index.html'>Add New User</a>");
            out.println("<h1>User List</h1>");
            List<User> list = UserDao.GetAllUsers();
            out.print("<table border='1' width='100%'>"
                    + "<tr>"
                    + "<th>Id</th>"
                    + "<th>Name</th>"
                    + "<th>Password</th>"
                    + "<th>Role</th>"
                    + "<th>Edit</th>"
                    + "<th>Delete</th>"
                    + "</tr>");
            for (User e : list) {
                out.print("<tr>"
                        + "<td>" + e.getId() + "</td>"
                        + "<td>" + e.getUsername() + "</td>"
                        + "<td>" + e.getPassword() + "</td>"
                        + "<td>" + e.getRole() + "</td>"
                        + "<td><a href='EditServlet?id=" + e.getId() + "'>edit</a></td>"
                        + "<td><a href='DeleteServlet?id=" + e.getId() + "'>delete</a></td>"
                        + "</tr>");
            }
            out.print("</table>");
            // the boundaries(for now)
            out.println("</body>");
            out.println("</html>");
            out.close();
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
