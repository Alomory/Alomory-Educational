/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lab6.com.java;

import java.sql.*;

/**
 *
 * @author Omar Alomory(S63955)
 */
public class MarathonDAO {
    private Connection connection;
    private int result = 0;
    
    public MarathonDAO() throws ClassNotFoundException{
        connection = Database.getConnection();
    }
    
    public int addDetails(Marathon marathon){
        try{
            String mySQL = "INSERT INTO marathon (icno, name, category) VALUES (?,?,?)";
            PreparedStatement myStatement = connection.prepareStatement(mySQL);
            
            System.out.println("IC No   = "+marathon.getIcno());
            System.out.println("Name   = "+marathon.getName());
            System.out.println("Category   = "+marathon.getCategory());
            
            myStatement.setString(1, marathon.getIcno());
            myStatement.setString(2, marathon.getName());
            myStatement.setString(3, marathon.getCategory());
            
            this.result = myStatement.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return this.result;
    }
}
