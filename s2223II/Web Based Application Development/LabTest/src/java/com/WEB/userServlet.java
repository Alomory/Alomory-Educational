/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.WEB;

import com.DAO.userDAO;
import com.model.user;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Omar Alomory(S63955)
 */

public class userServlet extends HttpServlet {
    
    private userDAO userDAO;
    
    public void init() {
        userDAO = new userDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        switch (action) {
            case "/new":
                showNewForm(request, response);
                break;
                
            case "/insert":
            {
                try {
                    insertUser(request,response);
                } catch (SQLException ex) {
                    Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;

                
            case "/delete":
            {
                try {
                    deleteUser(request,response);
                } catch (SQLException ex) {
                    Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;

                
            case "/login":
            {
            try {
                loginUser(request,response);
            } catch (SQLException ex) {
                Logger.getLogger(userServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
                break;
       
        }
    }

    private void showNewForm (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");
        dispatcher.forward(request, response);
    }

    
    private void insertUser (HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException{
        user user = new user();
        user.setId( request.getParameter("id"));
        user.setName(request.getParameter("name"));
        user.setGender(request.getParameter("gender"));
        user.setContact(request.getParameter("contact"));
        user.setIc(Integer.parseInt(request.getParameter("ic")));
        user.setAge(Integer.parseInt(request.getParameter("age")));
        user.setAddress( request.getParameter("address"));
        user.setEmail(request.getParameter("email"));
     
        userDAO.insertUser(user);
        response.sendRedirect("userServlet?action=/login");
    }
    
        private void loginUser (HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException{
       
        String id = request.getParameter("id");
        String ic =request.getParameter("ic");
        response.sendRedirect("reserveList.jsp");      
    
    } 
    private void deleteUser (HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException{
        String id = request.getParameter("id");
        userDAO.deleteUser(id);
        response.sendRedirect("list");
    }}