/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.reserve;
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
public class reserveDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/boat";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String INSERT_RESERVE_SQL = "INSERT INTO reserve(userid,startdate,enddate,size,boatid,operator,people,numboat) VALUES "+"(?,?,?,?,?,?,?,?);";
    private static final String SELECT_RESERVE_BY_ID = "select userid,startdate,enddate,size,boatid,operator,people,numboat from reserve where code=?";
    private static final String SELECT_ALL_RESERVE = "select * from reserve";
    private static final String DELETE_RESERVE_SQL = "delete from reserve where code=?;";
    private static final String UPDATE_RESERVE_SQL = "update reserve set userid=? startdate=? enddate=? size=? boatid=? operator=? people=? numboat=? where code=?;";
    
    public reserveDAO() {}
    
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
    
    public void insertReserve (reserve reserve) throws SQLException {
        System.out.println(INSERT_RESERVE_SQL);
        
        //try-with-resources statement will auto close the connection
        try (Connection connection = getConnection(); 
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_RESERVE_SQL)){
            preparedStatement.setString(1, reserve.getUserid());
            preparedStatement.setString(2, reserve.getStartdate());
            preparedStatement.setString(3, reserve.getEnddate());
            preparedStatement.setString(4, reserve.getSize());
            preparedStatement.setString(5, reserve.getBoatid());
            preparedStatement.setString(6, reserve.getOperator());
            preparedStatement.setInt(7, reserve.getPeople());
            preparedStatement.setInt(8, reserve.getNumboat());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            
        } catch (SQLException e){
            printSQLException(e);
        }
    }
    
    public reserve selectReserve(int code){
        reserve r = null;
        try (Connection connection = getConnection(); 
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RESERVE_BY_ID);){
            preparedStatement.setInt(1, code);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                r = new reserve();
               r.setUserid(rs.getString("userid"));
               r.setStartdate(rs.getString("startdate"));
               r.setEnddate( rs.getString("enddate"));
                r.setSize( rs.getString("size"));
               r.setBoatid(rs.getString("boatid"));
               r.setOperator(rs.getString("operator"));
                r.setPeople( rs.getInt("people"));
                r.setNumboat(rs.getInt("numboat"));
                
            }
        } catch (SQLException e){
            printSQLException(e);
        }
        return r;
    }
    
    public List < reserve > selectAllReserve() {
        List < reserve > reserve = new ArrayList< >();
        try (Connection connection = getConnection(); 
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RESERVE);){
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                reserve r = new reserve();
                r.setCode( rs.getInt("code"));
               r.setUserid(rs.getString("userid"));
               r.setStartdate(rs.getString("startdate"));
               r.setEnddate( rs.getString("enddate"));
                r.setSize( rs.getString("size"));
               r.setBoatid(rs.getString("boatid"));
               r.setOperator(rs.getString("operator"));
                r.setPeople( rs.getInt("people"));
                r.setNumboat(rs.getInt("numboat"));
                reserve.add(r);
            }
        }catch (SQLException e){
            printSQLException(e);
        }
        return reserve;
    }
    
    public boolean deleteReserve (int code) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); 
                PreparedStatement statement = connection.prepareStatement(DELETE_RESERVE_SQL);){
            statement.setInt(1, code);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    public boolean updateCar (reserve reserve) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); 
                PreparedStatement statement = connection.prepareStatement(UPDATE_RESERVE_SQL);){
            statement.setString(1, reserve.getUserid());
            statement.setString(2, reserve.getStartdate());
            statement.setString(3, reserve.getEnddate());
            statement.setString(4, reserve.getSize());
            statement.setString(5, reserve.getBoatid());
            statement.setString(6, reserve.getOperator());
            statement.setInt(7, reserve.getPeople());
            statement.setInt(8, reserve.getNumboat());
            
            rowUpdated = statement.executeUpdate()> 0;
        }
        return rowUpdated;
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


