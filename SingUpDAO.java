/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.SingUpDTO;
import dbutil.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author dell
 */
public class SingUpDAO {
    private static PreparedStatement ps=null ;
    private static Connection conn= DBConnection.getConnction();
    private static PreparedStatement ps2=null;
    static 
    {
        try
        {
            String cmd="insert into userlogin values(?,?,?,?)";
            String cmd2="insert into studentlog values(?,'no','no','no','no','no','no','no')";
            ps=conn.prepareStatement(cmd);
            ps2=conn.prepareStatement(cmd2);
            
        }
        catch (SQLException ex) {
            System.out.println("Error in Conncection");
            ex.printStackTrace();
        }
        
    }
    public static boolean insertUserData(SingUpDTO singup)throws SQLException 
    {
        ResultSet rs=null;
        boolean result=false;            
        ps.setString(1,singup.getUserid());
        ps.setString(2,singup.getUsertype());
        ps.setString(3,singup.getPassword());
        ps.setString(4,singup.getEmailid());
        ps2.setString(1, singup.getUserid());
        int i=ps.executeUpdate();
        int j=ps2.executeUpdate();
        if(i!=0&&j!=0)
        {
            result=true;
        }
        return result;
    }
}
