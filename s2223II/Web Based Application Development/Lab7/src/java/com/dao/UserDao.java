/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.model.User;
import com.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Omar Alomory(S63955)
 */
public class UserDao {

    private Connection connection;

    public UserDao() throws ClassNotFoundException {
        connection = DBConnection.getConnection();
    }

    public void addUser(User user) {
        try {
            String insertion = "INSERT INTO users(userid, firstname, lastname) VALUES (?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertion);

            preparedStatement.setString(1, user.getUserid());
            preparedStatement.setString(2, user.getFirstname());
            preparedStatement.setString(3, user.getLastname());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(String userid) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement
        ("DELETE FROM users WHERE userid= ?");
            preparedStatement.setString(1, userid);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updtateUser(User user){
        try{
            PreparedStatement preparedStatement = connection.prepareStatement
        ("UPDATE users SET firstname = ?, lastname = ?  WHERE userid = ?");
            preparedStatement.setString(1, user.getFirstname());
            preparedStatement.setString(2, user.getLastname());
            preparedStatement.setString(3, user.getUserid());
            preparedStatement.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public List<User> getAllUsers(){
        List<User> users = new  ArrayList<>();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement
        ("SELECT * FROM users");
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                User user = new User();
                user.setUserid(rs.getString(1));
                user.setFirstname(rs.getString(2));
                user.setLastname(rs.getString(3));
                users.add(user);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return users;
    }
    public User getUserById(String id){
        User user = new User();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement
        ("SELECT * FROM users WHERE userid = ?");
            preparedStatement.setString(1, id);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while(rs.next()){
                user.setUserid(rs.getString("userid"));
                user.setFirstname(rs.getString("firstname"));
                user.setLastname(rs.getString("lastname"));
            }
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        return user;
    }
}
