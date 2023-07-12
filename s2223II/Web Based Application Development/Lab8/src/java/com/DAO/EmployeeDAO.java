/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.Employee;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Omar Alomory(S63955)
 */
public class EmployeeDAO {

    private static Connection connection = null;
    private static String jdbdcURL = "jdbc:mysql://localhost:3306/company";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "admin";

    private static final String INSERT_EMPLOYEES_SQL = "INSERT INTO employees (name, email, position) VALUES"
            + "(?,?,?)";
    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT id, name, email, position FROM employees WHERE id = ?";
    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM employees";
    private static final String DELETE_EMPLOYEES_SQL = "DELETE FROM employees WHERE id = ?";
    private static final String UPDATE_EMPLOYEES_SQL = "UPDATE Employees SET name =? , email = ?, position =? WHERE id=?";

    protected static Connection getConnection() {
        connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbdcURL, jdbcUsername, jdbcPassword);
            System.out.println(connection.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertEmployee(Employee employee) throws SQLException {
        System.out.println(INSERT_EMPLOYEES_SQL);
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(INSERT_EMPLOYEES_SQL);) {

            ps.setString(1, employee.getName());
            ps.setString(2, employee.getEmail());
            ps.setString(3, employee.getPosition());
            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException sql) {
            printSQLException(sql);
        }
    }

    public Employee selectEmployee(int id) {
        Employee employee = null;

        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);) {

            ps.setInt(1, id);
            System.out.println(ps);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String position = rs.getString("position");
                employee = new Employee(id, name, email, position);
            }
        } catch (SQLException sql) {
            printSQLException(sql);

        }
        return employee;
    }

    public List<Employee> selectAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        Connection connection = null;
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_EMPLOYEES);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String position = rs.getString("position");
                employees.add(new Employee(id, name, email, position));
            }
        } catch (SQLException sql) {
            printSQLException(sql);

        }
        return employees;
    }

    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connectin = getConnection(); PreparedStatement ps = connection.prepareStatement(DELETE_EMPLOYEES_SQL);) {

            System.out.println(ps);

            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateEmployee(Employee employee) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_EMPLOYEES_SQL);) {
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getEmail());
            ps.setString(3, employee.getPosition());
            ps.setInt(4, employee.getId());
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
