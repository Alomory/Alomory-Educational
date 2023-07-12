/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.WEB;

import com.DAO.CarDAO;
import com.Model.Car;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Formatter;

/**
 *
 * @author Omar Alomory(S63955)
 */
public class CarServlet extends HttpServlet {

    private CarDAO carDAO;
    public void init() {
        carDAO = new CarDAO();
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
                    insertCar(request, response);
                    break;
                case "delete":
                    deleteCar(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateCar(request, response);
                    break;
                case "indexList":
                    IndexList(request, response);
                    break;
                default:
                    listCars(request, response);
                    break;
            }
        } catch (SQLException sql) {
            throw new ServletException(sql);
        }
    }

    private void listCars(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Car> listCar = carDAO.selectAllCars();
        request.setAttribute("listCars", listCar);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CarsList.jsp");
        dispatcher.forward(request, response);
    }

    private void IndexList(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        
        List<Car> listCar = carDAO.selectAllCars();
        String HTML = "<table class='table table-bordered'><thead><tr>"
                + "<th>Car ID</th><th>Brand</th><th>Model</th><th>Cylinders</th><th>Price</th><th>Action</th></tr></thead>"
                + "<tbody>";
        for (int i = 0; i < listCar.size(); i++) {
            HTML += "<tr><td>" + listCar.get(i).getCarId() + "</td>";
            HTML += "<td>" + listCar.get(i).getBrand() + "</td>";
            HTML += "<td>" + listCar.get(i).getModel() + "</td>";
            HTML += "<td>" + listCar.get(i).getCyclinder() + "</td>";
            HTML += "<td>" + new Formatter().format("%.2f", listCar.get(i).getPrice())+"RM" + "</td>";
            HTML += "<td><a href=\"CarServlet?action=edit&id=" + listCar.get(i).getCarId() + "\">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;";
            HTML += "<a href=\"CarServlet?action=delete&id=" + listCar.get(i).getCarId() + "\">Delete</a></td></tr>";
        }
        HTML += "</tbody></table>";
        response.getWriter().write(HTML);

    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("CarForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Car existingCar = carDAO.selectCar(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CarForm.jsp");
        request.setAttribute("car", existingCar);
        dispatcher.forward(request, response);
    }

    private void insertCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        Car car = new Car();
        car.setBrand(request.getParameter("brand"));
        car.setModel(request.getParameter("model"));
        car.setCyclinder(Integer.parseInt(String.valueOf(request.getParameter("cyclinder").charAt(0))));
        car.setPrice(Double.parseDouble(request.getParameter("price")));

        carDAO.insertCar(car);
        response.sendRedirect("CarServlet?action=list");
    }

    private void updateCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        Car car = new Car();
        car.setCarId(Integer.parseInt(request.getParameter("carid")));
        car.setBrand(request.getParameter("brand"));
        car.setModel(request.getParameter("model"));
        car.setCyclinder(Integer.parseInt(String.valueOf(request.getParameter("cyclinder").charAt(0))));
        car.setPrice(Double.parseDouble(request.getParameter("price")));

        carDAO.updateCar(car);
        response.sendRedirect("CarServlet?action=list");
    }

    private void deleteCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        carDAO.deleteCar(id);
        response.sendRedirect("CarServlet?action=list");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
