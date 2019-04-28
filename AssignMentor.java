/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dbutil.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class AssignMentor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AssignMentor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AssignMentor at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
            
            
            
            String mentor=request.getParameter("mentor");
            String userid=request.getParameter("user");
        Connection conn=DBConnection.getConnction();
        try
        {
            PreparedStatement ps=conn.prepareStatement("update pdes set mentor=? where userid=?");
            PreparedStatement ps2=conn.prepareStatement("update studentlog set mentor =? where userid=?");
  
            ps.setString(1, mentor);
            ps.setString(2, userid);
            
            ps2.setString(1, mentor);
            ps2.setString(2, userid);
            
            int i=ps.executeUpdate();
            int j=ps2.executeUpdate();
            if(i!=0 &&j!=0)
            {
                System.out.println("value updated");
                response.sendRedirect("assignmentor.jsp");
            }
            else 
            {
                System.out.println("not update");
                response.sendRedirect("viewmantor.jsp");
            }
            
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
