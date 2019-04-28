/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import dbutil.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class MemberDetailDAO {
    private static PreparedStatement ps=null ;
    
    static {
         Connection conn= DBConnection.getConnction();
            try
            {
                String cmd="select*from";
                
                ps=conn.prepareStatement(cmd);
            }
            catch(SQLException ex){
                    System.out.println("Error in Conncection");
                    ex.printStackTrace();
                }
    }

}
