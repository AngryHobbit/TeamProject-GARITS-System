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
    
    public boolean writeToDatabase(String Login,String password)
    {
        try
        {
            String db ="jdbc:mysql://localhost:8889/GARITS?zeroDateTimeBehavior=convertToNull";
            DBConnection = (Connection) DriverManager.getConnection(db,"root","root");
            System.out.println("Connection Passed");
            
            if(Login.equals("") || password.equals("")){
                JOptionPane.showMessageDialog(null,"Please Enter a Username and Passord into the fields");
                return false;
            }
            else
            {
                Statement sta = DBConnection.createStatement();
                String insert ="INSERT INTO Staff (Forename,Surname,JobRole,Login,Password) VALUES('Admin','Admin','Administrator','"+Login+"','"+password+"');";
                sta.executeUpdate(insert);
                JOptionPane.showMessageDialog(null,"Account has been Registered");
                System.out.println("Account has been registered");
                
                Login log = new Login();
                log.show();
                return true;
            }
            
        }
        catch(Exception e)
        {
           System.out.println(e);
        }
        return false;
    }
    
    
        //This is used to determine if the software should start with the login page or registration page.
    public void AdminCreation() {
        
        try {
            
            // Create a string value storing a sql statement.
            String Query = "Select Count(*) From Staff";
            
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

            if(record >= 1)
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
