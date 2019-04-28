/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import dbutil.DBConnection;
import DTO.LoginDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author dell
 */
public class LoginDAO {
    private static PreparedStatement ps=null ;
    private static Connection conn= DBConnection.getConnction();
    static {
            try
            {
                String cmd="select *from userlogin where userid=? and usertype=? and password=?";
                ps=conn.prepareStatement(cmd);
            }
            catch(SQLException ex){
                    System.out.println("Error in Conncection");
                    ex.printStackTrace();
                }
    }
    public static boolean validateUser(LoginDTO login )throws SQLException
    {
        ResultSet rs=null;
        boolean result=false;          
        ps.setString(1,login.getUserid());
        ps.setString(2, login.getUsertype());
        ps.setString(3, login.getPassword());
        rs=ps.executeQuery();
        if(rs.next())
        {
           result=true;
        }
        return result;
     } 
        
        
    }

