/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.Model.Car;
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
public class CarDAO {

    private static Connection connection = null;
    private static String jdbdcURL = "jdbc:mysql://localhost:3306/company";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "admin";

    private static final String INSERT_CAR_SQL = "INSERT INTO carpricelist (Brand, Model, Cyclinder, Price) VALUES"
            + "(?,?,?,?)";
    private static final String SELECT_CAR_BY_ID = "SELECT Car_id, Brand, Model, Cyclinder, Price FROM carpricelist WHERE Car_id = ?";
    private static final String SELECT_ALL_CARS = "SELECT * FROM carpricelist";
    private static final String DELETE_CAR_SQL = "DELETE FROM carpricelist WHERE Car_id = ?";
    private static final String UPDATE_CAR_SQL = "UPDATE carpricelist SET Brand =? , Model = ?, Cyclinder =? ,Price =? WHERE Car_id=?";

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

    public void insertCar(Car car) throws SQLException {
        System.out.println(INSERT_CAR_SQL);
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(INSERT_CAR_SQL);) {

            ps.setString(1, car.getBrand());
            ps.setString(2, car.getModel());
            ps.setInt(3, car.getCyclinder());
            ps.setDouble(4, car.getPrice());
            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException sql) {
            printSQLException(sql);
        }
    }

    public Car selectCar(int id) {
        Car car = null;

        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(SELECT_CAR_BY_ID);) {

            ps.setInt(1, id);
            System.out.println(ps);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                car = new Car();
                car.setCarId(id);
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setCyclinder(rs.getInt("cyclinder"));
                car.setPrice(rs.getDouble("price"));

            }
        } catch (SQLException sql) {
            printSQLException(sql);

        }
        return car;
    }

    public List<Car> selectAllCars() {
        List<Car> cars = new ArrayList<>();
        Connection connection = null;
        try {
            connection = getConnection();
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CARS);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Car car = new Car();
                car.setCarId(rs.getInt("Car_id"));
                car.setBrand(rs.getString("brand"));
                car.setModel(rs.getString("model"));
                car.setCyclinder(rs.getInt("cyclinder"));
                car.setPrice(rs.getDouble("price"));
                cars.add(car);
            }
        } catch (SQLException sql) {
            printSQLException(sql);

        }
        return cars;
    }

    public boolean deleteCar(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connectin = getConnection(); PreparedStatement ps = connection.prepareStatement(DELETE_CAR_SQL);) {

            System.out.println(ps);

            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCar(Car car) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(UPDATE_CAR_SQL);) {
            ps.setString(1, car.getBrand());
            ps.setString(2, car.getModel());
            ps.setInt(3, car.getCyclinder());
            ps.setDouble(4, car.getPrice());
            ps.setInt(5, car.getCarId());
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
