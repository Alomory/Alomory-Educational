/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lab6.com.java;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Omar Alomory(S63955)
 */
public class UserDAO {
    private Connection connection;
    private int result = 0;
    public UserDAO() throws ClassNotFoundException{
        this.connection = UserDatabaseConnections.getConnection();
    }
    public int Register(User user) throws ClassNotFoundException{
        
        try{
            String mySQL = "INSERT INTO userprofile (username, password, firstname, lastname) VALUES (?,?,?,?)";
            PreparedStatement myStatement = connection.prepareStatement(mySQL);
            
            myStatement.setString(1, user.getUsername());
            myStatement.setString(2, user.getPassword());
            myStatement.setString(3, user.getFirstname());
            myStatement.setString(4, user.getLastname());
            
            return myStatement.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace(); 
        }
        return this.result;
    }
    public boolean login(User u) throws ClassNotFoundException {
        
        try {
            
            String sql = "SELECT * FROM userprofile WHERE username = ? AND password = ? ";
            
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, u.getUsername());
            statement.setString(2, u.getPassword());
            
            ResultSet output = statement.executeQuery();

            return output.next(); // Login successful
            // Login failed
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            // Login failed due to exception
            return false;
        }
    }
    public String getFullUserName(String username, String password){
        String fullName= "";
        try {
            
            String sql = "SELECT firstname, lastname FROM userprofile WHERE username = ? AND password = ? ";
            
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            
            ResultSet output = statement.executeQuery();
            System.out.println("username = " + username+", password = "+password);
             while(output.next()){
                 fullName = output.getString(1);
                 fullName += " "+output.getString(2);
             }
             System.out.println("username is = "+(String)fullName);
             return fullName;
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);  
        }
        return "could Not find anything";
    }
    
}
