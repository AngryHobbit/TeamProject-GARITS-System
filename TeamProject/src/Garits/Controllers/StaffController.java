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

/**
 *
 * @author ZX-MAC
 */
public class StaffController {
    
    String Forename;
    String Surname;
    String JobRole;
    String LabourRate;
    String Login;
    String Password;
    
    Connection conn = new DBConnection().connect();
    
    private void GetStaffRecords()
    {
        try{
            
        Statement sta = conn.createStatement();
        String get = "Search * from Staff";
        sta.executeUpdate(get);
         ResultSet rs = sta.executeQuery(get);
        
         while(rs.next())
         {
             
         }
        }
        catch(Exception e)
        {
            
        }
    }
    
    public void AddANewUser(String forename,String surname,String JobRole,String LabourRate,String Login,String Password)
    {
        try
        {
        Statement sta = conn.createStatement();
        String insert = "INSERT INTO Staff (Forename,Surname,JobRole,Login,Password) VALUES('"+forename+"','"+surname+"','"+LabourRate+"','"+Login+"','"+Password+"');";
        sta.executeUpdate(insert);
        sta.executeBatch();
        }
        catch(Exception e)
        {
            
        }
    }
    
    
    
}
