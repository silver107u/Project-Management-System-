/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.SingUpDAO;
import DAO.TeamDetailDAO;
import DTO.TeamDetailDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class TeamDetailControllerServlet extends HttpServlet {

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
        String collage = request.getParameter("collage");
	String course=request.getParameter("course");
        String name=request.getParameter("name");
        String branch=request.getParameter("branch"); 
        String eno=request.getParameter("eno");
        String sem=request.getParameter("sem");
        String year=request.getParameter("year");
        String userid=request.getParameter("userid");
        TeamDetailDTO studentDetail=new TeamDetailDTO();
        
        studentDetail.setCollage(collage);
        studentDetail.setCourse(course);
        studentDetail.setName(name);
        studentDetail.setBranch(branch);
        studentDetail.setEno(eno);
        studentDetail.setSemester(sem);
        studentDetail.setYear(year);
        studentDetail.setUserid(userid);
        HttpSession session=null;
        session=request.getSession();
      	try
        {
            boolean result = TeamDetailDAO.insertUserData(studentDetail);
            if(result ==true)
            {
               
                System.out.println("success");
                response.sendRedirect("success.html");
            }
            else 
            {
                System.out.println("unsuccess ");
                response.sendRedirect("s.html");
            }
        }
        catch(SQLException ex)
        {
            session.setAttribute("exception", ex);
            response.sendRedirect("error.jsp");
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
