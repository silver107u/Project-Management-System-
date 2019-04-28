/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.AddmentorDTO;
import dbutil.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class AddmentorDAO {
     private static PreparedStatement ps=null ;
     private static PreparedStatement ps2=null ;
     private static String usertype="mentor";
    // private static String emailid="kb@gmail.com";    
    static {
         Connection conn= DBConnection.getConnction();
            try
            {
                String cmd="insert into mentorlist values(?,?,?,?,?)";
                String cmd2="insert into userlogin values(?,?,?,?)";
                ps=conn.prepareStatement(cmd);
                ps2=conn.prepareStatement(cmd2);
            }
            catch(SQLException ex){
                    System.out.println("Error in Conncection");
                    ex.printStackTrace();
                }
    }
     public static boolean insertMentorData(AddmentorDTO mentorDetail)throws SQLException 
    {
        ResultSet rs=null;
        boolean result=false;            
       
        ps.setString(1,mentorDetail.getName());
        ps.setString(2,mentorDetail.getExpert());
        ps.setString(3,mentorDetail.getEmailid());
        ps.setString(4, mentorDetail.getDesignation());
        ps.setString(5, mentorDetail.getUserid());
        
        ps2.setString(1, mentorDetail.getUserid());
        ps2.setString(2, usertype);
        ps2.setString(3, mentorDetail.getPassword());
        ps2.setString(4, mentorDetail.getEmailid());
        int i=ps.executeUpdate();
        int j=ps2.executeUpdate();
        if(i!=0 && j!=0)
        {
            result=true;
        }
        return result;
    }
}
