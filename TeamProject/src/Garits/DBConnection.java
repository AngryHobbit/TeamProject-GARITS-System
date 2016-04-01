/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Garits;

import Garits.GUIForms.Login;
import Garits.GUIForms.StartUp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;



/**
 *
 * @author ZX-MAC
 */
public class DBConnection {

    private Connection DBConnection;

    public Connection connect() {
        
        boolean connected = false;
        
        String url = "jdbc:mysql://localhost:8889/GARITS?zeroDateTimeBehavior=convertToNull";
        
        if(connected == false){
        try
        {
            DBConnection = (Connection) DriverManager.getConnection(url,"root","root");
            //System.out.println("Database has been Connected");
            connected = true;
        }
        catch(SQLException se)
        {
            System.out.println("No Database " + se);
            try
            {
                DBConnection = (Connection) DriverManager.getConnection(url,"","");
                connected = true; 
                
            }
            catch(Exception e){
                
            }
        }
        }
        return DBConnection;
    }
    
    public void writeToDatabase(String Username,String password)
    {
        try
        {
            String db ="jdbc:mysql://localhost:8889/GARITS?zeroDateTimeBehavior=convertToNull";
            DBConnection = (Connection) DriverManager.getConnection(db,"root","root");
            System.out.println("Connection Passed");
            
            Statement sta = DBConnection.createStatement();
            String insert ="INSERT INTO User (Username,Password) VALUES('"+Username+"','"+password+"');";
            sta.executeUpdate(insert);
            
            //System.out.println("Account has been registered");
        }
        catch(Exception e)
        {
           System.out.println(e);
        }
    }
    
    
        //This is used to determine if the software should start with the login page or registration page.
    public void AdminCreation() {
        
        try {
            
            // Create a string value storing a sql statement.
            String Query = "Select Count(*) From User";
            
            //Store record number
            int record = 0;
            
            //Create a java Statement
            Statement st = DBConnection.createStatement();
            
            //Execute query and create result set
            ResultSet rs = st.executeQuery(Query);
            
            while(rs.next())
            {
                record = rs.getInt(1);
                
            }

            if(record == 1)
            {
                System.out.println("Login page has loaded up on screen");
                new Login().show();
            }
            else if(record == 0)
            {
                System.out.println("The system has loaded brand new to the registration page");
                new StartUp(null,true).show();
            }
            
        } catch (Exception e) {
            
            System.out.println(e);

        }
    }
}
