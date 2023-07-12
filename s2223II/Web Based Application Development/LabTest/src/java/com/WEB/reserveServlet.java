/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.WEB;

import com.DAO.reserveDAO;
import com.model.reserve;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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

public class reserveServlet extends HttpServlet {
    
    private reserveDAO reserveDAO;
    
    public void init() {
        reserveDAO = new reserveDAO();
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
        
        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                
                case "insert":
                    insertReserve(request,response);
                    break;
                    
                case "delete":
                    deleteReserve(request,response);
                    break;
                 
                case "edit":
                    showEditForm(request, response);
                    break;
                    
                case "update":
                    updateReserve(request,response);
                    break;
                    
                default:
                    listReserve(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    


    
    private void listReserve (HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException{
        List <reserve> listReserve = reserveDAO.selectAllReserve();
        request.setAttribute("listReserve", listReserve);
        RequestDispatcher dispatcher = request.getRequestDispatcher("reserveList.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showNewForm (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("reserveForm.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException  {
        int code = Integer.parseInt(request.getParameter("code"));
        reserve existingReserve = reserveDAO.selectReserve(code);
        RequestDispatcher dispatcher = request.getRequestDispatcher("reserveForm.jsp");
        request.setAttribute("reserve", existingReserve);
        dispatcher.forward(request, response);
    }
    
    private void insertReserve (HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException{
        reserve r = new reserve();
        r.setUserid(request.getParameter("userid"));
        r.setStartdate( request.getParameter("startdate"));
        r.setEnddate(request.getParameter("enddate"));
        r.setSize(request.getParameter("size"));
        r.setBoatid( request.getParameter("boatid"));
        r.setOperator(request.getParameter("operator"));
        r.setPeople(Integer.parseInt(request.getParameter("people")));
        r.setNumboat(Integer.parseInt(request.getParameter("numboat")));
        
        
        reserveDAO.insertReserve(r);
        response.sendRedirect("reserveServlet?action=list");
    }
    
    private void updateReserve(HttpServletRequest request, HttpServletResponse response)
    throws SQLException,  IOException  {
        reserve r = new reserve();
        r.setCode(Integer.parseInt(request.getParameter("code")));
       r.setUserid(request.getParameter("userid"));
        r.setStartdate( request.getParameter("startdate"));
        r.setEnddate( request.getParameter("enddate"));
        r.setSize( request.getParameter("size"));
        r.setBoatid( request.getParameter("boatid"));
        r.setOperator( request.getParameter("operator"));
        r.setPeople( Integer.parseInt(request.getParameter("people")));
        r.setNumboat( Integer.parseInt(request.getParameter("numboat")));
        
       
        reserveDAO.updateCar(r);
        response.sendRedirect("reserveServlet?action=List");
    }
    
    private void deleteReserve (HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException{
        int code = Integer.parseInt(request.getParameter("code"));
        reserveDAO.deleteReserve(code);
        response.sendRedirect("reserveServlet?action=List");
    }}
