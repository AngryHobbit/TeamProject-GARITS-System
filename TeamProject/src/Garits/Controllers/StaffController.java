/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Garits.Controllers;

import Garits.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author ZX-MAC
 */
public class StaffController {
    
  
    Connection conn = new DBConnection().connect();
    
    public void AddANewUser(String forename,String surname,String JobRole,String LabourRate,String Login,String Password)
    {
        try
        {
           
            if(Login.equals("") || Password.equals("")){
                JOptionPane.showMessageDialog(null,"Please Enter a username or password");
            }
            else
            { 
                Statement sta = conn.createStatement();
                String insert = "INSERT INTO Staff (Forename,Surname,JobRole,Login,Password) VALUES('"+forename+"','"+surname+"','"+LabourRate+"','"+Login+"','"+Password+"');";
                sta.executeUpdate(insert);
                System.out.println("The Admin has created a User Account");
            }
        }
        catch(Exception e)
        {
            
        }
    }
    
    
    
}
