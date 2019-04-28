/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.TeamDetailDTO;
import dbutil.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class TeamDetailDAO {
     private static PreparedStatement ps=null ;
    
    static {
         Connection conn= DBConnection.getConnction();
            try
            {
                String cmd="insert into studentdetail values(?,?,?,?,?,?,?,?)";
                //insert into studentdetail values('x','x','x','x','x','x','x','x');
                ps=conn.prepareStatement(cmd);
            }
            catch(SQLException ex){
                    System.out.println("Error in Conncection");
                    ex.printStackTrace();
                }
    }
     public static boolean insertUserData(TeamDetailDTO stuentDetail)throws SQLException 
    {
        ResultSet rs=null;
        boolean result=false;            
        ps.setString(1,stuentDetail.getUserid());
        ps.setString(2,stuentDetail.getEno());
        ps.setString(3,stuentDetail.getName());
        ps.setString(4,stuentDetail.getBranch());
        ps.setString(5,stuentDetail.getSemester());
        ps.setString(6,stuentDetail.getYear());
        ps.setString(7,stuentDetail.getCollage());
        ps.setString(8,stuentDetail.getCourse());
        int i=ps.executeUpdate();
        if(i!=0)
        {
            result=true;
        }
        return result;
    }
}
