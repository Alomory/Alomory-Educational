/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lab6.com.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Omar Alomory(S63955)
 */
public class UserDatabaseConnections {
    private static Connection myConnection;
    private static String myURL ="jdbc:mysql://localhost/csflab6";
 
    
    public static Connection getConnection() throws ClassNotFoundException{
       if(myConnection != null){
           return myConnection;
       } else try{
           Class.forName("com.mysql.jdbc.Driver");
           myConnection = DriverManager.getConnection(myURL, "root", "admin");
       }catch(SQLException e){
            System.out.println(e.getMessage());
       }
       return myConnection;
    }
    
    public static void closeConnection(){
        try{
            myConnection.close();
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
    }
}
