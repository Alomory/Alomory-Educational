/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.UserDao;
import com.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Omar Alomory(S63955)
 */
public class UserController extends HttpServlet {
    public static String INSERT ="/user.jsp";
    public static String EDIT ="/editUser.jsp";
    public static String LIST_USER ="/listUser.jsp";
    public UserDao dao;

    public UserController() throws ClassNotFoundException{
        super();
        dao = new UserDao();
    }
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String forward = "";
      String action = request.getParameter("action");
      
      if(action.equalsIgnoreCase("delete")){
          String userId =  request.getParameter("userId");
          dao.deleteUser(userId);
          forward =LIST_USER;
          request.setAttribute("users", dao.getAllUsers());
      }else if(action.equalsIgnoreCase("edit")){
          forward = EDIT;
          String userId = request.getParameter("userId");
          User user = dao.getUserById(userId);
          request.setAttribute("user", user);
      }else if(action.equalsIgnoreCase("listUser")){
          forward = LIST_USER;
          request.setAttribute("users", dao.getAllUsers());
      }else if(action.equalsIgnoreCase("insert")){
          forward =  INSERT;
      }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      String action = request.getParameter("action");
      
      User user = new User();
      user.setUserid(request.getParameter("userid"));
      user.setFirstname(request.getParameter("firstName"));
      user.setLastname(request.getParameter("lastName"));
        
      if(action.equalsIgnoreCase("edit")){
          dao.updtateUser(user);
      }else{
          dao.addUser(user);
      }
      
      RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
      request.setAttribute("users", dao.getAllUsers());
      view.forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
