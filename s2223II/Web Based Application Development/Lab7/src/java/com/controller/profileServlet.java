package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class profileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/csfLab7";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "admin";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form data
        String username = request.getParameter("username");
        String icno = request.getParameter("icno");
        String firstname = request.getParameter("firstname");

        // Database connection and insertion
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // Establish database connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare SQL statement for insertion
            String sql = "INSERT INTO userprofile (username, icno, firstname) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, icno);
            pstmt.setString(3, firstname);

            // Execute the SQL statement
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<h2>Profile Registration Successful</h2>");
                out.println("<p>Username: " + username + "</p>");
                out.println("<p>IC No: " + icno + "</p>");
                out.println("<p>First Name: " + firstname + "</p>");
            } else {
                out.println("<h2>Profile Registration Failed</h2>");
            }
        } catch (SQLException e) {
            out.println("<h2>Profile Registration Failed</h2>");
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(profileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close resources
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
