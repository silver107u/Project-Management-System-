/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.AddmentorDAO;
import DTO.AddmentorDTO;
import java.io.IOException;
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
public class MentorDetailController extends HttpServlet {

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
        String userid=request.getParameter("userid");
        String usertype=request.getParameter("usertype");
        System.out.println(usertype);
        String name=request.getParameter("name");
        String expert = request.getParameter("expert");
        String designation=request.getParameter("designation");
        String password=request.getParameter("password");
        String emailid=request.getParameter("emailid"); 
            
        AddmentorDTO mentorDetail=new AddmentorDTO();

        mentorDetail.setUserid(userid);
        mentorDetail.setUsertype(usertype);
        mentorDetail.setName(name);
        mentorDetail.setExpert(expert);
        mentorDetail.setDesignation(designation);
        mentorDetail.setPassword(password);
        mentorDetail.setEmailid(emailid);
            
            HttpSession session=null;
            session=request.getSession();
            try
            {
                boolean result = AddmentorDAO.insertMentorData(mentorDetail);
                if(result ==true)
                {

                    System.out.println("success");
                    response.sendRedirect("admin.jsp");
                }
                else 
                {
                    System.out.println("unsuccess ");
                    response.sendRedirect("unsuccess.html");
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
