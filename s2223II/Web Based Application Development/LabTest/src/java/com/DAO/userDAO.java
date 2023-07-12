/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.catalina.User;

/**
 *
 * @author Omar Alomory(S63955)
 */
public class userDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/boat";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String INSERT_USER_SQL = "INSERT INTO user(id, name, gender, contact, ic, age, address, email) VALUES "+"(?,?,?,?,?,?,?,?);";
    private static final String SELECT_ALL_USER = "select * from carpricelist";
    private static final String DELETE_USER_SQL = "delete from carpricelist where id=?;";
   
    
    public userDAO() {}
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }
    
    public void insertUser (user user) throws SQLException {
        System.out.println(INSERT_USER_SQL);
        
        //try-with-resources statement will auto close the connection
        try (Connection connection = getConnection(); 
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)){
            preparedStatement.setString(1, user.getId());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getGender());
            preparedStatement.setString(4, user.getContact());
            preparedStatement.setInt(5, user.getIc());
            preparedStatement.setInt(6, user.getAge());
            preparedStatement.setString(7, user.getAddress());
            preparedStatement.setString(8, user.getEmail());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            
        } catch (SQLException e){
            printSQLException(e);
        }
    }
    
    
    public List < user > selectAllUser() {
        List < user > user = new ArrayList< >();
        try (Connection connection = getConnection(); 
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);){
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                user newUser = new user();
                newUser.setId( rs.getString("id"));
                newUser.setName( rs.getString("name"));
                newUser.setGender( rs.getString("gender"));
                newUser.setContact(rs.getString("contact"));
               newUser.setIc(rs.getInt("ic"));
                newUser.setAge(rs.getInt("age"));
                newUser.setAddress( rs.getString("address"));
                newUser.setEmail(rs.getString("email"));
                user.add(newUser);
            }
        }catch (SQLException e){
            printSQLException(e);
        }
        return user;
    }
    
    public boolean deleteUser (String id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); 
                PreparedStatement statement = connection.prepareStatement(DELETE_USER_SQL);){
            statement.setString(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex){
            if (e instanceof SQLException){
                e.printStackTrace(System.err);
                System.err.println("SQLState: " +((SQLException)e).getSQLState());
                System.err.println("Error Code: " +((SQLException)e).getErrorCode());
                System.err.println("Message: " +e.getMessage());
                Throwable t = ex.getCause();
                
                while (t != null){
                    System.out.println("Cause: " +t);
                    t = t.getCause();
                }
            }
        }
    }}


