/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class DBConnection {
    private static Connection conn;
    static{
            try
            {
                Class.forName("oracle.jdbc.OracleDriver");
                Class.forName("oracle.jdbc.OracleDriver");
                conn=DriverManager.getConnection("jdbc:oracle:thin:@//JuniorStark:1521/XE", "pms", "ayush");


            }
            catch(ClassNotFoundException ex)
            {
                ex.printStackTrace();
                System.out.println("Error in Class loading"); 
            } 
            catch (SQLException ex) {
                 System.out.println("Error in SQL ");
             }
    }
    public static Connection getConnction()
    {
        return conn;
    }
    /*public static void closeConncetion()
    {
        try
        {
            conn.close();
        } 
        catch (SQLException ex) {
            System.out.println("Connction cannot be close");
        }
    }*/
}
